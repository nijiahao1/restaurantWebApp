<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Orders</title>
    <link rel="stylesheet" type="text/css" href="order.css">
  </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <?php
        echo "<date>Here are all the orders made on ".$_POST["orderdate"].":</date>";
    ?>
    <table>
      <tr>
        <th>Customer</th>
        <th>ItemsOrdered</th>
        <th>TotalAmount</th>
        <th>Tips</th>
        <th>Deliverer</th>
      </tr>
    <?php
      $whichDate= $_POST["orderdate"];
      $query = 'SELECT customerAccount.firstName as customerFirstN, 
      customerAccount.lastName as customerLastN, 
      GROUP_CONCAT(food.name SEPARATOR ", ") as itemsOrdered, totalAmount, tips, 
      employee.firstName as delivererFirstN, employee.lastname as delivererLastN 
      FROM `order` JOIN customerAccount on `order`.placedByCustomer = customerAccount.email
      JOIN orderContainsFood on `order`.ID = orderContainsFood.orderID
      JOIN food on orderContainsFood.foodname = food.name
      JOIN deliverer on `order`.delivererID = deliverer.delivererID
      JOIN employee on deliverer.delivererID = employee.id
      WHERE `order`.day = "' . $whichDate . '"
      GROUP BY `order`.id';
      $result=$connection->query($query);
    
      while ($row=$result->fetch()) {
	    echo "<tr>
               <td><name1>".$row["customerFirstN"]." ".$row["customerLastN"]."</name1></td>
               <td><food>".$row["itemsOrdered"]."</food></td>
               <td><money>".$row["totalAmount"]."</money></td>
               <td><money>".$row["tips"]."</money></td>
               <td><name2>".$row["delivererFirstN"]." ".$row["delivererLastN"]."</name2></td>
             </tr>";
      }
    ?>
    </table>
    <?php
      $connection = NULL;
    ?>
  </body>
</html>