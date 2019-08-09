<?php
require_once '../db_login/login.php';

function util__sanitizeString($var)
{
    $var = stripslashes($var);
    $var = strip_tags($var);
    $var = htmlentities($var);
    $var = trim($var);
    return $var;
}

function util__sanitizeMySQL($connection, $var)
{
    $var = $connection->real_escape_string($var);
    $var = util__sanitizeString($var);
    return $var;
}

function connect_db()
{
    global $hn;
    global $un;
    global $pw;
    global $db;

    $conn = new mysqli($hn, $un, $pw, $db);
    if ($conn->connect_error) {
        die($conn->connect_error);
    }

    return $conn;
}

function util__close_db_connection($conn)
{
    $conn->close();
}

function util__insert_session_info($conn, $userid, $is_candidate = 1)
{
    $query = "INSERT INTO `user_session`(`user_id`,`is_candidate`) VALUES ($userid,$is_candidate)";
    if ($conn->query($query) === TRUE) {
        $id = $conn->insert_id;

        if (! util__update_recent_info($conn, $userid, $id, $is_candidate)) {
            return false;
        }
    } else {
        return false;
    }
    return true;
}

function util__get_session_info($conn, $user)
{
    $resp = array();
    $query = "(SELECT eu.id AS userid,us.id AS sessionid FROM `user_session` us

INNER JOIN employer_user eu 

ON us.user_id = eu.id
WHERE eu.user_name = '$user'
ORDER BY us.last_login DESC LIMIT 1
)
UNION

(SELECT c.id AS userid,us.id AS sessionid FROM `user_session` us

INNER JOIN candidate c 

ON us.user_id = c.id
WHERE c.user_name = '$user'
ORDER BY us.last_login DESC LIMIT 1
 )
 

";

    $result = $conn->query($query);

    if (! $result) {
        echo "Error:" . $conn->error;
        return false;
    }

    $resp = $result->fetch_assoc();

    return $resp;
}

function util__update_recent_info($conn, $userid, $session_id, $candidate = 1)
{
    $query = "";
    if ($candidate == 1) {
        $query = "UPDATE  `candidate` SET  `recent_session_id` = $session_id WHERE id=$userid";
    } else {
        $query = "UPDATE  `employer_user` SET  `recent_session_id` = $session_id WHERE id=$userid";
    }

    $result = $conn->query($query);
    if (! $result) {
        return false;
    }
    return true;
}

function util__insert_address($conn, $address, &$resp)
{
    $id = 0;

    if (strlen($address['street_number']) > 3) {
        $msg = "Error: street number too big" ;
        $resp = array(
            "status" => 400,
            "message" => $msg
        );
        return - 1;
    }

    $query = "INSERT INTO `address`(
    `street_number`,
    `street_name`,
    `city`,
    `province`,
    `country`,
    `postal_code`
)
VALUES('{$address['street_number']}','{$address['street_name']}','{$address['city']}',
'{$address['province']}','{$address['country']}','{$address['postal_code']}')";

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