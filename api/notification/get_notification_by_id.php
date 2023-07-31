<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://localhost:3456/api/notification/get_notification_by_id.php?userId=2

try {
    // Lấy categoryId từ query parameter của API
    $categoryId = $_GET['userId'];

    // Sử dụng Prepared Statements và đặt tên tham số là ":userId"
    $stmt = $dbConn->prepare(
    "SELECT 
        notifications.id, 
        notifications.newsId,
        notifications.userId,
        news.title, 
        news.image, 
        news.description, 
        news.categoryId 
    FROM 
        notifications 
    INNER JOIN 
        news  
    ON 
        notifications.newsId = news.id
    WHERE 
        notifications.userId = :userId"
    );

    // Truyền giá trị userId vào câu truy vấn
    $stmt->bindParam(":userId", $userId, PDO::PARAM_INT);

    // Thực thi câu truy vấn
    $stmt->execute();

    // Lấy một bản ghi duy nhất từ câu truy vấn (fetch_assoc sẽ lấy bản ghi đầu tiên)
    $notification = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Kiểm tra nếu có kết quả
    if ($notification) {
        echo json_encode(array(
            "status" => true,
            "message" => "Success",
            "favorites" => $notification
        ));
    } else {
        echo json_encode(array(
            "status" => false,
            "message" => "notification not found"
        ));
    }

} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
?>
