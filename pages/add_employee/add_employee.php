<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/styles.css">
    <title>Add Employee</title>
    <script src="password_strength.js"></script>
    <script src="../../assets/js/dynamicManagerPassword.js"></script>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h3>Kilburnazon</h3>
            <ul>
                <li><a href="../dashboard/dashboard.php">Dashboard</a></li>
                <li><a href="#" class="active">Add Employee</a></li>
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
                <h1>Add Employee</h1>
                <p class="lead">Kilburnazon</p>
            </header>
            <section>
                <form action="add_employee.php" method="post" class="employee-form">
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
                        <input type="password" name="manager_password" id="manager_password">
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
                    <button type="submit" class="submit-btn">Add Employee</button>
                </form>
            </section>
        </div>
    </div>
</body>
</html>

<?php
include '../../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get data
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

    // Check if employee is manager
    if ($department_id == 2) {
        // Get the highest manager id so we can increment it to get the next available manager id
        $get_highest_manager_id_query = "SELECT MAX(manager_id) AS max_manager_id FROM management";
        $result = mysqli_query($con, $get_highest_manager_id_query);
        $row = mysqli_fetch_assoc($result);
        $max_manager_id = $row['max_manager_id'];

        $next_manager_id = $max_manager_id + 1;

        $hashedManagerPassword = !empty($manager_password) ? password_hash($manager_password, PASSWORD_DEFAULT) : null;

        $insert_manager_query = "INSERT INTO management (manager_id, password) VALUES (?, ?)";
        $stmt_insert_manager = mysqli_prepare($con, $insert_manager_query);
        mysqli_stmt_bind_param($stmt_insert_manager, "ss", $next_manager_id, $hashedManagerPassword);
        mysqli_stmt_execute($stmt_insert_manager);

    } else {
        $get_highest_manager_id_query = "SELECT MAX(manager_id) AS max_manager_id FROM management";
        $result = mysqli_query($con, $get_highest_manager_id_query);
        $row = mysqli_fetch_assoc($result);
        $max_manager_id = $row['max_manager_id'];

        $next_manager_id = rand(1, $max_manager_id);
    }

    // Generate a random employee.manager_id between 1 and max val management.manager_id
    $random_employee_manager_id = rand(1, $max_manager_id);

    // Ensure that $department_id is defined
    $department_id = isset($department_id) ? $department_id : '';

    // Ensure that other variables are defined
    $emp_id = isset($emp_id) ? $emp_id : '';
    $emergency_name = isset($emergency_name) ? $emergency_name : '';
    $emergency_relationship = isset($emergency_relationship) ? $emergency_relationship : '';
    $emergency_phone = isset($emergency_phone) ? $emergency_phone : '';

    // Check for duplicate employee ID
    $check_duplicate_query = "SELECT emp_id FROM employee WHERE emp_id = '$emp_id'";
    $result = mysqli_query($con, $check_duplicate_query);

    if (mysqli_num_rows($result) > 0) {
        echo "Employee with the same ID already exists. Please choose a different ID.";
    } else {
        $insert_emergency_query = "INSERT INTO emergencycontact (name, relationship, phone_number) 
                                VALUES ('$emergency_name', '$emergency_relationship', '$emergency_phone')";
        mysqli_query($con, $insert_emergency_query);

        // ID of last inserted emergency contact
        $emergency_contact_id = mysqli_insert_id($con);

        $insert_query = "INSERT INTO employee (emp_id, name, address, salary, dob, nin, department_id, emergency_contact_id, manager_id) 
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = mysqli_prepare($con, $insert_query);

        mysqli_stmt_bind_param($stmt, "sssssssss", $emp_id, $name, $address, $salary, $dob, $nin, $department_id, $emergency_contact_id, $random_employee_manager_id);

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

            // Update emp_id and name in the management table if the employee is a manager
            if ($department_id == 2) {
                $update_management_query = "UPDATE management SET emp_id = ?, name = ? WHERE manager_id = ?";
                $stmt_update_management = mysqli_prepare($con, $update_management_query);
                mysqli_stmt_bind_param($stmt_update_management, "sss", $fetched_emp_id, $fetched_name, $next_manager_id);
                mysqli_stmt_execute($stmt_update_management);
                mysqli_stmt_close($stmt_update_management);
            }

            // Insert emp_id and department-specific ID into the respective department tables
            switch ($department_id) {
                case 1: // HR
                    $get_highest_hr_id_query = "SELECT MAX(hr_id) AS max_hr_id FROM hr";
                    $result_hr = mysqli_query($con, $get_highest_hr_id_query);
                    $row_hr = mysqli_fetch_assoc($result_hr);
                    $max_hr_id = $row_hr['max_hr_id'];
                    $next_hr_id = $max_hr_id + 1;
                    $random_department_id = $next_hr_id;

                    $insert_hr_query = "INSERT INTO hr (emp_id, hr_id) VALUES (?, ?)";
                    $stmt_insert_hr = mysqli_prepare($con, $insert_hr_query);
                    mysqli_stmt_bind_param($stmt_insert_hr, "ss", $fetched_emp_id, $random_department_id);
                    mysqli_stmt_execute($stmt_insert_hr);
                    mysqli_stmt_close($stmt_insert_hr);
                    break;
                case 3: // Packagers
                    $get_highest_packager_id_query = "SELECT MAX(packager_id) AS max_packager_id FROM packagers";
                    $result_packager = mysqli_query($con, $get_highest_packager_id_query);
                    $row_packager = mysqli_fetch_assoc($result_packager);
                    $max_packager_id = $row_packager['max_packager_id'];
                    $next_packager_id = $max_packager_id + 6000;
                    $random_department_id = $next_packager_id;

                    $insert_packager_query = "INSERT INTO packagers (emp_id, packager_id) VALUES (?, ?)";
                    $stmt_insert_packager = mysqli_prepare($con, $insert_packager_query);
                    mysqli_stmt_bind_param($stmt_insert_packager, "ss", $fetched_emp_id, $random_department_id);
                    mysqli_stmt_execute($stmt_insert_packager);
                    mysqli_stmt_close($stmt_insert_packager);
                    break;
                case 4: // Drivers
                    $get_highest_driver_id_query = "SELECT MAX(driver_id) AS max_driver_id FROM driver";
                    $result_driver = mysqli_query($con, $get_highest_driver_id_query);
                    $row_driver = mysqli_fetch_assoc($result_driver);
                    $max_driver_id = $row_driver['max_driver_id'];
                    $next_driver_id = $max_driver_id + 1;
                    $random_department_id = $next_driver_id;

                    $insert_driver_query = "INSERT INTO driver (emp_id, driver_id) VALUES (?, ?)";
                    $stmt_insert_driver = mysqli_prepare($con, $insert_driver_query);
                    mysqli_stmt_bind_param($stmt_insert_driver, "ss", $fetched_emp_id, $random_department_id);
                    mysqli_stmt_execute($stmt_insert_driver);
                    mysqli_stmt_close($stmt_insert_driver);
                    break;
                // Add more cases as needed for other departments
            }
        } else {
            error_log("Error: " . $insert_query . "\n" . mysqli_error($con), 0);
            echo "An error occurred while adding the employee. Please try again later.";
        }

        mysqli_stmt_close($stmt);
    }
}
mysqli_close($con);
?>
