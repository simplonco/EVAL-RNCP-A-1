<?php
if (!isset($_GET['id'])) {
header('location: index.php');
exit();
}else {
  $id = $_GET['id'];
}
require 'includes/db_connect.php';
if (!is_numeric($id)) {
  header('location: index.php');
}
$sql = "SELECT title, body FROM posts WHERE post_id='$id'";
$query = $db->query($sql);
if ($query->num_rows != 1) {
  header('location: index.php');
  exit();
}
if (isset($_POST['submit'])) {
  $email = $_POST['email'];
  $name = $_POST['name'];
  $comment = $_POST['comment'];
  if ($email && $name && $comment) {
      $email = $db->real_escape_string($email);
      $name = $db->real_escape_string($name);
      $id = $db->real_escape_string($id);
      $comment = $db->real_escape_string($comment);
      if ($addComment = $db->prepare("INSERT INTO comments(name, post_id, email_add, comment) VALUES (?,?,?,?)")) {
        $addComment->bind_param('ssss', $name, $id, $email, $comment);
        $addComment->execute();
        echo "Thank you for your comment";
        $addComment->close();
      }else {
        echo "Error";
      }
  }else {
    echo "Error";
  }
}
 ?>
 <!DOCTYPE html>
 <html lang="en">
   <head>
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=9">
     <!--[if lt IE 9]>
       <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
     <![endif]-->
     <script src="http://code.jquery.com.jquery-1.5.min.js"></script>
 <style>
#container{
  width: 800px;
  padding: 5px;
  margin: auto;
}
label{
  display: block;
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
 </style>
 </head>
  <body>
   <div id="container">
     <div id="menu">
       <ul>
         <li><a href="index.php">Home</a></li>
       </ul>
     </div>
     <div id="post">
       <?php
        $row = $query->fetch_object();
        echo "<h2>".$row->title."</h2>";
        echo "<p>".$row->body."</p>";
        ?>
     </div>
     <hr/>
     <div id="add-comments">
       <form action="<?php echo $_SERVER['PHP_SELF']."?id=$id"?>" method="post">
          <div>
            <label>Email Address</label><input type="text" name="email">
          </div>
          <div>
            <label>Name</label><input type="text" name="name">
          </div>
          <div>
            <label>Comment</label><textarea name="comment"></textarea>
          </div>
          <input type="submit" name="submit">
       </form>
     </div>
     <hr />
     <div id="comments">
       <?php
       $query = $db->query("SELECT * FROM comments WHERE post_id='$id' ORDER BY comment_id DESC");
       while ($row = $query->fetch_object()):
        ?>
        <div>
          <h5><?php echo $row->name?></h5>
          <blockquote><?php echo $row->comment?> </blockquote>
        </div>
           <?php endwhile; ?>
     </div>
   </div>
  </body>
</html>
