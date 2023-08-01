<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://localhost:3456/api/user/login.php



try {
    $body = json_decode(file_get_contents("php://input"));

    $email = $body->email;
    $address = $body->address;

    if (empty($email) || empty($address)) {
        echo json_encode(array(
            "message" => "empty",
            "email" =>$email,
            "address" =>$address,
       ));
    }

    $user = $dbConn->query("SELECT address, email, studentCode FROM users WHERE email = '$email' and address = '$address'");

    if ($user->rowCount() > 0) {
        $row = $user->fetch(PDO::FETCH_ASSOC);
        $email = $row['email'];
        $address = $row['address'];
        $studentCode = $row['studentCode'];

            // lưu thông tin đăng nhập vào session
            echo json_encode(array(
                "status" => true,
                "message" =>"success",
                "email" =>$email,
                "studentCode" =>$studentCode
        ));
    } else {
        echo json_encode(array(
            "status" => false,
            "message" => "incorrect password or email",
       ));
    }
} catch (Exception $e) {

}

?>