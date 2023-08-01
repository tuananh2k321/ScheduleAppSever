<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://127.0.0.1:3456/api/services/get_student_service.php
try {
    //code...
    $service_student = $dbConn->query("SELECT id,studentCodeID,image,phoneNumber,service,note,quantity FROM services where studentCodeID='ps1234' ");
    $service_student = $service_student->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(array(
        "status" => true,
        "message" => "success",
        "service_student" => $service_student
    ));
} catch (\Throwable $th) {
    //throw $th;
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}

?>