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
</head>
<body>

<nav class="navbar navbar-expand-sm bg-light navbar-light sticky-top">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#"><p class="font-weight-bolder">Home</p></a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="employer/signup.html"><p class="font-weight-bolder">For Employers</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="job/jobs.php"><p class="font-weight-bolder">Browse Jobs</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="employer/reviews.html"><p class="font-weight-bolder">Company Reviews</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="job/salary.html"><p class="font-weight-bolder">Salaries</p></a>
    </li>
  </ul>
 <ul class="navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link" href="employer/signup.html"><p class="font-weight-bolder">Login</p></a>
    </li>
<li class="nav-item">
      <a class="nav-link disabled"><p class="font-weight-bolder">|</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#"><p class="font-weight-bolder">Sign up</p></a>
    </li>
</ul>

</div>  
</nav>



<div class="container">
   <img src="../pictures/pic.jpg" class="img-fluid mx-auto d-block" style="width:50%"> 
<br>
<div>
<form method ="post" action="job/jobs.php"> 
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="#">Job title, Company or Keywords</label>
      <input type="text" class="form-control" id="job_title" name="job_title" placeholder="Search here...">
    </div>
    <div class="form-group col-md-6">
      <label for="#">Location</label>
      <input type="text" class="form-control" id="location" name="location" placeholder="Search here...">
    </div>
  </div>
    <button type="submit" class="btn btn-secondary">find jobs</button>
 <br>
 <br>

 <div class="font-weight-bolder text-success">
 <p> Post a Job?
<a href="job/createjob.html" class="btn btn-link font-weight-bolder text-success" role="button">Click Here</a> 
 
</p>
</div>

 </form>
</div>

</body> 
</html>

<?php

print_r($_SESSION);

?>