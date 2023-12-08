<?php
session_start();

// Unset all of the session variables
$_SESSION = array();

session_destroy();

// Redirect to login
header("Location: pages/login/login.php");
exit;
?>
