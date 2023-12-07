<?php
require_once 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data and perform database insertion
    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);
    // Use prepared statements for other form data insertion
    // ...

    // Redirect to a success page or back to the form
    header("Location: success_page.php");
    exit();
}
?>
