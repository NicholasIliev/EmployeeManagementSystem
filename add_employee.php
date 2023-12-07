<!-- index.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>Add Employee</title>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h3>Kilburnazon</h3>
            <ul>
                <li><a href="index.php">Dashboard</a></li>
                <li><a href="#" class="active">Add Employee</a></li>
                <li><a href="update_employee.php">Update Employee</a></li>
                <li><a href="delete_employee.php">Delete Employee</a></li>
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="birthday_employees.php">Birthday Employees</a></li>
                <li><a href="terminations_log.php">Terminations Log</a></li>
            </ul>
        </div>

        <div class="content">
            <header>
                <h1>Add Employee</h1>
                <p class="lead">Kilburnazon</p>
            </header>

            <section>
                <form action="add_employee.php" method="post" class="employee-form">
                    <!-- Add form fields for employee details -->
                    <div class="form-group">
                        <label for="emp_id">Employee ID:</label>
                        <input type="text" name="emp_id" required>
                    </div>

                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" name="address" required>
                    </div>

                    <div class="form-group">
                        <label for="salary">Salary:</label>
                        <input type="text" name="salary" required>
                    </div>

                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" name="dob" required>
                    </div>

                    <div class="form-group">
                        <label for="nin">NIN:</label>
                        <input type="text" name="nin" required>
                    </div>

                    <div class="form-group">
                        <label for="department">Department:</label>
                        <select name="department" required>
                            <option value="1">HR</option>
                            <option value="2">Management</option>
                            <option value="3">Packagers</option>
                            <option value="4">Drivers</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="emergency_name">Emergency Name:</label>
                        <input type="text" name="emergency_name" required>
                    </div>

                    <div class="form-group">
                        <label for="emergency_relationship">Emergency Relationship:</label>
                        <input type="text" name="emergency_relationship" required>
                    </div>

                    <div class="form-group">
                        <label for="emergency_phone">Emergency Phone:</label>
                        <input type="text" name="emergency_phone" required>
                    </div>

                    <!-- Add submit button -->
                    <button type="submit" class="submit-btn">Add Employee</button>
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
    $name = mysqli_real_escape_string($con, $_POST['name']);
    $address = mysqli_real_escape_string($con, $_POST['address']);
    $salary = mysqli_real_escape_string($con, $_POST['salary']);
    $dob = mysqli_real_escape_string($con, $_POST['dob']);
    $nin = mysqli_real_escape_string($con, $_POST['nin']);
    $department_id = mysqli_real_escape_string($con, $_POST['department']);
    $emergency_name = mysqli_real_escape_string($con, $_POST['emergency_name']);
    $emergency_relationship = mysqli_real_escape_string($con, $_POST['emergency_relationship']);
    $emergency_phone = mysqli_real_escape_string($con, $_POST['emergency_phone']);

    // Check for duplicate employee ID
    $check_duplicate_query = "SELECT emp_id FROM employee WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $check_duplicate_query);

    if (mysqli_num_rows($result) > 0) {
        echo "Employee with the same ID already exists. Please choose a different ID.";
    } else {
        // Insert data into the 'emergencycontact' table
        $insert_emergency_query = "INSERT INTO emergencycontact (name, relationship, phone_number) 
                                VALUES ('$emergency_name', '$emergency_relationship', '$emergency_phone')";
        mysqli_query($con, $insert_emergency_query);

        // Get the ID of the last inserted emergency contact
        $emergency_contact_id = mysqli_insert_id($con);

        // SQL query to insert employee data into the database using prepared statements
        $insert_query = "INSERT INTO employee (emp_id, name, address, salary, dob, nin, department_id, emergency_contact_id) 
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        // Create a prepared statement
        $stmt = mysqli_prepare($con, $insert_query);

        // Bind parameters to the prepared statement
        mysqli_stmt_bind_param($stmt, "ssssssss", $emp_id, $name, $address, $salary, $dob, $nin, $department_id, $emergency_contact_id);

        // Execute the prepared statement
        if (mysqli_stmt_execute($stmt)) {
            echo "Employee added successfully!";
        } else {
            // Log the error and present a user-friendly message
            error_log("Error: " . $insert_query . "\n" . mysqli_error($con), 0);
            echo "An error occurred while adding the employee. Please try again later.";
        }

        // Close the statement
        mysqli_stmt_close($stmt);
    }
}

// Close the database connection
mysqli_close($con);
?>
