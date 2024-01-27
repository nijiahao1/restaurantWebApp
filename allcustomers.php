<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>All Customers Table</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <div class="order">
    <h2>Here are all the customers we have: </h2>
    <table>
      <tr>
        <th>Customer</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>CreditAmount</th>
      </tr>
      <?php
      $query = 'SELECT firstName, lastName, email, phone, street, city, province, zip, creditAmount
      FROM customerAccount';
      $result=$connection->query($query);
    
      while ($row=$result->fetch()) {
	    echo "<tr>
               <td><name1>".$row["firstName"]." ".$row["lastName"]."</name1></td>
               <td><money>".$row["email"]."</food></td>
               <td><money>".$row["phone"]."</money></td>
               <td><name1>".$row["street"].", ".$row["city"].", ".$row["province"].", ".$row["zip"]."</name1></td>
               <td><money>".$row["creditAmount"]."</money></td>
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