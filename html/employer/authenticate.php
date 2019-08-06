<?php
require_once '../util/util.php';

$conn = connect_db();


if (isset($_POST['userid']) && isset($_POST['password'])) {
    $rec_un = $_POST['userid'];
    $rec_pw = $_POST['password'];

    $un_temp = sanitizeMySQL($conn, $rec_un);
    $pw_temp = sanitizeMySQL($conn, $rec_pw);

    $query = "SELECT name,password,is_active,id FROM `employer_user` WHERE user_name = '$un_temp'";
    $result = $conn->query($query);
    if (! $result) {
        $resp = array(
            "status" => 500,
            "message" => $conn->error
        );
        echo json_encode($resp);
    } 
    else if ($result->num_rows) {
        $row = $result->fetch_array(MYSQLI_NUM);
        $name = $row[0];
        $pass = $row[1];
        $active = $row[2];
        $userid = $row[3];
        $result->close();

        if ($active == 0) {
            $resp = array(
                "status" => 400,
                "message" => "Inactive user"
            );
            echo json_encode($resp);
        }

        $salt1 = "qm&h*";
        $salt2 = "pg!@";
        $token = hash('ripemd128', "$salt1$pw_temp$salt2");

        if ($pass == $token) {
            session_start();
            $_SESSION['username'] = $un_temp;
            $_SESSION['password'] = $pw_temp;
            $_SESSION['name'] = $name;

            $check_insert = util__insert_session_info($conn, $un_temp, $userid, 0);
            if (! $check_insert) {
                $resp = array(
                    "status" => 500,
                    "message" => "INSERT query error" . $conn->error
                );
            } else {
                $resp = array(
                    "status" => 200,
                    "message" => ""
                );
            }

            echo json_encode($resp);
        } else {
            $resp = array(
                "status" => 400,
                "message" => "Invalid username/password combination"
            );
            echo json_encode($resp);
        }
    } else {
        $resp = array(
            "status" => 400,
            "message" => "Invalid username/password combination"
        );
        echo json_encode($resp);
    }
} else {
    // header('Location:signup.php');

    $conn->close();
}