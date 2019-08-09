<?php
require_once '../util/util.php';

$conn = connect_db();

$name = isset($_POST['name']) && (strlen($_POST['name']) > 0) ? util__sanitizeMySQL($conn, $_POST['name']) : "";

$uname = isset($_POST['uname']) && (strlen($_POST['uname']) > 0) ? util__sanitizeMySQL($conn, $_POST['uname']) : "";

$email = isset($_POST['email']) && (strlen($_POST['email']) > 0) ? util__sanitizeMySQL($conn, $_POST['email']) : "";

$street_number = isset($_POST['street_number']) && (strlen($_POST['street_number']) > 0) ? util__sanitizeMySQL($conn, $_POST['street_number']) : "";

$street_name = isset($_POST['street_name']) && (strlen($_POST['street_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['street_name']) : "";

$city = isset($_POST['city']) && (strlen($_POST['city']) > 0) ? util__sanitizeMySQL($conn, $_POST['city']) : "";

$province = isset($_POST['province']) && (strlen($_POST['province']) > 0) ? util__sanitizeMySQL($conn, $_POST['province']) : "";

$country = isset($_POST['country']) && (strlen($_POST['country']) > 0) ? util__sanitizeMySQL($conn, $_POST['country']) : "";

$postal_code = isset($_POST['postal_code']) && (strlen($_POST['postal_code']) > 0) ? util__sanitizeMySQL($conn, $_POST['postal_code']) : "";

$phone = isset($_POST['phone']) && (strlen($_POST['phone']) > 0) ? util__sanitizeMySQL($conn, $_POST['phone']) : "";

$pswd = isset($_POST['pswd']) && (strlen($_POST['pswd']) > 0) ? util__sanitizeMySQL($conn, $_POST['pswd']) : "";

$address = array(
    "street_number" => $street_number,
    "street_name" => $street_name,
    "city" => $city,
    "province" => $province,
    "postal_code" => $postal_code,
    "country" => $country
);

$salt1 = "qm&h*";
$salt2 = "pg!@";
$token = hash('ripemd128', "$salt1$pswd$salt2");

$candidate = array(
    "name" => $name,
    "uname" => $uname,
    "email" => $email,
    "phone" => $phone,
    "address" => "",
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
} else if (! validate_email($email)) {
    $status = 400;
    $msg = "Invalid email";
} else if ($uname != $email) {
    $status = 400;
    $msg = "Email and username should be same";
} else if (! username_unique($conn, $uname)) {
    $status = 400;
    $msg = "Username already exists";
} else if (strlen($street_number) == 0) {
    $status = 400;
    $msg = "Street Number not provided";
} else if (strlen($street_name) == 0) {
    $status = 400;
    $msg = "Street Name not provided";
} else if (strlen($city) == 0) {
    $status = 400;
    $msg = "City not provided";
} else if (strlen($province) == 0) {
    $status = 400;
    $msg = "Province not provided";
} else if (strlen($country) == 0) {
    $status = 400;
    $msg = "Country not provided";
} else if (strlen($postal_code) == 0) {
    $status = 400;
    $msg = "Postal Code not provided";
} else if (! validate_phone($phone)) {
    $status = 400;
    $msg = "Phone not valid";
} else if (strlen($pswd) == 0) {
    $status = 400;
    $msg = "Password not valid";
}

if ($status != 200) {
    header("HTTP/1.1 $status $msg");
    $resp = array(
  
        "status" => $status,
        "message" => $msg
    );
    echo json_encode($resp);
} else {

    $address_id = util__insert_address($conn, $address, $resp);
    $candidate_id = 0;
    if (! empty($resp)) {
        header("HTTP/1.1 {$resp['status']} {$resp['message']}");
        echo json_encode($resp);
    } else {
        $candidate["address_id"] = $address_id;
        $candidate_id = insert_candidate($conn, $candidate, $resp);
    }

    if (! empty($resp)) {
        header("HTTP/1.1 {$resp['status']} {$resp['message']}");
        echo json_encode($resp);
    } else {
        if (! util__insert_session_info($conn, $candidate_id)) {
            header('HTTP/1.1 500 Error inserting session info');
            $resp = array(
                "status" => 500,
                "message" => "Error inserting session info"
            );
        }
    }

    if (empty($resp)) {
        header("HTTP/1.1 200");
        $resp = array(
            "status" => 200,
            "message" => ""
        );
    }
    echo json_encode($resp);
}

function validate_email($email)
{
  
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    }

    return false;
}

function username_unique($conn, $uname)
{
    $query = "SELECT count(*) AS the_count FROM candidate WHERE user_name = '$uname' ";

    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($row['the_count'] != 0) {

            return false;
        }
    }

    return true;
}

function validate_phone($phone)
{
    if (preg_match("~^\([0-9]{3}\)[- ][0-9]{3}-[0-9]{4}$~", $phone)) {
        return true;
    }
    return false;
}



function insert_candidate($conn, $candidate, &$resp)
{
    $id = 0;
    $query = "INSERT INTO `candidate`(

    `name`,
    `address_id`,
    `email`,
    `phone`,
    `recent_session_id`,
    `user_name`,
    `password`

)
VALUES('{$candidate['name']}','{$candidate['address_id']}','{$candidate['email']}',
'{$candidate['phone']}',1,'{$candidate['uname']}','{$candidate['password']}')";

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