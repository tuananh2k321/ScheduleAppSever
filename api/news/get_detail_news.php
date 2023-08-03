<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://localhost:3456/api/news/get_detail_news.php?newsId=2

try {
    // Lấy id từ query parameter của API
    $newsId = $_GET['newsId'];

    // Sử dụng Prepared Statements và đặt tên tham số là ":productId"
    $stmt = $dbConn->prepare(
        "SELECT 
            id, 
            title, 
            detail,  
            image, 
            categoryId 
        FROM 
            news
        WHERE 
            id = :newsId"
    );

    // Truyền giá trị categoryId vào câu truy vấn
    $stmt->bindParam(":newsId", $newsId, PDO::PARAM_INT);

    // Thực thi câu truy vấn
    $stmt->execute();

    // Lấy một bản ghi duy nhất từ câu truy vấn (fetch_assoc sẽ lấy bản ghi đầu tiên)
    $news = $stmt->fetch(PDO::FETCH_ASSOC);

    // Kiểm tra nếu có kết quả
    if ($news) {
        echo json_encode(array(
            "status" => true,
            "message" => "Success",
            "oneNews" => $news
        ));
    } else {
        echo json_encode(array(
            "status" => false,
            "message" => "Product not found"
        ));
    }

} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
?>
