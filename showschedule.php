<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Schedule</title>
    <link rel="stylesheet" type="text/css" href="schedule.css">
  </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <h1> Schedule from Monday to Friday: </h1>
    <div>
    <table>
      <tr>
        <th>Date</th>
        <th>Day Of Week</th>
        <th>Start time</th>
        <th>End time</th>
      </tr>
    <?php
      $whichEmployee=$_POST["employeename"];
      $query = 'SELECT shift.day as date, DAYNAME(shift.day) as day, starttime, endtime 
      FROM shift WHERE DAYOFWEEK(shift.day) BETWEEN 2 AND 6
      AND shift.employeeID = "' . $whichEmployee . '"';
      $result=$connection->query($query);
    
      while ($row=$result->fetch()) {
	    echo "<tr>
               <td><num>".$row["date"]."</num></td>
               <td><word>".$row["day"]."</word></td>
               <td><num>".$row["starttime"]."</num></td>
               <td><num>".$row["endtime"]."</num></td>
             </tr>";
      }
    ?>
    </table>
    </div>
    <?php
      $connection = NULL;
    ?>
  </body>
</html>