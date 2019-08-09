<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_POST['userid']) && (strlen($_POST['userid']) > 0) ? util__sanitizeMySQL($conn, $_POST['userid']) : "";

$name = isset($_POST['degree_name']) && (strlen($_POST['degree_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['degree_name']) : "";

$description = isset($_POST['degree_description']) && (strlen($_POST['degree_description']) > 0) ? util__sanitizeMySQL($conn, $_POST['degree_description']) : "";

$college = isset($_POST['college']) && (strlen($_POST['college']) > 0) ? util__sanitizeMySQL($conn, $_POST['college']) : "";

$is_grad = isset($_POST['is_grad']) && (strlen($_POST['is_grad']) > 0) ? util__sanitizeMySQL($conn, $_POST['is_grad']) : "";

$user_session_info  = util__get_session_info($conn, $userid);
$query = "INSERT INTO `candidate_education`(
    `name`,
    `description`,
    `college`,
    `is_graduate`,
    `candidate_id`
)
VALUES('$name','$description','$college',$is_grad,{$user_session_info['userid']})";

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


header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);

?>