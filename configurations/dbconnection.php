<?php
function openconnection()
 {
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $db = "woofx";
 $dbport = 3306;
 $conn = new mysqli($dbhost, $dbuser, $dbpass,$db,$dbport) or die("Connect failed: %s\n". $conn -> error);
 
 return $conn;
 }
 
function closeconnection($conn)
 {
 $conn -> close();
 }
   
?>