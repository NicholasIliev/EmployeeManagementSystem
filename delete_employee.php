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
                <li><a href="index.php">Dashboard</a></li>
                <li><a href="add_employee.php">Add Employee</a></li>
                <li><a href="update_employee.php">Update Employee</a></li>
                <li><a href="delete_employee.php" class="active">Delete Employee</a></li>
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="birthday_employees.php">Birthday Employees</a></li>
                <li><a href="terminations_log.php">Terminations Log</a></li>
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
                    <div class="form-group">
                        <label for="deleting_employee_id">Deleter ID:</label>
                        <input type="text" name="deleting_employee_id" required>
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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize form data
    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);
    $deleting_employee_id = mysqli_real_escape_string($con, $_POST['deleting_employee_id']);

    // Check if the employee ID exists
    $check_employee_query = "SELECT * FROM employee WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $check_employee_query);

    if (mysqli_num_rows($result) === 0) {
        echo "Employee with the specified ID does not exist.";
    } else {
        // Get the associated emergency_contact_id
        $get_emergency_contact_query = "SELECT emergency_contact_id FROM employee WHERE emp_id = '$emp_id'";
        $emergency_contact_result = mysqli_query($con, $get_emergency_contact_query);

        if ($emergency_contact_row = mysqli_fetch_assoc($emergency_contact_result)) {
            $emergency_contact_id = $emergency_contact_row['emergency_contact_id'];

            // Delete the employee
            $delete_employee_query = "DELETE FROM employee WHERE emp_id = '$emp_id'";

            // Delete the associated emergency contact
            $delete_emergency_query = "DELETE FROM emergencycontact WHERE emergency_contact_id = $emergency_contact_id";

            // Start a transaction
            mysqli_begin_transaction($con);

            if (mysqli_query($con, $delete_employee_query) && mysqli_query($con, $delete_emergency_query)) {
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
        } else {
            echo "Error retrieving emergency contact information.";
        }
    }
}

// Close the database connection
mysqli_close($con);
?>

