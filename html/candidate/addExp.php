<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_POST['userid']) && (strlen($_POST['userid']) > 0) ? util__sanitizeMySQL($conn, $_POST['userid']) : "";

$job_name = isset($_POST['job_name']) && (strlen($_POST['job_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['job_name']) : "";
$no_of_years = isset($_POST['no_of_years']) && (strlen($_POST['no_of_years']) > 0) ? util__sanitizeMySQL($conn, $_POST['no_of_years']) : "";
$description = isset($_POST['description']) && (strlen($_POST['description']) > 0) ? util__sanitizeMySQL($conn, $_POST['description']) : "";
$emp_name = isset($_POST['emp_name']) && (strlen($_POST['emp_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['emp_name']) : "";
$street_number = isset($_POST['street_number']) && (strlen($_POST['street_number']) > 0) ? util__sanitizeMySQL($conn, $_POST['street_number']) : "";
$street_name = isset($_POST['street_name']) && (strlen($_POST['street_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['street_name']) : "";
$city = isset($_POST['city']) && (strlen($_POST['city']) > 0) ? util__sanitizeMySQL($conn, $_POST['city']) : "";
$province = isset($_POST['province']) && (strlen($_POST['province']) > 0) ? util__sanitizeMySQL($conn, $_POST['province']) : "";
$postal_code = isset($_POST['postal_code']) && (strlen($_POST['postal_code']) > 0) ? util__sanitizeMySQL($conn, $_POST['postal_code']) : "";
$country = isset($_POST['country']) && (strlen($_POST['country']) > 0) ? util__sanitizeMySQL($conn, $_POST['country']) : "";

$supervisor_name = isset($_POST['supervisor_name']) && (strlen($_POST['supervisor_name']) > 0) ? util__sanitizeMySQL($conn, $_POST['supervisor_name']) : "";
$supervisor_email = isset($_POST['supervisor_email']) && (strlen($_POST['supervisor_email']) > 0) ? util__sanitizeMySQL($conn, $_POST['supervisor_email']) : "";
$supervisor_phone = isset($_POST['supervisor_phone']) && (strlen($_POST['supervisor_phone']) > 0) ? util__sanitizeMySQL($conn, $_POST['supervisor_phone']) : "";
$useforref = isset($_POST['useforref']) && (strlen($_POST['useforref']) > 0) ? util__sanitizeMySQL($conn, $_POST['useforref']) : "";
;

$address = array(
    "street_number" => $street_number,
    "street_name" => $street_name,
    "city" => $city,
    "province" => $province,
    "postal_code" => $postal_code,
    "country" => $country
);

$experience = array(
    "name" => $job_name,
    "description" => $description,
    "no_of_years" => $no_of_years,
    "company_name" => $emp_name,
    "supervisor_name" => $supervisor_name,
    "supervisor_phone" => $supervisor_phone,
    "supervisor_email" => $supervisor_email,
    "use_as_reference" => $useforref
);

$msg = "";
$resp = array();
$status = 200;

if (! validate_phone($supervisor_phone)) {
    $status = 400;
    $msg = "Phone not valid";
} else if (! validate_email($supervisor_email)) {
    $status = 400;
    $msg = "Invalid email";
} else if (strlen($job_name) == 0) {
    $status = 400;
    $msg = "Job title missing";
} else if (strlen($emp_name) == 0) {
    $status = 400;
    $msg = "Employer name missing";
}

if ($status != 200) {
    header("HTTP/1.1 $status $msg");
    $resp = array(

        "status" => $status,
        "message" => $msg
    );
} else {
    $user_session_info = util__get_session_info($conn, $userid);
    $address_id = util__insert_address($conn, $address, $resp);

   if(empty($resp)){
        $experience["company_address"] = $address_id;
        $experience["candidate_id"] = $user_session_info["userid"];

        insert_experience($conn, $experience, $resp);
    }
}

function validate_phone($phone)
{
    if (preg_match("~^\([0-9]{3}\)[- ][0-9]{3}-[0-9]{4}$~", $phone)) {
        return true;
    }
    return false;
}

function validate_email($email)
{
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    }
}

function insert_experience($conn, $experience, &$resp)
{
    $query = "INSERT INTO `candidate_experience`(
    
    `candidate_id`,
    `name`,
    `description`,
    `no_of_years`,
    `company_name`,
    `company_address`,
    `supervisor_name`,
    `supervisor_phone`,
    `supervisor_email`,
    `use_as_reference`
)
VALUES({$experience['candidate_id']},'{$experience['name']}','{$experience['description']}',
        {$experience['no_of_years']},'{$experience['company_name']}',{$experience['company_address']},
        '{$experience['supervisor_name']}','{$experience['supervisor_phone']}','{$experience['supervisor_email']}',
        {$experience['use_as_reference']}
  
)";

    if ($conn->query($query) === TRUE) {
        $msg = "Successfully added";
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
    return;
}
header("HTTP/1.1 {$resp['status']} {$resp['message']}");
echo json_encode($resp);

?>