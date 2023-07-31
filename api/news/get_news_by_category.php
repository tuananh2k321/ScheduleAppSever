<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");

// http://localhost:3456/api/news/get_news_by_category.php?categoryId=2

try {
    // Lấy categoryId từ query parameter của API
    $categoryId = $_GET['categoryId'];

    // Sử dụng Prepared Statements và đặt tên tham số là ":categoryId"
    $stmt = $dbConn->prepare(
        "SELECT 
            n.id, 
            n.name, 
            n.image, 
            n.description, 
            n.categoryId,
            c.name as categoryName  -- Lấy thông tin tên của category từ bảng categories
        FROM 
            news n
        INNER JOIN
            categories c
        ON 
            n.categoryId = c.id
        WHERE 
            n.categoryId = :categoryId"
    );

    // Truyền giá trị categoryId vào câu truy vấn
    $stmt->bindParam(":categoryId", $categoryId, PDO::PARAM_INT);

    // Thực thi câu truy vấn
    $stmt->execute();

    // Lấy kết quả từ câu truy vấn
    $news = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(array(
        "status" => true,
        "message" => "Success",
        "products" => $news
    ));

} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
?>
