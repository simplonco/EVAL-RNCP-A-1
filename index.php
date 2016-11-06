<?php
require 'includes/db_connect.php';
//get record of database
$record_count = $db->query("SELECT * FROM posts");
//amount  display
$per_page = 2;
//number of pages
$pages = ceil($record_count->num_rows/$per_page);
//get page Number
if (isset($_GET['p']) && is_numeric($_GET['p'])){
  $page = $_GET['p'];
}else{
  $page = 1;
}
if ($page<=0) {
  $start = 0;
}else{

  $start= $page * $per_page - $per_page;

}
$prev= $page - 1;
$next= $page + 1;

$query = $db->prepare("SELECT post_id, title, LEFT(body, 100) AS body, category FROM posts INNER JOIN categories ON categories.category_id=posts.category_id order by post_id desc limit $start, $per_page");
$query->execute();
$query->bind_result($post_id, $title, $body, $category);
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
  margin: auto;
  width: 800px;
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
      <li><a href="admin/new_post.php">Creat New Post</a></li>
      <li><a href="admin/logout.php">Log Out</a></li>
    </ul>
  </div>
  <?php
 while ($query->fetch()):
   $lastspace = strrpos($body, ' ');
 ?>
  <article >
    <h2><?php echo $title ?></h2>
    <p><?php  echo substr($body, 0, $lastspace)."<a href='post.php?id=$post_id'>..read more</a>"?></p>
    <p>Category: <?php echo $category ?></p>
  </article>
   <?php endwhile?>
   <?php
      if ($prev > 0) {
        echo "<a href='index.php?p=$prev'>Prev</a>";
      }
      if ($page< $pages) {
        echo "<a href='index.php?p=$next'>Next</a>";
      }
    ?>
</div>
</body>
</html>
