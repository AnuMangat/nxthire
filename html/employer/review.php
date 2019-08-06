<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-light navbar-light sticky-top">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="../home.html"><p class="font-weight-bolder">Home</p></a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="signup.html"><p class="font-weight-bolder">For Employers</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../job/jobs.html"><p class="font-weight-bolder">Browse Jobs</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#"><p class="font-weight-bolder">Company Reviews</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../job/salary.html"><p class="font-weight-bolder">Salaries</p></a>
    </li>
  </ul>
</div>
</nav>
 
 
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

<footer class="page-footer font-small special-color-dark pt-4">

  <div style="background-color:violet;">
   <div class="footer-copyright text-center  py-3">� 2019 Copyright:
    <a href="#">MangatAnudeep</a>
 </div>
  </div>
  <!-- Copyright -->
</footer>

<!-- Footer -->

</body>
</html>