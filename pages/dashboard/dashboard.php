<?php
session_start();

// Check if user is logged
if (!isset($_SESSION['emp_id'])) {
    header('Location: login.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/styles.css">
    <title>Employee Management System</title>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h3>Kilburnazon</h3>
            <ul>
                <li><a href="#" class="active">Dashboard</a></li>
                <li><a href="../add_employee/add_employee.php">Add Employee</a></li>
                <li><a href="../update_employees/update_employee.php">Update Employee</a></li>
                <li><a href="../delete_employee/delete_employee.php">Delete Employee</a></li>
                <li><a href="../display_employees/display_employees.php">Display Employees</a></li>
                <li><a href="../birthday_employees/birthday_employees.php">Birthday Employees</a></li>
                <li><a href="../terminations_log/terminations_log.php">Terminations Log</a></li>
                <li><a href="../../logout.php">Logout</a></li>
            </ul>
        </div>
        <div class="content">
            <header>
                <h1>Employee Management System</h1>
                <p class="lead">Welcome, <?php echo $_SESSION['name']; ?>! Efficiently manage your workforce.</p>
            </header>
        </div>
    </div>

</body>
</html>
