<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://localhost:3456/api/notification/add_notification.php?userId=ps24524&newsId=1

try {
    // Lấy User_ID và Product_ID từ query parameters của API
    $newsId = $_GET['newsId'];
    $userId = $_GET['userId'];


    // Kiểm tra xem sản phẩm đã được yêu thích trước đó hay chưa (nếu có, không thêm vào lại)
    $stmt_check = $dbConn->prepare(
        "SELECT newsId, userId FROM notifications WHERE newsId = :newsId and userId = :userId "
    );

    $stmt_check->bindParam(":newsId", $newsId, PDO::PARAM_INT);
    // $stmt_check->bindParam(":serviceId", $serviceId, PDO::PARAM_INT);
    // $stmt_check->bindParam(":scheduleId", $scheduleId, PDO::PARAM_INT);
    $stmt_check->bindParam(":userId", $userId, PDO::PARAM_STR); // Use PARAM_STR for VARCHAR column
    $stmt_check->execute();

    // Lấy một bản ghi duy nhất từ câu truy vấn (fetch sẽ lấy bản ghi đầu tiên)
    $existing = $stmt_check->fetch(PDO::FETCH_ASSOC);

    if ($existing) {
        echo json_encode(array(
            "status" => false,
            "message" => "notification is already in the notification list"
        ));
    } else {
        // Thêm sản phẩm vào danh sách yêu thích của người dùng
        $stmt_add = $dbConn->prepare(
            "INSERT INTO notifications (userId, newsId) VALUES (:userId, :newsId)"
        );

        $stmt_add->bindParam(":userId", $userId, PDO::PARAM_STR); // Use PARAM_STR for VARCHAR column
        $stmt_add->bindParam(":newsId", $newsId, PDO::PARAM_INT);
        // $stmt_add->bindParam(":serviceId", $newsId, PDO::PARAM_INT);
        // $stmt_add->bindParam(":scheduleId", $newsId, PDO::PARAM_INT);
        $stmt_add->execute();

        echo json_encode(array(
            "status" => true,
            "message" => "add to notification successfully",
            "newsId" => $newsId,
            "userId" => $userId,
            // "serviceId" => $serviceId,
            // "scheduleId" => $scheduleId
        ));
    }
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
?>
