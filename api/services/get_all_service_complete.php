<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://127.0.0.1:3456/api/services/get_all_service_complete.php
try {
    //code...
    $service_complete = $dbConn->query("SELECT id,phoneNumber,service,quantity,mucdich,confirm FROM services");
    $service_complete = $service_complete->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(array(
        "status" => "success",
        "service_complete" => $service_complete
    ));
} catch (\Throwable $th) {
    //throw $th;
    echo json_encode(array(
        "status" => "error",
        "message" => $e->getMessage()
    ));
}

?>