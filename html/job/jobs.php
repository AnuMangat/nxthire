<?php

// login for the db
require_once '../util/util.php';

$conn = connect_db();
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
</head>
<body>

<nav class="navbar navbar-expand-sm bg-light navbar-light sticky-top">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#=../home.html"><p class="font-weight-bolder">Home</p></a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="../employer/signup.html"><p class="font-weight-bolder">For Employers</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#"><p class="font-weight-bolder">Browse Jobs</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../employer/reviews.html"><p class="font-weight-bolder">Company Reviews</p></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="salary.html"><p class="font-weight-bolder">Salaries</p></a>
    </li>
  </ul>
</nav>
END;

// check if job title and location provided in the search

$job_title_to_search = isset($_POST['job_title']) ? sanitizeMySQL($conn, $_POST['job_title']) : "";

$location_to_search = isset($_POST['location']) ? sanitizeMySQL($conn, $_POST['location']) : "";
$jobs = get_jobs_for_search($conn, $job_title_to_search, $location_to_search);

show_jobs($jobs);
$jobs->close();
$conn->close();

function get_jobs_for_search($conn, $job_title_to_search, $location_to_search)
{
    $where = "";
    if(strlen($job_title_to_search)>0)
    {
        $where .= "AND jp.description REGEXP '^({$job_title_to_search})";
        
    }
    if(strlen($location_to_search)>0)
    {
      $where .=  "AND CONCAT(ad.city,',',ad.province) REGEXP '^({$location_to_search})'";
    }
    $query = "SELECT jp.id,jp.description AS job_title,co.name AS employer_name,jp.create_date AS posting_date,
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
        WHERE jp.is_active = 1 $where";

    $result = $conn->query($query);
    if (! $result) {
        echo "Select failed: $query<br>" . $conn->error . "<br><br>";
    }

    return $result;
}

function show_jobs($jobs_result, $show_salary = False)
{
    echo <<<_END
<div class="container">
  <h2>Job List</h2>
  <table class="table">
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

            $salary = ($show_salary) ? $row['salary_range'] : "\$XXXXXX - \$XXXXXX";

            echo <<<_END
                           <tr><td>{$row['job_title']}</td>
                               <td>{$row['employer_name']}</td>
                               <td>{$row['posting_date']}</td>
                               <td>{$row['location']}</td>
                               <td>{$salary}</td>
                               <td><a class="nav-link" href="#"><p class="font-weight-bolder">Apply</p></a></td>
                               
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
</body>
</html>
_END;
}
?>