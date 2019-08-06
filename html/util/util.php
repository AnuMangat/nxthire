<?php
require_once '../db_login/login.php';


function sanitizeString($var)
{
    $var = stripslashes($var);
    $var = strip_tags($var);
    $var = htmlentities($var);
    return $var;
}

function sanitizeMySQL($connection, $var)
{
    $var = $connection->real_escape_string($var);
    $var = sanitizeString($var);
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

function close_db_connection($conn)
{
    $conn->close();
}

function util__insert_session_info($conn,$un_temp,$userid,$is_candidate=1)
{
    $query = "INSERT INTO `user_session`(`user_id`,`is_candidate`) VALUES ($userid,$is_candidate)";
    $result   = $conn->query($query);
    
    if (!$result) 
    {
        return false;
    }
    
    return true;

    
}
function util__get_session_info($conn,$userid)
{
    $resp = array();
    $query = "SELECT * FROM `user_session` us

INNER JOIN employer_user eu 

ON us.user_id = eu.id
WHERE eu.user_name = '{$userid}'

UNION

(SELECT * FROM `user_session` us

INNER JOIN employer_user eu 

ON us.user_id = eu.id
WHERE eu.user_name = '{$userid}'
)

ORDER BY last_login DESC LIMIT 1";

    $result = $conn->query($query);

     if($result->num_rows)
    {
        $resp = $result->fetch_array(MYSQLI_NUM);
    }

    return $resp;
}
?>