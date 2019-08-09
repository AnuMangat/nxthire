<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_POST['userid']) && (strlen($_POST['userid']) > 0) ? util__sanitizeMySQL($conn, $_POST['userid']) : "";

$name = isset($_POST['skill_name']) && (strlen($_POST['skill_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['skill_name']) : "";

$description = isset($_POST['skill_description']) && (strlen($_POST['skill_description']) > 0) ? util__sanitizeMySQL($conn, $_POST['skill_description']) : "";

$query = "INSERT INTO `skill_set`(
    `name`,
    `description`
    
)
VALUES('$name','$description')";

$msg = "";
$skill_id = 0;

$resp = array();
if ($conn->query($query) === TRUE) {
    $skill_id = $conn->insert_id;
    $msg = "Success added";
} else {
    $msg = "Error: " . $query . "<br>" . $conn->error;
    $resp = array(
        "status" => 500,
        "message" => $msg
    );
}

if (empty($resp)) {
    
    $user_info = util__get_session_info($conn, $userid);
    $query = "INSERT INTO `candidate_skill`(`candidate_id`, `skill_id`) VALUES({$user_info['userid']},$skill_id)";

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
}
header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);

?>