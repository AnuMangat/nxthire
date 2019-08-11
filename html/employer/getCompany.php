<?php
require_once '../util/util.php';

$conn = connect_db();


$resp= array();
$status = 200;
$msg = "";
    $query = "SELECT id,name FROM company WHERE is_active=1";
    $result = $conn->query($query);
    if (! $result) {
        $msg = "Select failed: $query<br>" . $conn->error . "<br><br>";
        $status = 500;
    }

    if ($status == 200) {
        if ($result->num_rows > 0) {

            $arr = array();
            while ($row = $result->fetch_assoc()) {
                array_push($arr,$row['id'] ."=>" .$row['name']);
//                 $msg .= $row['id'] . "=>" .$row['name'] .",";
            }
            $msg=  implode(",",$arr);


            $status = 200;
            $resp = array(
                "status" => $status,
                "message" => $msg
            );
        }
    }

header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);


?>