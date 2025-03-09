<?php

$con = mysqli_connect("localhost","root","","postdb");
//check the connection working or not
if(!$con){ 
    echo "Connection failed".mysqli_connect_error();
    exit();
}
$query = "SELECT * FROM flight";
$result = mysqli_query($con,$query);
$json_aaray = array();
while ($row = mysqli_fetch_assoc($result))
{
    $json_aaray[]=$row;

}
print(json_encode($json_aaray));
mysqli_close($con);


?>