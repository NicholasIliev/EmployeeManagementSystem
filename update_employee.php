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
                <li><a href="#" class="active">Update Employee</a></li>
                <li><a href="delete_employee.php">Delete Employee</a></li>
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="birthday_employees.php">Birthday Employees</a></li>
                <li><a href="terminations_log.php">Terminations Log</a></li>
            </ul>
        </div>

        <div class="content">
            <header>
                <h1>Update Employee Details</h1>
                <p class="lead">Kilburnazon</p>
            </header>

            <section>
                <form action="update_employee.php" method="post" class="employee-form">
                    <!-- Add form field for employee ID -->
                    <div class="form-group">
                        <label for="emp_id">Employee ID:</label>
                        <input type="text" name="emp_id" required placeholder="Enter Employee ID">
                    </div>

                    <!-- Add form fields for updating employee details -->
                    <div class="form-group">
                        <label for="salary">New Salary:</label>
                        <input type="text" name="new_salary" placeholder="Leave blank if not needed">
                    </div>

                    <div class="form-group">
                        <label for="emergency_phone">New Emergency Contact Phone:</label>
                        <input type="text" name="new_emergency_phone" placeholder="Leave blank if not needed">
                    </div>

                    <!-- Add submit button -->
                    <button type="submit" class="submit-btn">Update Employee</button>
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
    $new_salary = mysqli_real_escape_string($con, $_POST['new_salary']);
    $new_emergency_phone = isset($_POST['new_emergency_phone']) ? mysqli_real_escape_string($con, $_POST['new_emergency_phone']) : null;

    // Check if the employee ID exists
    $check_employee_query = "SELECT * FROM employee WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $check_employee_query);

    if (mysqli_num_rows($result) === 0) {
        echo "Employee with the specified ID does not exist.";
    } else {
        // Update employee data in the 'employee' table
        $update_query = "UPDATE employee SET salary = ? WHERE emp_id = ?";
        
        // If a new emergency phone is provided, update it
        if ($new_emergency_phone !== null) {
            $update_query = "UPDATE employee SET salary = ?, emergency_contact_id = ? WHERE emp_id = ?";
        }

        // Create a prepared statement
        $stmt = mysqli_prepare($con, $update_query);

        // If a new emergency phone is provided, bind parameters accordingly
        if ($new_emergency_phone !== null) {
            mysqli_stmt_bind_param($stmt, "dss", $new_salary, $new_emergency_phone, $emp_id);
        } else {
            mysqli_stmt_bind_param($stmt, "ds", $new_salary, $emp_id);
        }

        // Execute the prepared statement
        if (mysqli_stmt_execute($stmt)) {
            echo "Employee details updated successfully!";
        } else {
            // Log the error and present a user-friendly message
            error_log("Error: " . $update_query . "\n" . mysqli_error($con), 0);
            echo "An error occurred while updating the employee details. Please try again later.";
        }

        // Close the statement
        mysqli_stmt_close($stmt);
    }
}

// Close the database connection
mysqli_close($con);
?>

