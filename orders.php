<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Orders on a date</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <div class="order">
    <h2>To check all the orders made on a particular date:</h2>
    <form action="getorders.php" method="post">
      <p>Enter the date: (YYYY-MM-DD)</p>
      <input type="text" name="orderdate">
      <input type="submit" value="Get All Orders">
    </form>
    </div>
    <?php
      $connection = NULL;
    ?>
  </body>
</html>