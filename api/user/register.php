<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://localhost:3456/api/user/register.php

try {
    $body = json_decode(file_get_contents("php://input"));

    $email = $body->email;
    $address = $body->address;
    $name = $body->name;
    $avatar = $body->avatar;
    $studentCode = $body->studentCode;

    if (empty($email) || empty($address) || empty($name) || empty($avatar) || empty($studentCode) ) {
        echo json_encode(array(
            "message" => "empty",
            "email" => $email,
            "name" => $name,
            "avatar" => $avatar,
            "studentCode" => $studentCode,
       ));
       return ;
    }

    $userEmail = $dbConn->query("SELECT email FROM users WHERE email = '$email'");
    // $userPhoneNumber = $dbConn->query("SELECT id FROM users WHERE phoneNumber = '$phoneNumber'");

    if ($userEmail->rowCount() > 0) {
        echo json_encode(array(
            "status" => false,
            "message" => "Email already exists",
        ));
    } else {
        $dbConn->query("INSERT INTO users (studentCode, email, avatar, address, name) 
        VALUES ('$studentCode','$email', '$avatar', '$address', '$name')");
        echo json_encode(array(
            "status" => true,
            "message" => "Success",
            "studentCode" => $studentCode,
            "email" => $email,
            "avatar" => $avatar,
            "address" => $address,
            "name" => $name,
        
        ));
    }

} catch (Exception $e) {
    echo json_encode(array(
        "message" => $e
   ));
}
