<?php
 session_start();
include('dbconnection.php');

$conn  = openconnection();

$message = array(); 

$code = strtoupper($_GET['code']);
$password = $_GET['pass'];

//check if chip code exist in db first 
$sql = "SELECT password FROM PET WHERE chip_code= '" .$code. "'";
$result = $conn->query($sql);
if ($result->num_rows == 0 ) {
    $message[0] = false;
    $message[1] = "Uknown Chip Code! Please Try Again!";
    echo json_encode($message);
    closeconnection($conn);
    return json_encode($message);
}else{
    $row = $row = $result->fetch_assoc();
    $hashed_password = $row['password'];
    if(password_verify($password, $hashed_password)){
        $message[0] = true;
        $message[1] = "Welcome";
       
        $_SESSION["code"] = $code;
    }
    else{
        $message[0] = false;
        $message[1] = "Wrong Password! Please Try Again!";
    }
}

echo json_encode($message);
closeconnection($conn);
return json_encode($message);
?>



