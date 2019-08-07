<!DOCTYPE html>
<html lang="en">
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
</head>

<div id="header"></div>
<body>

 
 
<h1 style="text-align:center;">Company Reviews </h1>

<?php

require_once '../util/util.php';

$conn = connect_db();

show_reviews($conn);

function show_reviews($conn)
{

show_reviews_table($conn);


}





function show_reviews_table($conn)
{

    $query = "SELECT c.name,cr.reviews,cr.rating FROM `company_reviews` cr
              INNER JOIN `company` c ON cr.company_id = c.id
              ORDER BY c.name;
              ";

    $result = $conn->query($query);
    if (!$result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) 
        {
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



?> 
<div class="container">
<hr>
 <a href="#" class="btn btn-success" role="button">Add Review</a>
</div>

<div id="footer"></div>
<script> 

$("#header").load("/nxthire/html/util/header.html");
$("#footer").load("/nxthire/html/util/footer.html");
     </script>
</html>