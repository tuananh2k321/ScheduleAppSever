<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// url: http://127.0.0.1:3456/api/schudule/get-schedules.php?user_id=ps24513&type=1&date=2023-08-01
// type = 0: học, 1: thi
// date = yyyy-mm-dd

try {
    // đọc thông tin query từ request
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : "";
    $type = isset($_GET['type']) ? $_GET['type'] : 1;
    $date = isset($_GET['date']) ? $_GET['date'] : "";
    // kiểm tra dữ liệu
    if (empty($user_id)
            || !is_numeric($type) || ($type != 0 && $type != 1) 
            || empty($date)) {
        echo json_encode(array(
            "status" => false,
            "message" => "Invalid data"
        ));
        return;
    }
    // lấy dữ liệu từ database
    $query = "SELECT id, room, day, time, course_name, course_id, class_name, teacher_name, type, user_id, address
              FROM schedules WHERE user_id = :user_id AND type = :type AND day = :date";
    $stmt = $dbConn->prepare($query);
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->bindParam(':type', $type, PDO::PARAM_INT);
    $stmt->bindParam(':date', $date, PDO::PARAM_STR);
    $stmt->execute();
    $schedules = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // trả về dạng json
    echo json_encode(array(
        "status" => true,
        "data" => $schedules
    ));
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
