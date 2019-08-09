<!DOCTYPE html>
<html lang="en">
<head>
<div id="header"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/nxthire/js/login_replace.js"></script>
<script>



function withdraw_app(candidate_id,job_id)
{
	if(confirm("Are you sure?"))
	{
		 $.ajax({
	            url:"withdraw.php", //the page containing php script
	            type: "post", //request type,
	            dataType: 'json',
	            data: {candidate_id: candidate_id, job_id: job_id},
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

function show_skill(userid)
{
	 window.location.href = 'skill.php?userid='+userid;
	
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
    show_dashboard($conn, $userid);
}

function show_dashboard($conn, $userid)
{
    // show the header
    show_tbl_header($userid);

    $jobs_applied = get_jobs_applied($conn, $userid);

    if ($jobs_applied->num_rows > 0) {

        while ($row = $jobs_applied->fetch_assoc()) {

            echo <<<_END
                           <tr><td>{$row['title']}</td>
                               <td>{$row['company']}</td>
                               <td>{$row['location']}</td>
                               <td>{$row['salary']}</td>
                               <td>{$row['applied_date']}</td>
                               <td><button id="btnEdit" onclick="withdraw_app({$row['candidate_id']},{$row['id']});" type="button" class="btn btn-primary">Withdraw Application</button></td>

                           </tr>
                               
                               
_END;
        }
    } else {
        echo <<<_END
                <tr><td  colspan="3">No records found</td></tr>
_END;
    }
    $jobs_applied->close();
    // show the footer
    show_tbl_footer();

    // close the connection to the db
    util__close_db_connection($conn);
}
function show_tbl_header($userid)
{
    echo <<<_END
<div class="container">
  <h2>Job(s) Applied</h2>
   <button id="btnSkill" onclick="show_skill('$userid');" type="button" class="btn btn-primary">Update Skill Set</button>

  <div class="table-responsive">
  <table id="job_applied_list_tbl" class="table" style="width:100%">
    <thead>
      <tr>
        <th>Job Title</th>
        <th>Company</th>
         <th>Location</th>
        <th>Salary</th>
        <th>Date of Application</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    
_END;
}
function get_jobs_applied($conn, $userid)
{
    $query = "SELECT
    jp.title,
    c.name AS company,
    jc.applied_date,
    jl.name AS location,
    sr.salary_range AS salary,
    jc.candidate_id,jp.id

FROM
    `job_post` jp
INNER JOIN employer_user eu ON
    jp.user_id = eu.id
INNER JOIN company c ON
    c.id = eu.company_id
INNER JOIN job_candidate jc ON
    jp.id = jc.job_id
INNER JOIN job_location jl ON
    jl.id = jp.address_id
INNER JOIN salary_ranges sr ON
    sr.id = jp.salary_range_id
INNER JOIN candidate cd ON
    cd.id = jc.candidate_id
WHERE
    cd.user_name = '{$userid}'";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}



function show_tbl_footer()
{
    echo <<<_END
    
    </tbody>
  </table>
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
    	    });
	    
   
     </script>
</body>
</html>