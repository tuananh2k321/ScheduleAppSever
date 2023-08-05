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
    $name = $body->name;
    $address = $body->address;

     // nếu ko nhập email || name thì trả về false
     if (empty($email) || empty($name) || empty($address)) {
        echo json_encode(array(
            "status" => false,
            "message" => "Email or name is empty"
        ));
        return;
    }

    $avatar = "";
    // cắt chuỗi từ @ trở về trước 7 kí tự
    $substring = strstr($email, "@", true);
    $studentCode = substr($substring, -7);

    $user = $dbConn->query("SELECT address, email, name , studentCode
    FROM users WHERE email = '$email' ");

    

    if ($user->rowCount() <= 0) {
        // nếu email chưa tồn tại thì thêm vào database
        $dbConn->query("insert into users (name, email, 
        avatar, studentCode, address) 
        values ('$name', '$email', '$avatar', '$studentCode', 
        '$address')");


        $user = $dbConn->query("SELECT email, avatar,
                    studentCode, address, name 
                    FROM users where email='$email'and address = '$address'");

    }

    // lấy thông tin user
    $row = $user->fetch(PDO::FETCH_ASSOC);
    $email = $row['email'];
    // $avatar = $row['avatar'];
    $studentCode = $row['studentCode'];
    $address = $row['address'];
    // trả về thông tin user dưới dạng json
    echo json_encode(array(
        "status" => true,
        "user" => array(
            "email" => $email,
            "avatar" => $avatar,
            "studentCode" => $studentCode,
            "address" => $address,
        ),
    ));
    
    
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}

?>