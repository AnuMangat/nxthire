<?php
require_once '../util/util.php';

$conn = connect_db();
$resp = array();


$is_active = isset($_POST["is_active"]) ? $_POST["is_active"] : 1;
$job_id = isset($_POST["job_id"]) ? $_POST["job_id"] : - 1;


$resp = array();
if ($job_id < 0) {
    $resp = array(
        "status" => 400,
        "message" => "job id not definded"
    );
    echo json_encode($resp);
}

$query = "UPDATE `job_post` SET `is_active`={$is_active} WHERE id = {$job_id}";

$result = $conn->query($query);
if (! $result) {
    $resp = array(
        "status" => 500,
        "message" => $conn->error
    );
    echo json_encode($resp);
} else {
    $resp = array(
        "status" => 200,
        "message" => "Success"
    );
    echo json_encode($resp);
}

?>