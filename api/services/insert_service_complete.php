<?php
//// http://127.0.0.1:3456/api/services/insert_service_complete.php
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
        $date = $body->date;
        $confirm = $body->confirm;
        $thongbao = $body->thongbao;
        $studentCodeID = $body->studentCodeID;
        


        if( empty($service) || empty($date) || empty($confirm) || empty($thongbao) || empty($studentCodeID) ){
            echo json_encode(array(
                "status" => false
            ));
            return;
        }

        $sql = "INSERT INTO servicecomplete (service, date, confirm, thongbao,studentCodeID)
        VALUES ('$service', '$date', '$confirm', '$thongbao', '$studentCodeID')";
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
            "status" => false,
            "messages" =>"Lỗi không đúng dữ liệu"
        ));
    }
}
?>