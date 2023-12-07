<?php
// Database configuration
$serverName = 'localhost';
$username = 'root';
$password = '';
$database = 'kilburnazon2';

// Create a database connection
$con = mysqli_connect($serverName, $username, $password, $database);

// Check the connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
} else {
    echo "Connected successfully!!!!";
}
?>
