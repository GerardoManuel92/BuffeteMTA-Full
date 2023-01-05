<?php

$servername = "localhost:3307";
$database = "buffete";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password, $database);


if(!$conn){
    //die("Conexion fallida: " . mysqli_connect_error());   
}else{
    //echo "Conexion exitosa";
}
