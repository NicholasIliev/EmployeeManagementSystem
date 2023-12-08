

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>Add Employee</title>
    <script src="password_strength.js"></script>
    <script src="dynamicManagerPassword.js"></script>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h3>Kilburnazon</h3>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="#" class="active">Add Employee</a></li>
                <li><a href="update_employee.php">Update Employee</a></li>
                <li><a href="delete_employee.php">Delete Employee</a></li>
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="birthday_employees.php">Birthday Employees</a></li>
                <li><a href="terminations_log.php">Terminations Log</a></li>
                <li><a href="logout.php">Logout</a></li>
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
                        <select name="department" id="department" required>
                            <option value="1">HR</option>
                            <option value="2">Management</option>
                            <option value="3">Packagers</option>
                            <option value="4">Drivers</option>
                        </select>
                    </div>

                    <div class="form-group" id="managerPasswordGroup" style="display: none;">
                        <label for="manager_password">Manager Password:</label>
                        <input type="password" name="manager_password" id="manager_password" required>
                        <small>Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.</small>
                        <div id="password-strength"></div>
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
    $manager_password = isset($_POST['manager_password']) ? mysqli_real_escape_string($con, $_POST['manager_password']) : '';

    // Get the highest manager_id from the management table
    $get_highest_manager_id_query = "SELECT MAX(manager_id) AS max_manager_id FROM management";
    $result = mysqli_query($con, $get_highest_manager_id_query);
    $row = mysqli_fetch_assoc($result);
    $max_manager_id = $row['max_manager_id'];

    // Increment the manager_id to get the next available manager_id
    $next_manager_id = $max_manager_id + 1;

    // Check if the employee is a manager and the manager password is not provided
    if ($department_id == 2 && empty($manager_password)) {
        echo "Manager password is required for employees in the Management department.";
    } else {
        // Check for password strength
        if (!isPasswordStrong($manager_password)) {
            echo "Password does not meet the required strength criteria.";
        } else {
            // Hash the manager password if provided
            $hashedManagerPassword = !empty($manager_password) ? password_hash($manager_password, PASSWORD_DEFAULT) : null;

            // Insert the new manager into the management table with the hashed password
            $insert_manager_query = "INSERT INTO management (manager_id, password) VALUES (?, ?)";
            $stmt_insert_manager = mysqli_prepare($con, $insert_manager_query);
            mysqli_stmt_bind_param($stmt_insert_manager, "ss", $next_manager_id, $hashedManagerPassword);
            mysqli_stmt_execute($stmt_insert_manager);

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
                $insert_query = "INSERT INTO employee (emp_id, name, address, salary, dob, nin, department_id, emergency_contact_id, manager_id) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                // Create a prepared statement
                $stmt = mysqli_prepare($con, $insert_query);

                // Bind parameters to the prepared statement
                mysqli_stmt_bind_param($stmt, "sssssssss", $emp_id, $name, $address, $salary, $dob, $nin, $department_id, $emergency_contact_id, $next_manager_id);

                // Execute the prepared statement
                if (mysqli_stmt_execute($stmt)) {
                    echo "Employee added successfully!";

                    // Fetch emp_id and name from employee table
                    $get_employee_data_query = "SELECT emp_id, name FROM employee WHERE emp_id = ?";
                    $stmt_fetch_employee_data = mysqli_prepare($con, $get_employee_data_query);
                    mysqli_stmt_bind_param($stmt_fetch_employee_data, "s", $emp_id);
                    mysqli_stmt_execute($stmt_fetch_employee_data);
                    mysqli_stmt_bind_result($stmt_fetch_employee_data, $fetched_emp_id, $fetched_name);
                    mysqli_stmt_fetch($stmt_fetch_employee_data);
                    mysqli_stmt_close($stmt_fetch_employee_data);

                    // Update emp_id and name in the management table
                    $update_management_query = "UPDATE management SET emp_id = ?, name = ? WHERE manager_id = ?";
                    $stmt_update_management = mysqli_prepare($con, $update_management_query);
                    mysqli_stmt_bind_param($stmt_update_management, "sss", $fetched_emp_id, $fetched_name, $next_manager_id);
                    mysqli_stmt_execute($stmt_update_management);
                    mysqli_stmt_close($stmt_update_management);
                } else {
                    // Log the error and present a user-friendly message
                    error_log("Error: " . $insert_query . "\n" . mysqli_error($con), 0);
                    echo "An error occurred while adding the employee. Please try again later.";
                }

                // Close the statement
                mysqli_stmt_close($stmt);
            }
        }
    }
}

// Close the database connection
mysqli_close($con);

// Function to check if a password is strong
function isPasswordStrong($password) {
    // Minimum length
    if (strlen($password) < 8) {
        return false;
    }

    // Uppercase letter
    if (!preg_match('/[A-Z]/', $password)) {
        return false;
    }

    // Lowercase letter
    if (!preg_match('/[a-z]/', $password)) {
        return false;
    }

    // Number
    if (!preg_match('/[0-9]/', $password)) {
        return false;
    }

    // Special character
    if (!preg_match('/[^A-Za-z0-9]/', $password)) {
        return false;
    }

    // Additional checks if needed

    return true;
}


// Function to generate a random password
function generateRandomPassword($length = 8) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $password;
}
?>
