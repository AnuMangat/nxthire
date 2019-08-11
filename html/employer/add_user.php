<?php
require_once '../util/util.php';

$conn = connect_db();

$name = isset($_POST['name']) && (strlen($_POST['name']) > 0) ? util__sanitizeMySQL($conn, $_POST['name']) : "";

$uname = isset($_POST['uname']) && (strlen($_POST['uname']) > 0) ? util__sanitizeMySQL($conn, $_POST['uname']) : "";

$company_id = isset($_POST['company_id']) && (intval($_POST['company_id']) > 0) ? util__sanitizeMySQL($conn, $_POST['company_id']) : "";

$pswd = isset($_POST['pswd']) && (strlen($_POST['pswd']) > 0) ? util__sanitizeMySQL($conn, $_POST['pswd']) : "";

$salt1 = "qm&h*";
$salt2 = "pg!@";
$token = hash('ripemd128', "$salt1$pswd$salt2");

$emp = array(
    "name" => $name,
    "user_name" => $uname,
    "company_id" => $company_id,
    "password" => $token
);

$msg = "";
$resp = array();
$status = 200;
if (strlen($name) == 0) {
    $status = 400;
    $msg = "Name not provided";
} else if (strlen($uname) == 0) {
    $status = 400;
    $msg = "User Name not provided";
} else if (! validate_email($uname)) {
    $status = 400;
    $msg = "Invalid username. Should be an email.";
} else if (! username_unique($conn, $uname)) {
    $status = 400;
    $msg = "Username already exists";
} else if (strlen($pswd) == 0) {
    $status = 400;
    $msg = "Password not valid";
}

if ($status == 200) {
    $emp_id = insert_emp($conn, $emp, $resp);

    if (empty($resp)) {
        if (! util__insert_session_info($conn, $emp_id)) {
            $status = 500;
            $msg = "Error inserting session info";
            $resp = array(
                "status" => $status,
                "message" => $msg
            );
        }
    }
} else {
    $resp = array(
        "status" => $status,
        "message" => $msg
    );
}
header("HTTP/1.1 {$resp['status']} {$resp['message']}");

echo json_encode($resp);

function validate_email($email)
{
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    }

    return false;
}

function username_unique($conn, $uname)
{
    $query = "SELECT count(*) AS the_count FROM employer_user WHERE user_name = '$uname' ";

    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($row['the_count'] != 0) {

            return false;
        }
    }

    return true;
}

function insert_emp($conn, $emp, &$resp)
{
    $id = 0;
    $query = "INSERT INTO `employer_user`(

    `name`,
    `company_id`,
    `user_name`,
    `password`,
    `recent_session_id`


)
VALUES('{$emp['name']}','{$emp['company_id']}','{$emp['user_name']}','{$emp['password']}',1)";

    if ($conn->query($query) === TRUE) {
        $id = $conn->insert_id;
    } else {
        $msg = "Error: " . $query . "<br>" . $conn->error;
        $resp = array(
            "status" => 500,
            "message" => $msg
        );
    }
    return $id;
}

?>