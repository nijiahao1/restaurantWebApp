<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>AddNewCustomer</title>
  </head>
  <body>
    <?php
    include 'connectdb2.php';
    ?>
    <ol>
      <?php
        $email=$_POST["email"];
        $query1='SELECT * FROM customerAccount WHERE email = "' . $email . '"';
        $result=$connection->query($query1);
        if ($result->rowCount() > 0) {
          echo "<h1>Customer with email $email already exists!</h1>";
        } else {
          $stmt = $connection->prepare('INSERT into customerAccount values(:email, :firstName, :lastName, :phone, :street, :city, :province, :zip, :creditAmount)');
          $stmt->bindParam(':email', $email);
          $stmt->bindParam(':firstName', $firstName);
          $stmt->bindParam(':lastName', $lastName);
          $stmt->bindParam(':phone', $phone);
          $stmt->bindParam(':street', $street);
          $stmt->bindParam(':city', $city);
          $stmt->bindParam(':province', $province);
          $stmt->bindParam(':zip', $zip);
          $stmt->bindParam(':creditAmount', $creditAmount);
          // insert a row
          $firstName=$_POST["firstName"];
          $lastName=$_POST["lastName"];
          $email=$_POST["email"];
          $phone=$_POST["phone"];
          $street=$_POST["street"];
          $city=$_POST["city"];
          $province=$_POST["province"];
          $zip=$_POST["zip"];
          $creditAmount=5.00;
          $stmt->execute();
          echo "<h1>New customer was added!</h1>";
        }
        $connection = NULL;
      ?>
    </ol>
  </body>
</html>