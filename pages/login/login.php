<?php
session_start();
include '../../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);
    $password = mysqli_real_escape_string($con, $_POST['password']);

    $login_query = "SELECT * FROM management WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $login_query);

    if (mysqli_num_rows($result) === 1) {
        $manager = mysqli_fetch_assoc($result);

        // Verify the entered password
        if (password_verify($password, $manager['password'])) {
            // Store manager details in session
            $_SESSION['emp_id'] = $manager['emp_id'];
            $_SESSION['name'] = $manager['name']; // Assuming there's a 'name' field in the 'management' table

            header('Location: ../dashboard/dashboard.php');
            exit;
        } else {
            $error_message = "Invalid password. Please try again.";
        }
    } else {
        $error_message = "Invalid employee ID. Please try again.";
    }
}

mysqli_close($con);
?>

<!-- login.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../../assets/styles.css">
</head>
<body>
    <div>
        <header>
            <br><br><br><br><br><br><br><br><br><br><br><br>
            <h1>Login</h1>
            <br><br><br><br>
        </header>
        <form action="login.php" method="post" class="employee-form">
            <div class="form-group">
                <label for="emp_id">Employee ID:</label>
                <input type="text" name="emp_id" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit" class="submit-btn">Login</button>
        </form>
    </div>
</body>
</html>

