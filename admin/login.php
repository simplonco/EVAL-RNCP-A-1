<?php
session_start();
if(isset($_POST['submit'])){
  //
  $user = $_POST['username'];
  $pwrd = $_POST['pwrd'];
  require '../includes/db_connect.php';
  if(empty($user) || empty($pwrd)){
    echo "Missing Information";
  }else {

    $user = strip_tags($user);
    $user = $db->real_escape_string($user);
    $pwrd = strip_tags($pwrd);
    $pwrd = $db->real_escape_string($pwrd);
    $pwrd = md5($pwrd);

    $query = $db->query("SELECT user_id, username FROM user Where username='$user' AND password='$pwrd'");
    if ($query->num_rows === 1) {
      while ($row = $query->fetch_object()) {
        $_SESSION['user_id'] = $row->user_id;
      }

      if ($user != "admin"){
        header('location:../index.php');
      exit();
    }else {
        header('location:index1.php');
        exit();
      }

    }else {
      echo "Missing Information";
    }
  }
}
 ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <script src="http://code.jquery.com.jquery-1.5.min.js"></script>
    </head>
    <body>
<div id="container">
    <form action="login.php"method="post">
      <p>
      <label>Username</label><input type="text"name="username"/>
    </p>
    <p>
      <label>Password</label><input type="password"name="pwrd"/>
    </p>
      <input type="submit"name="submit"value="logIn"/>
    </form>
</div>
    </body>
    </html>
