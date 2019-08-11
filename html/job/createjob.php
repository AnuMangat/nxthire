<!DOCTYPE html>
<html lang="en">
<head>
<div id="header"></div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/nxthire/js/login_replace.js"></script>

<script>

        function show_location()
        {
      	  $("#location_disp").val($("#location option:selected" ).text());
        }
        
      function show_salary_range()
      {
    	  
    	  $("#salary_disp").val($("#salary_range_drp option:selected" ).text());
  	  
    	  
      }               	 
       
    

     function show_job_type()
     {
    	 
	      $("#job_type_disp").val($("#job_type_drp option:selected" ).text());
     }


     function show_skill()
     {
         var selected_option = [];
         
        $("#skill_drp").click(function(){
 
    	 $('#skill_drp > option:selected').each(function() {
    		 if(jQuery.inArray($(this).text(), selected_option) <0) {
        		 selected_option.push($(this).text());
    			} 
        	 


    	 })

    	 if(selected_option.length>0)
    	 {
    		 $("#skill_disp").val(selected_option.toString());;
    	 }
    	 
        });
     }	 
      
  

     function pass_job_description(){
         $('#job_desc').val($('#jobdescription').val());
        
         
     }

     

     function show_error_insert_msg(msg,email)
     {
    	 alert(msg);
    	 window.location.href = "createjob.php?userid="+email;
     }


	</script>
</head>
<body>

<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = "";
$user_email = "";
if (isset($_GET['userid'])) {
    $userinfo_arr = util__get_session_info($conn, $_GET['userid']);
    $userid = $userinfo_arr['userid'];
    $user_email = $_GET['userid'];
}

if (isset($_POST['create']) && $_POST['create'] == 1) {
    
    insert_job($conn);
} else {

    $salary_ranges = get_salary_ranges($conn);
    $job_types = get_job_type($conn);
    $skills = get_skills($conn);
    $locations = get_location($conn);

    echo <<<_END


<div class="container">
  <h2>Add New Job:</h2>

<form method="post" action="createjob.php" onsubmit="pass_job_description();">
    <div class="form-group">
      <label for="jobTitle">Job Title:</label>
      <input type="text" class="form-control" id="title" name="title">
    </div> 
 <div class="form-group">
    <label for="jobDescription">Description</label>
    <textarea class="form-control" id="jobdescription" rows="5" maxlength="1500"></textarea>
  </div>

    <div class="form-group">
     <label for="jobLocation">Location</label>
     <select class="form-control" id="location" name="location" onchange="show_location()">
     <option value="" disabled selected hidden>Select Location</option>
_END;
    if (! empty($locations)) {
        // show_dropdown_option($salary_ranges);
        foreach ($locations as $key => $value) {
            echo <<<_END
        <option value="{$key}">$value</option>
_END;
        }
    }

    echo <<<_END
</select>
      <input type="text" class="form-control" id="location_disp" name="location_disp" disabled="disabled">
    </div>


   <div class="form-group">
    <label for="jobSalary">Salary</label>     
     <select class="form-control" id="salary_range_drp" name="salary_range_drp" onchange="show_salary_range()">
     <option value="" disabled selected hidden>Select Salary</option>     

_END;
    if (! empty($salary_ranges)) {
        // show_dropdown_option($salary_ranges);
        foreach ($salary_ranges as $key => $value) {
            echo <<<_END
        <option value="{$key}">$value</option>
_END;
        }
    }

    echo <<<_END
    </select>
      <input type="text" class="form-control" id="salary_disp" name="salary_disp" disabled="disabled">
  </div>
 

<div class="form-group">
<label for="jobType">Job Type</label>   
 <select class="form-control" id="job_type_drp" name="job_type_drp" onchange="show_job_type()">
     <option value="" disabled selected hidden>Select Job Type</option>     

_END;
    if (! empty($job_types)) {
        foreach ($job_types as $key => $value) {
            echo <<<_END
<option value="{$key}">$value</option>
_END;
        }
    }

    echo <<<_END
    </select>
      <input type="text" class="form-control" id="job_type_disp" name="job_type_disp" disabled="disabled">
  
    </div>

<div class="form-group">
<label for="skillRequired">Skills Required</label>   
 <select class="form-control" id="skill_drp" name="skill_drp[]" onchange="show_skill()" multiple>
     <option value="" disabled selected hidden>Select Job Type</option>     
_END;
    if (! empty($skills)) {
        foreach ($skills as $key => $value) {
            echo <<<_END
            
      <option value="{$key}">{$value}</option>
      
_END;
        }
    }

    echo <<<_END
    </select>
      <input type="text" class="form-control" id="skill_disp" name="skill_disp" disabled="disabled">
  </div>
  
     <input type="hidden" id="create" name="create" value=1>
     <input type="hidden" id="job_desc" name="job_desc">
     <input type="hidden" id="userid" name="userid" value="{$userid}">
     <input type="hidden" id="user_email" name="user_email" value="{$user_email}">
    <button type="submit" id="btn_submit" class="btn btn-primary">Submit</button>
  </form>
</div>

_END;
}

function insert_job($conn)
{
    
    print_r($_POST);
    $title = isset($_POST['title']) ? util__sanitizeMySQL($conn, $_POST['title']) : "";
    $location = isset($_POST['location']) ? util__sanitizeMySQL($conn, $_POST['location']) : "";
    $desc = isset($_POST['job_desc']) ? util__sanitizeMySQL($conn, $_POST['job_desc']) : "";
    $salary = isset($_POST['salary_range_drp']) ? $_POST['salary_range_drp'] : "";
    $type = isset($_POST['job_type_drp']) ? $_POST['job_type_drp'] : "";
    $userid = isset($_POST['userid']) ? util__sanitizeMySQL($conn, $_POST['userid']) : "";
    $user_email = isset($_POST['userid']) ? util__sanitizeMySQL($conn, $_POST['user_email']) : "";

    $id = insert_new_job($conn, $title, $location, $desc, $salary, $type, $userid, $user_email);

    if ((isset($_POST['skill_drp'])) && (! (empty($_POST['skill_drp'])))) {
        foreach ($_POST['skill_drp'] as $val) {
            insert_job_skill_required($conn, $id, $val, $userid, $user_email);
        }
    }
    util__close_db_connection($conn);

    header("Location: ../employer/main.php?userid={$user_email}&success=1");
    exit();
}

function insert_new_job($conn, $title, $location, $desc, $salary, $type, $userid, $user_email)
{
    $id = 0;
    $query = "INSERT INTO `job_post`(`title`,`description`,`user_id`,`salary_range_id`,`address_id`,`job_type_id`) VALUES 
             ('$title','$desc',$userid,$salary,$location,$type)";

    if ($conn->query($query) === TRUE) {
        $id = $conn->insert_id;
    } else {
        $msg = "Error: " . $query . "<br>" . $conn->error;
        echo $msg;
       // header("Location: ../employer/main.php?userid={$user_email}&success=0");
        exit();
    }

    return $id;
}

function insert_job_skill_required($conn, $id, $val, $userid, $user_email)
{
    $query = "INSERT INTO `job_skill_required`(`job_id`,`skill_id`) VALUES ($id,$val)";

    $result = $conn->query($query);

    if (! $result) {
        $msg = "Error: " . $query . "<br>" . $conn->error;
        echo $msg;
      //  header("Location: ../employer/main.php?userid={$user_email}&success=0");
        exit();
    }

    return true;
}

function get_salary_ranges($conn)
{
    $resp = array();
    $query = "SELECT id,salary_range FROM salary_ranges ";

    $result = $conn->query($query);
    if (! $result) {
        echo "alert('Select failed: $query<br>" . $conn->error . "')";
        return $resp;
    }
    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $resp[$row['id']] = $row['salary_range'];
        }
    }
    return $resp;
}

function get_job_type($conn)
{
    $resp = array();
    $query = "SELECT id,name FROM job_type ";

    $result = $conn->query($query);
    if (! $result) {
        echo "alert('Select failed: $query<br>" . $conn->error . "')";
        return $resp;
    }
    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $resp[$row['id']] = $row['name'];
        }
    }
    return $resp;
}

function get_skills($conn)
{
    $resp = array();
    $query = "SELECT id,name FROM skill_set ";

    $result = $conn->query($query);
    if (! $result) {
        echo "alert('Select failed: $query<br>" . $conn->error . "')";
        return $resp;
    }
    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $resp[$row['id']] = $row['name'];
        }
    }
    return $resp;
}

function get_location($conn)
{
    $resp = array();
    $query = "SELECT id,name FROM job_location ";

    $result = $conn->query($query);
    if (! $result) {
        echo "alert('Select failed: $query<br>" . $conn->error . "')";
        return $resp;
    }
    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $resp[$row['id']] = $row['name'];
        }
    }
    return $resp;
}

?>
<div id="footer"></div>
	<script>
		$("#header").load("/nxthire/html/util/header.html");
		$("#footer").load("/nxthire/html/util/footer.html");

		$(document).ready(function() {
  	  	  replace_login('<?php echo $user_email;?>');
     	  update_review_path('<?php echo $user_email;?>');
        	 update_browse_jobs_path('<?php echo $user_email;?>'); 
     	  hide_login_text_partial();
		});
	</script>

</body>
</html>