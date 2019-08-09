<?php
require_once '../util/util.php';

$conn = connect_db();


if (isset($_POST['userid']) && isset($_POST['password'])) {
    $rec_un = $_POST['userid'];
    $rec_pw = $_POST['password'];

    $un_temp = util__sanitizeMySQL($conn, $rec_un);
    $pw_temp = util__sanitizeMySQL($conn, $rec_pw);

    $query = "SELECT name,password,is_active,id FROM `employer_user` WHERE user_name = '$un_temp'";
    $result = $conn->query($query);
    if (! $result) {
        $msg = $conn->error;
   
        header("HTTP/1.1 500 $msg");
        $resp = array(
            "status" => 500,
            "message" => $msg
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
            $msg = "Inactive user";
            
            header("HTTP/1.1 400 $msg");
            $resp = array(
                "status" => 400,
                "message" => $msg
            );
            echo json_encode($resp);
        }

        $salt1 = "qm&h*";
        $salt2 = "pg!@";
        $token = hash('ripemd128', "$salt1$pw_temp$salt2");
        $session_id ="";

        if ($pass == $token) {
            session_start();
            $_SESSION['username'] = $un_temp;
            $_SESSION['password'] = $pw_temp;
            $_SESSION['name'] = $name;

            $check_insert = util__insert_session_info($conn, $userid,0);
            if (! $check_insert) {
                $msg = "INSERT query error" . $conn->error;

                $resp = array(
                    "status" => 500,
                    "message" => $msg
                );
            } else {
               
                $resp = array(
                    "status" => 200,
                    "message" => ""
                );
            }
            
            header("HTTP/1.1 {$resp['status']} {$resp['message']}");
            echo json_encode($resp);
        } else {
      
            $resp = array(
                "status" => 400,
                "message" => $msg
            );
            echo json_encode($resp);
        }
    } else {
        $msg = "Invalid username/password combination";
        $resp = array(
            "status" => 400,
            "message" => $msg
        );
        header("HTTP/1.1 {$resp['status']} {$resp['message']}");
        echo json_encode($resp);
    }
} else {
    // header('Location:signup.php');

    $conn->close();
}