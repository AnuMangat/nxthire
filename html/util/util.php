<?php
require_once '../db_login/login.php';


function util__sanitizeString($var)
{
    $var = stripslashes($var);
    $var = strip_tags($var);
    $var = htmlentities($var);
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
function util__get_session_info($conn,$user)
{
    $resp = array();
    $query = "(SELECT eu.id AS userid,us.id AS sessionid FROM `user_session` us

INNER JOIN employer_user eu 

ON us.user_id = eu.id
WHERE eu.user_name = '{$user}'
ORDER BY us.last_login DESC LIMIT 1
)
UNION

(SELECT eu.id AS userid,us.id AS sessionid FROM `user_session` us

INNER JOIN employer_user eu 

ON us.user_id = eu.id
WHERE eu.user_name = '{$user}'
ORDER BY us.last_login DESC LIMIT 1
)

";

    $result = $conn->query($query);
    
    if(!$result)
    {
        echo "Error:". $conn->error;
        return false;
    }
    


    $resp = $result->fetch_assoc();

    return $resp;
}
?>