<?php

include('dbconnection.php');

$conn  = openconnection();

//echo "Connected Successfully";
$sql = "SELECT * FROM ANIMAL";
$result = $conn->query($sql);

$animals = array();
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $animals[$row["ID"]] = $row["NAME"];
  }
} else {
  echo "0 results";
}

closeconnection($conn);
echo json_encode($animals);
return json_encode($animals);
?>