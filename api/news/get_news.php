<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../../database/connection.php");
// http://localhost:3456/api/product/get_all_product.php

try {
    $result = $dbConn->query("SELECT id, title, image, description, categoryId FROM products");
    $news = $result->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(array(
        "status" => true,
        "message" => "Success",
        "news" => $news
    ));

} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
?>