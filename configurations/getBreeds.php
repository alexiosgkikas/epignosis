<?php
include('dbconnection.php');

$conn  = openconnection();

//echo "Connected Successfully";


$id = intval($_GET['id']);

$breeds = array();

$sql = "SELECT ID ,NAME FROM BREED WHERE ID_ANIMAL = ".$id;
$result = $conn->query($sql);


if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $breeds[$row["ID"]] = $row["NAME"];
  }
} else {
  echo "0 results";
}
closeconnection($conn);
echo json_encode($breeds);
return json_encode($breeds);
?>