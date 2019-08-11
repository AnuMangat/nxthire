<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_POST['userid']) && (strlen($_POST['userid']) > 0) ? util__sanitizeMySQL($conn, $_POST['userid']) : "";

$job_id = isset($_POST['jobid']) && (intval($_POST['jobid']) > 0) ? util__sanitizeMySQL($conn, $_POST['jobid']) : "";

$user_session_info = util__get_session_info($conn, $userid);

$msg = "";
$status = 200;
$resp = array();

if (empty($job_id) || $job_id < 0) {
    $status = 400;
    $msg = "Job id not defined";
}

if(empty($_FILES["resume"]["name"]))
{
    $status = 400;
    $msg = "Resume file not uploaded properly";
}

if ($status == 200) {
    $fileName = basename($_FILES["resume"]["name"]);
    $allowTypes = array(
        'doc',
        'docx',
        'pdf'
    );

    // if (move_uploaded_file($_FILES["resume"]["tmp_name"], $targetFilePath)) {
    $query = "INSERT INTO `job_candidate`(
    `job_id`,
     `candidate_id`,
    `resume`
)
VALUES($job_id,{$user_session_info['userid']},'$fileName')";

    if ($conn->query($query) === TRUE) {
        $msg = "Successfully applied";

        $status = 200;
    } else {
        $msg = "Error: " . $query . "<br>" . $conn->error;
        $status = 500;
    }
}

$resp = array(
    "status" => $status,
    "message" => $msg
);
header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);

?>