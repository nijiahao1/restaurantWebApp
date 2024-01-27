<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Add New Customer</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <div class="add">
    <h2> To add a new customer:</h2>
    <form action="addnewcustomer.php" method="post">
      <p>Enter the following information about the new customer: </p>
      First Name: <input type="text" name="firstName"><br>
      Last Name: <input type="text" name="lastName"><br>
      Email: <input type="text" name="email"><br>
      Phone(10 digits only): <input type="text" name="phone"><br>
      Street: <input type="text" name="street"><br>
      City: <input type="text" name="city"><br>
      Province Code(e.g. ON): <input type="text" name="province"><br>
      Zip(e.g. A9A9A9): <input type="text" name="zip"><br>
      <input type="submit" value="Add New Customer">
    </form>
    </div>
    <?php
      $connection = NULL;
    ?>
  </body>
</html>