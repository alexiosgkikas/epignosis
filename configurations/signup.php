<?php
include('dbconnection.php');

$conn  = openconnection();


$message = array(); 

//check if chip code is good
$code = strtoupper($_GET['code']);
if(!ctype_alnum($code) || strlen($code)<10){
    $message[0] = false;
    $message[1] = "Chip Code is not vaild";
    echo json_encode($message);
    closeconnection($conn);
    return json_encode($message);
}


//check if chip code exist in db
$sql = "SELECT * FROM PET WHERE chip_code= '" .$code. "'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $message[0] = false;
    $message[1] = "Chip Code already exist in Database";
    echo json_encode($message);
    closeconnection($conn);
    return json_encode($message);
}

//hash password
$password = $_GET['pass'];

$hashed_password = password_hash($password, PASSWORD_BCRYPT);
$message = array(); 

$sql = "INSERT INTO  `pet` (`NAME`, `id_animal`, `id_breed`, `email`, `password`, `chip_code`) VALUES ('" .$_GET['name']. "'," .$_GET['animal']. "," .$_GET['breed']. ",'" .$_GET['email']. "','" .$hashed_password. "','" .$code. "')";
$result = $conn->query($sql);
if($result){
    $message[0] = $result ;
    $message[1] = "The form was Successfully submitted ";
    
}else{
    $message[1] = "Something went horrible wrong";
    $message[0] = $result ;
}
//just a template
// http://localhost:8081/epignosis/configurations/signup.php?name=alex&code=1234567890&animal=1&breed=1&pass=1234567&email=alexios@mail.com

closeconnection($conn);
echo json_encode($message);
return json_encode($message);
?>