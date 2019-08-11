<?php

// login for the db
require_once '../util/util.php';

$conn = connect_db();

$uname = isset($_GET['userid']) && strlen($_GET['userid']) ? util__sanitizeMySQL($conn, $_GET['userid']) : "";

$user_session_info = util__get_session_info($conn, $uname);
$userid = $user_session_info['userid'];

echo <<<END

<!DOCTYPE html>
<html lang="en">
<head>
    <title>NxtHire</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <script>
function show_modal()
{
$("#applyModal").modal("show");
}
</script>
</head>
<body>

<div id="header"></div> 
END;

// check if job title and location provided in the search

$job_title_to_search = isset($_POST['job_title']) ? util__sanitizeMySQL($conn, $_POST['job_title']) : "";

$location_to_search = isset($_POST['location']) ? util__sanitizeMySQL($conn, $_POST['location']) : "";

$is_candidate = false;

if ($userid > 0) {
    $is_candidate = true;
}

$jobs = get_jobs_for_search($conn, $job_title_to_search, $location_to_search,$userid);

show_jobs($jobs, $is_candidate);
$jobs->close();
$conn->close();

function get_jobs_for_search($conn, $job_title_to_search, $location_to_search,$userid)
{
    $where = "";
    
    //filter out jobs already applied by candidate
    if($userid>0)
    {
        $where .= "AND jp.id NOT IN (SELECT job_id FROM job_candidate WHERE candidate_id = $userid)";
    }
   
    if (strlen($job_title_to_search) > 0) {
        $where .= "AND jp.description REGEXP '^({$job_title_to_search})";
    }
    if (strlen($location_to_search) > 0) {
        $where .= "AND CONCAT(ad.city,',',ad.province) REGEXP '^({$location_to_search})'";
    }
    $query = "SELECT jp.id,jp.description, jp.title,co.name AS employer_name,jp.create_date AS posting_date,
              CONCAT(ad.city,',',ad.province,',',ad.country) AS location,sr.salary_range
        FROM job_post jp
        INNER JOIN address ad
            ON jp.address_id = ad.id
        INNER JOIN salary_ranges sr
            ON jp.salary_range_id = sr.id
        INNER JOIN employer_user eu
            ON jp.user_id = eu.id
        INNER JOIN company co
            ON jp.user_id = eu.company_id
        WHERE jp.is_active = 1 $where ORDER BY jp.title";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}

function show_jobs($jobs_result, $is_candidate = False)
{
    echo <<<_END
<div class="container">
  <h2>Job List</h2>
  <table class="table" style="width:100%">
    <thead>
      <tr>
        <th>Job Title</th>
        <th>Company</th>
        <th>Job Posted</th>
        <th>Location</th>
        <th>Salary</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    
_END;

    if ($jobs_result->num_rows > 0) {

        while ($row = $jobs_result->fetch_assoc()) {
            
            $salary = "\$XXXXXX - \$XXXXXX";
            $html = "";
            if($is_candidate)
            {
                $salary = $row['salary_range'];
                $html = <<<_END
<button onclick="show_modal()" data-toggle="modal" data-target="#applyModal" type="button" id="btnapply_{$row['id']}" data-id="{$row['id']}" name="btnapply" class="btn btn-primary">Apply</button>
_END;
            }

            $salary = ($is_candidate) ? $row['salary_range'] : "\$XXXXXX - \$XXXXXX";

            echo <<<_END
                           <tr ><td>{$row['title']}</td>
                               <td>{$row['employer_name']}</td>
                               <td>{$row['posting_date']}</td>
                               <td>{$row['location']}</td>
                               <td>{$salary}</td>
                               <td>$html</td>
                           </tr>
_END;
        }
    } else {
        echo <<<_END
                <tr><td  colspan="5">No records found</td></tr>";
_END;
    }

    echo <<<_END
    
    </tbody>
  </table>
</div>

_END;

    show_apply_button();
}

function show_apply_button()
{
    echo <<<_END
    
 
  
  <!-- The Modal -->
  <div class="modal" id="applyModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Apply</h4>
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

<script> 

$("#header").load("/nxthire/html/util/header.html");
$("#footer").load("/nxthire/html/util/footer.html");
 $(document).ready(function() {
	 <?php 
	 
	 if($is_candidate)
	 {
	     echo <<<_END
	     replace_login('$uname');
	     update_browse_jobs_path('$uname');
         update_review_path('$uname');
_END;
	 }
	     
	 ?>
     
			  
     	//   id = $('#applyModal').data('id'); 
     	  $('#applyModal').find('.modal-body').load('apply.html');
    	    });
 $('#applyModal').on('show.bs.modal', function (e) {
	    var id = $(e.relatedTarget).attr('data-id');
	    $('#job_id').val(id);
	});
     </script>
</body>
</html>