<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>


<body>
	<div id="header"></div>


	<h1 style="text-align: center;">Company Reviews</h1>

<?php
require_once '../util/util.php';

$conn = connect_db();

$userid = isset($_GET['userid']) && strlen($_GET['userid']) > 0 ? $_GET['userid'] : "";

$is_candidate = false;

if (strlen($userid) > 0) {
    $is_candidate = true;
}

show_reviews_table($conn, $userid);

function show_reviews_table($conn, $userid)
{
    $query = "SELECT c.name,cr.reviews,cr.rating FROM `company_reviews` cr
              INNER JOIN `company` c ON cr.company_id = c.id
              ORDER BY c.name;
              ";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $company_name = $row['name'];
            $review = $row['reviews'];
            $rating = $row['rating'];
            echo <<<_END
<div class="container mt-3">
     
    <div class="media border p-3">
    <div class="media-body">
     <h3>{$company_name}</h3> 
        Reviews: <p> {$review} </p> <hr>
         <h4> Rating: {$rating} <h4>
         </div>
  </div>
</div>
_END;
        }
    }

    return;
}

if (strlen($userid) > 0) {
    echo <<<_END
<div class="container mt-3">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addreviewModal">
    Add Review
  </button>

  <!-- The Modal -->
  <div class="modal" id="addreviewModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Review</h4>
           <div id="review_html_txt"></div>
           

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
</div>
_END;
}

?>
	<div id="footer"></div>
	<script> 

$("#header").load("/nxthire/html/util/header.html");
$("#footer").load("/nxthire/html/util/footer.html");
<?php

if ($is_candidate) 
{
    echo<<<_END
$(document).ready(function() {
	    replace_login('$userid');
        update_review_path('$userid');
	   hide_login_text_partial();
	   $('#addreviewModal').find('.modal-body').load('addReview.html');
    });

_END;
    
    
}

?>

     </script>

</html>