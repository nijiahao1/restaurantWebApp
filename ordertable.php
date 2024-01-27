<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Order Summary Table</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <div class="order">
    <h2>Here is the order summary table: </h2>
    <table>
      <tr>
        <th>Date</th>
        <th>Number Of Orders</th>
      </tr>
      <?php
      $query = 'SELECT `order`.day AS date, COUNT(*) AS num_orders
      FROM `order`
      GROUP BY `order`.day';
      $result=$connection->query($query);
    
      while ($row=$result->fetch()) {
	    echo "<tr>
               <td>".$row["date"]."</td>
               <td>".$row["num_orders"]."</td>
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