<!DOCTYPE html>
<html lang="en">
<head>
<title>NxtHire</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	type="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<script> 
$(document).ready(function() {
    $('#job_list_tbl').DataTable();
} );


function updateRecord()
{
	job_id = $('#btnEdit').attr("data-id");
	is_active = $('input[name=is_active]:checked').val();//$('#is_active input:radio:checked').val()
	$.ajax({
        url: '../job/edit.php',    //Your api url
        type: 'POST',   //type is any HTTP method
        data: {
            job_id: job_id,is_active:is_active
        },      //Data as js object
        success: function () {
        	location.reload();
        },
        error: function (request, status, error) {
            alert(request.responseText);
        }
    })
    ;
}


</script>
</script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-light navbar-light sticky-top">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="../home.html"><p
				class="font-weight-bolder">Home</p></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#"><p
							class="font-weight-bolder">For Employers</p></a></li>
				<li class="nav-item"><a class="nav-link" href="../job/jobs.html"><p
							class="font-weight-bolder">Browse Jobs</p></a></li>
				<li class="nav-item"><a class="nav-link" href="reviews.html"><p
							class="font-weight-bolder">Company Reviews</p></a></li>
				<li class="nav-item"><a class="nav-link" href="../job/salary.html"><p
							class="font-weight-bolder">Salaries</p></a></li>
			</ul>
  
<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_GET['userid']) ? $_GET['userid'] : "";
echo <<<_END
 <ul class="navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link"  href="employer/signup.html"><p id="useridLink" class="font-weight-bolder">{$userid}</p></a>
    </li>

</ul>
</nav>

_END;

// show the dashboard for this userid
if (strlen($userid) > 0) {
    show_dashboard($conn, $userid);
}

function show_dashboard($conn, $userid)
{
    // show the header
    show_tbl_header($userid);

    $jobs_result = get_jobs_for_user($conn, $userid);

    if ($jobs_result->num_rows > 0) {

        while ($row = $jobs_result->fetch_assoc()) {

            $no_of_applicants = get_applicants_count_for_job($conn, $row['id']);

            echo <<<_END
                           <tr><td>{$row['title']}</td>
                               <td>{$row['description']}</td>
                               <td>{$row['posting_date']}</td>
                               <td>{$row['location']}</td>
                               <td>{$row['salary_range']}</td>
                               <td>{$no_of_applicants}</td>
                               <td><button id="btnEdit" type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal" data-id="{$row['id']}">Edit</button></td>
                               </tr>
             
                               
                           
                           
                           
_END;
        }
    } else {
        echo <<<_END
                <tr><td  colspan="5">No records found</td></tr>";
_END;
    }
    $jobs_result->close();
    // show the footer
    show_tbl_footer();

    // close the connection to the db
    util__close_db_connection($conn);
}

function show_tbl_header($userid)
{
    echo <<<_END
<div class="container">
  <h2>Job List</h2>
  <div class="table-responsive">
<hr>
 <a href="../job/createjob.php?userid={$userid}" class="btn btn-success" role="button">Add Job</a>
<p>

  <table id="job_list_tbl" class="table" style="width:100%">
    <thead>
      <tr>
        <th>Job Title</th>
        <th>Description</th>
        <th>Posting Date</th>
         <th>Location</th>
        <th>Salary</th>
       <th>Number of Applicants</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    
_END;
}

function get_jobs_for_user($conn, $userid)
{
    $query = "SELECT jp.id,jp.title,jp.description,co.name AS employer_name,jp.create_date AS posting_date,
              CONCAT(ad.city,',',ad.province,',',ad.country) AS location,sr.salary_range
        FROM job_post jp
        INNER JOIN address ad
            ON jp.address_id = ad.id
        INNER JOIN salary_ranges sr
            ON jp.salary_range_id = sr.id
        INNER JOIN employer_user eu
            ON jp.user_id = eu.id
        INNER JOIN company co
            ON co.id = eu.company_id
        WHERE jp.is_active = 1
        AND eu.user_name = '{$userid}' ORDER BY jp.create_date ";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}

function get_applicants_count_for_job($conn, $job_id)
{
    $count = 0;
    $query = "SELECT COUNT(*) AS no_of_applicants FROM `job_candidate` 
            WHERE job_id = {$job_id}";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }
    if ($result->num_rows > 0) {

        $row = $result->fetch_assoc();
        $count = $row['no_of_applicants'];
    }

    return $count;
}

function show_tbl_footer()
{
    echo <<<_END
    
    </tbody>
  </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">Edit</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body">
        <div class="container ">
       <form id="editJobform">
            <label  class="radio-inline">
       
            <input type="radio"  id="is_active" name="is_active" value=1>Active
            </label>
           <label  class="radio-inline">
       
            <input type="radio"  id="is_active" name="is_active" value=0>InActive
            </label>
</form>
       </div>
  


      </div>
     <div class="modal-footer">
        <button type="button" id="btnChangeEdit" name="btnChangeEdit" class="btn btn-primary mr-auto" onclick="updateRecord()" >Change</button>
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
_END;
}

?>









</body>
</html>