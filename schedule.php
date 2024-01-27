<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Restaurant Home Page</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <div class="add">
      <h2> To show an employee's schedule from Monday to Friday:</h2>
      <form action="showschedule.php" method="post">
        <?php
           $query = "SELECT * FROM employee";
           $result = $connection->query($query);
           echo "Which employee are you looking up? </br>";
           while ($row = $result->fetch()) {
                echo '<input type="radio" name="employeename" value="';
                echo $row["id"];
                echo '">' . $row["firstName"] . " " . $row["lastName"] . "<br>";
           }
        ?>
        <input type="submit" value="Show Employee Schedule">
      </form>
    </div>
    <?php
      $connection = NULL;
    ?>
  </body>
</html>