<?php
require_once '../util/util.php';

$conn = connect_db();

$candidate_id = isset($_POST['candidate_id']) && (strlen($_POST['candidate_id'])>0) ? util__sanitizeMySQL($conn, $_POST['candidate_id']) : "";

$edu_id = isset($_POST['edu_id']) && (strlen($_POST['edu_id'])>0) ? util__sanitizeMySQL($conn, $_POST['edu_id']) : "";


$query = "DELETE FROM `candidate_education` WHERE id = $edu_id AND candidate_id = $candidate_id";

$result = $conn->query($query);
if (! $result) {
    $resp = array(
        "status" => 500,
        "message" => $conn->error
    );
} 
else
{
    $resp = array(
        "status" => 200,
        "message" => ""
    );


}
header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);
    
?>