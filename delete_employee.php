<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>Employee Management System</title>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h3>Kilburnazon</h3>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="add_employee.php">Add Employee</a></li>
                <li><a href="update_employee.php">Update Employee</a></li>
                <li><a href="delete_employee.php" class="active">Delete Employee</a></li>
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="birthday_employees.php">Birthday Employees</a></li>
                <li><a href="terminations_log.php">Terminations Log</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </div>

        <div class="content">
            <header>
                <h1>Employee Management System</h1>
                <p class="lead">Efficiently manage your workforce.</p>
            </header>

            <section>
                <form action="delete_employee.php" method="post" class="employee-form">
                    <div class="form-group">
                        <label for="emp_id">Delete Employee ID:</label>
                        <input type="text" name="emp_id" required>
                    </div>
                    <button type="submit" class="submit-btn">Delete Employee</button>
                </form>
            </section>
        </div>
    </div>
</body>
</html>


<?php
// Include database connection code
include 'db_connect.php';

// Start or resume the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION['emp_id'])) {
    header('Location: login.php');
    exit;
}

// Retrieve the logged-in user's ID as the deleter ID
$deleting_employee_id = $_SESSION['emp_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize form data
    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);

    // Check if the employee ID exists
    $check_employee_query = "SELECT * FROM employee WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $check_employee_query);

    if (mysqli_num_rows($result) === 0) {
        echo "Employee with the specified ID does not exist.";
    } else {
        // Get the associated emergency_contact_id and department_id
        $get_employee_info_query = "SELECT emergency_contact_id, department_id FROM employee WHERE emp_id = '$emp_id'";
        $employee_info_result = mysqli_query($con, $get_employee_info_query);

        if ($employee_info_row = mysqli_fetch_assoc($employee_info_result)) {
            $emergency_contact_id = $employee_info_row['emergency_contact_id'];
            $department_id = $employee_info_row['department_id'];

            // If the employee is a manager, store manager info for later deletion
            $manager_info = null;
            if ($department_id == 2) {
                $get_manager_info_query = "SELECT * FROM management WHERE emp_id = '$emp_id'";
                $manager_info_result = mysqli_query($con, $get_manager_info_query);

                if ($manager_info_row = mysqli_fetch_assoc($manager_info_result)) {
                    $manager_info = $manager_info_row;
                }
            }

            // Delete the employee
            $delete_employee_query = "DELETE FROM employee WHERE emp_id = '$emp_id'";

            // Delete the employee's emergency contact
            $delete_emergency_query = "DELETE FROM emergencycontact WHERE emergency_contact_id = $emergency_contact_id";
            mysqli_query($con, $delete_emergency_query);

            // Start a transaction
            mysqli_begin_transaction($con);

            if (mysqli_query($con, $delete_employee_query)) {
                // Commit the transaction
                mysqli_commit($con);

                // Log the deletion in the terminations_log table
                $deletion_date = date('Y-m-d');
                $deletion_time = date('H:i:s');
                $log_termination_query = "INSERT INTO terminations_log (emp_id, termination_date, termination_time, deleting_employee_id)
                                          VALUES ('$emp_id', '$deletion_date', '$deletion_time', '$deleting_employee_id')";

                if (mysqli_query($con, $log_termination_query)) {
                    echo "Employee and associated data deleted successfully, and termination logged!";
                } else {
                    // Log the error and present a user-friendly message
                    error_log("Error: " . $log_termination_query . "\n" . mysqli_error($con), 0);
                    echo "An error occurred while logging the termination. Please try again later.";
                }
            } else {
                // Roll back the transaction in case of an error
                mysqli_rollback($con);

                // Log the error and present a user-friendly message
                error_log("Error: " . $delete_employee_query . "\n" . mysqli_error($con), 0);
                echo "An error occurred while deleting the employee. Please try again later.";
            }

            // If the employee is a manager, delete the stored manager info
            if ($department_id == 2 && $manager_info) {
                $delete_stored_manager_query = "DELETE FROM management WHERE emp_id = '{$manager_info['emp_id']}'";
                mysqli_query($con, $delete_stored_manager_query);
            }
        } else {
            echo "Error retrieving employee information.";
        }
    }
}

// Close the database connection
mysqli_close($con);
?>
