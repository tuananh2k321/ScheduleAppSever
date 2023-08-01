<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://127.0.0.1:3456/api/services/get_confirm_service.php
try {
    //code...
    $service_confirm = $dbConn->query("SELECT id,studentCodeID,image,phoneNumber,service,note,quantity,mucdich,confirm FROM services where service='Giấy xác nhận sinh viên' ");
    $service_confirm = $service_confirm->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(array(
        "status" => true,
        "message" => "success",
        "service_student" => $service_confirm
    ));
} catch (\Throwable $th) {
    //throw $th;
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}

?>