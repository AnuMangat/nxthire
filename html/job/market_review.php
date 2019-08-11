 <?php
require_once '../util/util.php';

$conn = connect_db();

function get_job_by_location($conn)
{
    $query = "SELECT jb.name AS city, count(*) AS cnt FROM job_location jb
INNER JOIN job_post jp ON jb.id = jp.address_id
WHERE jp.is_active =1 

GROUP BY jb.name
ORDER BY jb.name";
    $result = $conn->query($query);
    if (! $result)
        die($conn->error);
    return $result;
}

function get_job_by_type($conn)
{
    $query = "SELECT jt.name AS type,count(*) AS cnt FROM `job_post` jp
INNER JOIN job_type jt ON jp.job_type_id = jt.id
WHERE jp.is_active = 1
GROUP BY jt.name
ORDER BY jt.name";
    $result = $conn->query($query);
    if (! $result)
        die($conn->error);
    return $result;
}

function get_job_by_sector($conn)
{
    $query = "SELECT bt.name,count(*) AS cnt FROM `job_post` jp
    INNER JOIN employer_user eu ON eu.id = jp.user_id
    INNER JOIN company cc ON cc.id = eu.company_id
    INNER JOIN business_type bt ON bt.id = cc.type_id
    GROUP BY bt.name
    ORDER BY jp.title";
    $result = $conn->query($query);
    if (! $result)
        die($conn->error);
    return $result;
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div id="header"></div>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);
      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['city', 'cnt'],
          <?php
        $job_by_location = get_job_by_location($conn);
        while ($row = $job_by_location->fetch_assoc()) {
            echo "['" . $row['city'] . "'," . $row['cnt'] . "],";
        }

        $job_by_location->close();

        ?>
        ]);
var options = {
          title: 'Job demand by location'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
    chart.draw(data, options);
      }
    </script>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['city', 'cnt'],
          <?php
        $job_by_type = get_job_by_type($conn);
        while ($row = $job_by_type->fetch_assoc()) {
            echo "['" . $row['type'] . "'," . $row['cnt'] . "],";
        }

        $job_by_type->close();

        ?>
        ]);
var options = {
          title: 'Job demand by type'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
    chart.draw(data, options);
      }
    </script>
    
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart3);
      function drawChart3() {
        var data = google.visualization.arrayToDataTable([
          ['name', 'cnt'],
          <?php
          $job_by_sector = get_job_by_sector($conn);
          while ($row = $job_by_sector->fetch_assoc()) {
            echo "['" . $row['name'] . "'," . $row['cnt'] . "],";
        }

        $job_by_sector->close();

        ?>
        ]);
var options = {
          title: 'Job demand by Sector'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart3'));
    chart.draw(data, options);
      }
    </script>
    
</head>
<body>



	<div id="piechart1" style="width: 900px; height: 500px;"></div>
	<div id="piechart2" style="width: 900px; height: 500px;"></div>
		<div id="piechart3" style="width: 900px; height: 500px;"></div>
	<div id="footer"></div>
	<script> 

     $("#header").load("/nxthire/html/util/header.html");
     $("#footer").load("/nxthire/html/util/footer.html");
  </body>
</html>
