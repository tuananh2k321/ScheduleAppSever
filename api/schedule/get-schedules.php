<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// url: http://127.0.0.1:3456/api/get-schedules.php?user_id=1&type=1&date=2023-02-11
// type = 0: học, 1: thi
// date = yyyy-mm-dd

try {
    // đọc thông tin query từ request
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : -1;
    $type = isset($_GET['type']) ? $_GET['type'] : 1;
    $date = isset($_GET['date']) ? $_GET['date'] : "";
    // kiểm tra dữ liệu
    if ($user_id == -1 || !is_numeric($user_id) 
            || !is_numeric($type) || ($type != 0 && $type != 1) 
            || empty($date)) {
        echo json_encode(array(
            "status" => false,
            "message" => "Invalid data"
        ));
        return;
    }
    // lấy dữ liệu từ database
    $result = $dbConn->query(" SELECT id, room, day, time, course_name, course_id,
    class_name, teacher_name, type, user_id, address
     FROM schedules where user_id=$user_id and type=$type and day='$date' ");
    $schedules = $result->fetchAll(PDO::FETCH_ASSOC);
    // trả về dạng json
    echo json_encode(array(
        "status" => true,
        "data" => $schedules
    ));
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $th->getMessage()
    ));
}
