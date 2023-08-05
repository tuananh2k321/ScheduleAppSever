<?php
//// http://127.0.0.1:3456/api/services/insert_bandiem_service.php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        //code...
        $body = json_decode(file_get_contents("php://input"));
        $service = $body->service;
        $studentCodeID = $body->studentCodeID;
        $phoneNumber = $body->phoneNumber;
        $note = $body->note;
        $quantity = $body->quantity;


        if( empty($service) || empty($studentCodeID) || empty($phoneNumber) || empty($quantity) ){
            echo json_encode(array(
                "status" => "error", 
                "message" => "không nhập đủ thông tin"
            ));
            return;
        }

        $sql = "INSERT INTO services (studentCodeID, phoneNumber, service,quantity,note)
        VALUES ('$studentCodeID', '$phoneNumber', '$service', '$quantity', '$note')";
    if ($dbConn->query($sql) == TRUE) {
        echo json_encode(array(
            "status" => "success", 
            "message" => "Dữ liệu đã được chèn thành công."
        ));
        } else {
            echo json_encode(array(
                    "status" => "error",
                     "message" => "Lỗi khi chèn dữ liệu" 
            ));
        }
        
    } catch (\Throwable $th) {
        //throw $th;
        echo json_encode(array(
            "status" => "error",
            "messages" =>"Lỗi không đúng dữ liệu"
        ));
    }
}
?>