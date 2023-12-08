<?php
// process_login.php
session_start();
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);
    $password = mysqli_real_escape_string($con, $_POST['password']); // Assuming you have a password input field in your form

    $login_query = "SELECT * FROM management WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $login_query);

    if (mysqli_num_rows($result) === 1) {
        $manager = mysqli_fetch_assoc($result);

        // Verify the entered password
        if (password_verify($password, $manager['password'])) {
            // Store manager details in session
            $_SESSION['emp_id'] = $manager['emp_id'];
            $_SESSION['name'] = $manager['name']; // Assuming there's a 'name' field in the 'management' table

            header('Location: dashboard.php');
            exit;
        } else {
            echo "Invalid password. Please try again.";
        }
    } else {
        echo "Invalid employee ID. Please try again.";
    }
}

mysqli_close($con);
?>
