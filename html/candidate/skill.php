<!DOCTYPE html>
<html lang="en">
<head>
<div id="header"></div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/nxthire/js/login_replace.js"></script>
<script>



function delete_skill(candidate_id,skill_id)
{
	if(confirm("Are you sure?"))
	{
		
		 $.ajax({
	            url:"deleteSkill.php", //the page containing php script
	            type: "post", //request type,
	            dataType: 'json',
	            data: {candidate_id: candidate_id, skill_id: skill_id},
	            success:function(request, status, error){
	            	location.reload();
	    

	           },
	            error: function (request, status, error) {
	                alert(request.responseText);
	            }
	         });


		
	}
	else
	{
		event.preventDefault();
		
	}
	return false;
}

function show_job_applied(userid)
{
	 window.location.href = 'main.php?userid='+userid;
	
}

function get_skill_html()
{
	 $.ajax({
         url:"addskill.html", //the page containing php script
         type: "get", //request type,
         dataType: 'json',
         data: {},
         success:function(request, status, error){
         	$('#skill_html_txt').html(request.responseText);
 

        },
         error: function (request, status, error) {
             alert(request.responseText);
         }
      });
}


function delete_education(candidate_id,edu_id)
{
	if(confirm("Are you sure?"))
	{
		
		 $.ajax({
	            url:"deleteEducation.php", //the page containing php script
	            type: "post", //request type,
	            dataType: 'json',
	            data: {candidate_id: candidate_id, edu_id: edu_id},
	            success:function(request, status, error){
	            	location.reload();
	    

	           },
	            error: function (request, status, error) {
	                alert(request.responseText);
	            }
	         });


		
	}
	else
	{
		event.preventDefault();
		
	}
	return false;
}

function delete_exp(candidate_id,exp_id)
{
	if(confirm("Are you sure?"))
	{
		
		 $.ajax({
	            url:"deleteExp.php", //the page containing php script
	            type: "post", //request type,
	            dataType: 'json',
	            data: {candidate_id: candidate_id, exp_id: exp_id},
	            success:function(request, status, error){
	            	location.reload();
	    

	           },
	            error: function (request, status, error) {
	                alert(request.responseText);
	            }
	         });


		
	}
	else
	{
		event.preventDefault();
		
	}
	return false;
}


</script>
<div id="header"></div>
</head>
</head>
<body>
<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_GET['userid']) ? util__sanitizeMySQL($conn, $_GET['userid']) : "";

if (strlen($userid) == 0) {
    exit();
} // show the dashboard for this userid
else if (strlen($userid) > 0) {
    show_dashboard_skill($conn, $userid);
    show_dashboard_education($conn, $userid);
    show_dashboard_exp($conn, $userid);

    // close the connection to the db
    util__close_db_connection($conn);
}

function show_dashboard_skill($conn, $userid)
{
    // show the header
    show_tbl_header_skill($userid);

    $skills = get_skill($conn, $userid);

    if ($skills->num_rows > 0) {

        while ($row = $skills->fetch_assoc()) {

            echo <<<_END
                           <tr><td>{$row['name']}</td>
                               <td>{$row['description']}</td>
                               <td><button id="btnEdit" onclick="delete_skill({$row['candidate_id']},{$row['skill_id']});" type="button" class="btn btn-primary">Delete Skill</button></td>
                           </tr>
                           
_END;
        }
    } else {
        echo <<<_END
                <tr><td  colspan="3">No records found</td></tr>
_END;
    }
    $skills->close();
    // show the footer
    show_tbl_footer();
}

function show_tbl_header_skill($userid)
{
    echo <<<_END
<div class="container">
<button id="btnSkill" onclick="show_job_applied('$userid');" type="button" class="btn btn-primary">Job(s) Applied</button>
<p>
  <h2>Skill Set</h2>
   
_END;
    show_add_skill_button($userid);
    echo <<<_END
  <div class="table-responsive">
  <table id="skill_list_tbl" class="table" style="width:100%">
    <thead>
      <tr>
        <th>Skill</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
_END;
}

function get_skill($conn, $userid)
{
    $query = "SELECT
    cs.candidate_id,
    cs.skill_id,
    ss.name,
    ss.description
FROM
    candidate_skill cs
INNER JOIN candidate c ON
    c.id = cs.candidate_id
INNER JOIN skill_set ss ON
    ss.id = cs.skill_id
WHERE
    c.user_name = '{$userid}'";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}

function show_add_skill_button($userid)
{
    echo <<<_END


  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addskillModal">
    Add Skill
  </button>

  <!-- The Modal -->
  <div class="modal" id="addskillModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Skill</h4>
           <div id="skill_html_txt"></div>
           

          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
 



_END;
}

function show_tbl_footer()
{
    echo <<<_END
    
    </tbody>
  </table>
</div>
_END;
}

function show_dashboard_education($conn, $userid)
{
    // show the header
    show_tbl_header_education($userid);

    $res = get_education($conn, $userid);

    if ($res->num_rows > 0) {

        while ($row = $res->fetch_assoc()) {

            $graduate = $row['is_graduate'] == 1 ? 'YES' : 'NO';

            echo <<<_END
                           <tr><td>{$row['degree_name']}</td>
                               <td>{$row['description']}</td>
                               <td>{$row['college']}</td>
                              <td>$graduate</td>
                               <td><button id="btnDelete_education" onclick="delete_education({$row['candidate_id']},{$row['edu_id']});" type="button" class="btn btn-primary">Delete</button></td>
                           </tr>
                           
_END;
        }
    } else {
        echo <<<_END
                <tr><td  colspan="5">No records found</td></tr>
_END;
    }
    $res->close();
    // show the footer
    show_tbl_footer();
}

function show_tbl_header_education($userid)
{
    echo <<<_END
<div class="container">
  <h2>Education</h2>
_END;
    show_add_education_button($userid);
    echo <<<_END
  <div class="table-responsive">
  <table id="education_list_tbl" class="table" style="width:100%">
    <thead>
      <tr>
        <th>Degree/Diploma Name</th>
        <th>College/University</th>
        <th>Description</th>
        <th>Graduated?</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
_END;
}

function get_education($conn, $userid)
{
    $query = "SELECT
    ce.id AS edu_id,
    ce.name AS degree_name,
    ce.description,
    ce.college,
    ce.is_graduate,
    ce.candidate_id
FROM
    `candidate_education` ce
INNER JOIN candidate c ON
    c.id = ce.candidate_id
WHERE
    c.user_name = '{$userid}'";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}

function show_add_education_button($userid)
{
    echo <<<_END
    
    
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addeduModal">
    Add Education
  </button>
  
  <!-- The Modal -->
  <div class="modal" id="addeduModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Education</h4>
           <div id="edu_html_txt"></div>
           
           
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
  
_END;
}

function show_dashboard_exp($conn, $userid)
{
    // show the header
    show_tbl_header_exp($userid);

    $res = get_exp($conn, $userid);

    if ($res->num_rows > 0) {

        while ($row = $res->fetch_assoc()) {
            
           
            $reference = $row['use_as_reference'] == 1 ? "YES" : "NO";

            echo <<<_END
                           <tr><td>{$row['exp_name']}</td>
                               <td>{$row['description']}</td>
                               <td>{$row['employer_name']}</td>
                               <td>{$row['employer_address']}</td>
                               <td>{$row['no_of_years']}</td>
                               <td>{$row['sup_name']}</td>
                               <td>{$row['sup_email']}</td>
                               <td>{$row['sup_phone']}</td>
                               <td>$reference</td>
                               <td><button id="btnEdit" onclick="delete_exp({$row['candidate_id']},{$row['exp_id']});" type="button" class="btn btn-primary">Delete</button></td>
                           </tr>
                           
_END;
        }
    } else {
        echo <<<_END
                <tr><td  colspan="10">No records found</td></tr>
_END;
    }
    $res->close();
    // show the footer
    show_tbl_footer();
}

function show_tbl_header_exp($userid)
{
    echo <<<_END
<div class="container">
  <h2>Experience</h2>
_END;
    show_add_exp_button($userid);
    echo <<<_END
  <div class="table-responsive">
  <table id="exp_list_tbl" class="table" style="width:100%">
    <thead>
      <tr>
        <th>Job</th>
        <th>Description</th>
        <th>Company Name</th>
        <th>Company Address</th>
        <th># Years</th>
        <th>Supervisor Name</th>
        <th>Supervisor Email</th>
        <th>Supervisor Phone</th>
        <th>Use for reference?</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
_END;
}

function get_exp($conn, $userid)
{
    $query = "SELECT
    ce.id AS exp_id,
    ce.description,
    ce.candidate_id,
    ce.name AS exp_name,
    ce.company_name AS employer_name,
    (
        ad.street_number + ' ' + ad.street_name + ' ' + ad.city + ',' + ad.province + ',' + ad.country
    ) AS employer_address,
    ce.no_of_years,
    ce.supervisor_name AS sup_name,
    ce.supervisor_email AS sup_email,
    ce.supervisor_phone AS sup_phone,
    ce.use_as_reference
FROM
    `candidate_experience` ce
INNER JOIN candidate c ON
    c.id = ce.candidate_id
INNER JOIN address ad ON
    ad.id = ce.company_address
WHERE
    c.user_name = '$userid'";
    

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}

function show_add_exp_button($userid)
{
    echo <<<_END
    
    
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addexpModal">
    Add Experience
  </button>
  
  <!-- The Modal -->
  <div class="modal" id="addexpModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Experience</h4>
           <div id="exp_html_txt"></div>
           
           
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
  
_END;
}

?>



<div id="footer"></div>
	<script> 

     $("#header").load("/nxthire/html/util/header.html");
     $("#footer").load("/nxthire/html/util/footer.html");

     $(document).ready(function() {
     	    replace_login('<?php echo $userid;?>');
     	   hide_login_text_partial();
     	  $('#addskillModal').find('.modal-body').load('addskill.html');
     	  $('#addeduModal').find('.modal-body').load('addEducation.html');
     	  $('#addexpModal').find('.modal-body').load('addExp.html');
     		
     	  
    	    });
   
     </script>
</body>
</html>