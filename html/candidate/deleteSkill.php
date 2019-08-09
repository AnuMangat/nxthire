<?php
require_once '../util/util.php';

$conn = connect_db();

$candidate_id = isset($_POST['candidate_id']) && (strlen($_POST['candidate_id'])>0) ? util__sanitizeMySQL($conn, $_POST['candidate_id']) : "";

$skill_id = isset($_POST['skill_id']) && (strlen($_POST['skill_id'])>0) ? util__sanitizeMySQL($conn, $_POST['skill_id']) : "";


$query = "DELETE FROM `candidate_skill` WHERE skill_id = $skill_id AND candidate_id = $candidate_id";

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