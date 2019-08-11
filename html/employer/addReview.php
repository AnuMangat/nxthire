<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_POST['userid']) && (strlen($_POST['userid']) > 0) ? util__sanitizeMySQL($conn, $_POST['userid']) : "";

$company_id = isset($_POST['company_id']) && (strlen($_POST['company_id']) > 0) ? util__sanitizeMySQL($conn, $_POST['company_id']) : "";

$review = isset($_POST['review']) && (strlen($_POST['review']) > 0) ? util__sanitizeMySQL($conn, $_POST['review']) : "";

$rating = isset($_POST['rating']) && floatval($_POST['rating'] >0)? floatval($_POST['rating']) : "";


$msg = "";
$status = 200;
$resp = array();


    if (strlen($company_id) == 0) {
        $msg = "Company info not provided";
        $status = 400;
    } else if (strlen($review) == 0) {
        $msg = "Reviews not provided";
        $status = 400;
    } else if (strlen($rating) == 0) {
        $msg = "Rating not provided";
        $status = 400;
    } else if(!is_float($rating) || ($rating>5))
    {
        $msg = "Invalid rating" . $rating;
        $status = 400;
    }

    if ($status == 200) {

        $query = "INSERT INTO `company_reviews`(
    `company_id`,
    `reviews`,
    `rating`)
VALUES($company_id,'$review',$rating)";

        $msg = "";

        $resp = array();
        if ($conn->query($query) === TRUE) {
            $msg = "Success added";
            $resp = array(
                "status" => 200,
                "message" => $msg
            );
        } else {
            $msg = "Error: " . $query . "<br>" . $conn->error;
            $resp = array(
                "status" => 500,
                "message" => $msg
            );
        }
    } else {
        $resp = array(
            "status" => $status,
            "message" => $msg
        );
    }

header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);

?>