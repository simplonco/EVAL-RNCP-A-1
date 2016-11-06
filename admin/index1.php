<?php
session_start();
if(!isset($_SESSION['user_id'])){
  header('location: login.php');
  exit();
}
require '../includes/db_connect.php';
//post count
$post_count = $db->query("SELECT * FROM posts");
//comment count
$comment_count = $db->query("SELECT * FROM comments");
if (isset($_POST['submit'])){
  $newCategory = $_POST['newCategory'];
  if(!empty($newCategory)){
    $sql = "INSERT INTO categories (category) VALUES ('$newCategory')";
    $query = $db->query($sql);
    if ($query) {
      echo "New category added";
    }else {
      echo "Error";
    }

  }else {
    echo "Missing newCategory";
  }
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
<style>
body {

}
#container{
  padding:10px;
  width: 800px;
  margin: auto;
  background: white;
}
#menu{
  height: 40px;
  line-height: 40px;
}
#menu ul {
  margin: 0;
  padding: 0;
}
#menu ul li{
  display: inline;
  list-style: none;
  margin-right: 10px;
  font-size: 18px;
}
#mainContent{
  clear: both;
  margin-top: 5px;
  font-size: 25px;
}
#header{
  height: 80px;
  line-height: 80px;
}
#container #header h1 {
  front-size: 45px;
  margin: 0;
}
</style>
</head>
 <body>
    <div id="container">
      <div id="menu">
        <ul>
          <li><a href="../index.php">Home</a></li>
          <li><a href="new_post.php">Creat New Post</a></li>
          <li><a href="logout.php">Log Out</a></li>
        </ul>
      </div>
      <div id="mainContent">
        <table>
          <tr>
            <td>Total Blog Post</td>
            <td><?php echo $post_count->num_rows?></td>
          </tr>
          <tr>
            <td>Total comments</td>
            <td><?php echo $comment_count->num_rows?></td>
          </tr>
        </table>
        <div id="categoryForm">
           <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">
             <label for="category">Add New category</label><input type="text" name="newCategory"><input type="submit" name="submit"value="submit">
           </form>
      </div>
    </div>
 </body>
</html>
