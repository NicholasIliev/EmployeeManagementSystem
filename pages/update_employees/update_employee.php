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
                <li><a href="../dashboard/dashboard.php">Dashboard</a></li>
                <li><a href="../add_employee/add_employee.php">Add Employee</a></li>
                <li><a href="#" class="active">Update Employee</a></li>
                <li><a href="../delete_employee/delete_employee.php">Delete Employee</a></li>
                <li><a href="../display_employees/display_employees.php">Display Employees</a></li>
                <li><a href="../birthday_employees/birthday_employees.php">Birthday Employees</a></li>
                <li><a href="../terminations_log/terminations_log.php">Terminations Log</a></li>
                <li><a href="../../logout.php">Logout</a></li>
            </ul>
        </div>

        <div class="content">
            <header>
                <h1>Update Employee Details</h1>
                <p class="lead">Kilburnazon</p>
            </header>

            <section>
                <form action="update_employee.php" method="post" class="employee-form">
                    <div class="form-group">
                        <label for="emp_id">Employee ID:</label>
                        <input type="text" name="emp_id" required>
                    </div>
                    <div class="form-group">
                        <label for="salary">New Salary:</label>
                        <input type="text" name="new_salary">
                    </div>
                    <div class="form-group">
                        <label for="emergency_phone">New Emergency Contact Phone:</label>
                        <input type="text" name="new_emergency_phone">
                    </div>
                    <div class="form-group">
                        <label for="new_address">New Address:</label>
                        <input type="text" name="new_address">
                    </div>
                    <div class="form-group">
                        <label for="new_manager_id">New Manager ID:</label>
                        <input type="text" name="new_manager_id">
                    </div>
                    <button type="submit" class="submit-btn">Update Employee</button>
                </form>
            </section>
        </div>
    </div>


</body>
</html>

<?php

include '../../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Initialize variables to null, otherwise values that we don't want to update will be set to empty strings or 0
    $new_salary = $new_emergency_phone = $new_address = $new_manager_id = null;

    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);

    if (isset($_POST['new_salary']) && $_POST['new_salary'] !== '') {
        $new_salary = mysqli_real_escape_string($con, $_POST['new_salary']);
    }

    if (isset($_POST['new_emergency_phone']) && $_POST['new_emergency_phone'] !== '') {
        $new_emergency_phone = mysqli_real_escape_string($con, $_POST['new_emergency_phone']);
    }

    if (isset($_POST['new_address']) && $_POST['new_address'] !== '') {
        $new_address = mysqli_real_escape_string($con, $_POST['new_address']);
    }

    if (isset($_POST['new_manager_id']) && $_POST['new_manager_id'] !== '') {
        $new_manager_id = mysqli_real_escape_string($con, $_POST['new_manager_id']);
    }

    // Check if the employee ID exists
    $check_employee_query = "SELECT * FROM employee WHERE emp_id = ?";
    $stmt_check_employee = mysqli_prepare($con, $check_employee_query);
    mysqli_stmt_bind_param($stmt_check_employee, "s", $emp_id);
    mysqli_stmt_execute($stmt_check_employee);
    mysqli_stmt_store_result($stmt_check_employee);

    if (mysqli_stmt_num_rows($stmt_check_employee) === 0) {
        echo "Employee with the specified ID does not exist.";
    } else {
        if ($new_emergency_phone !== null) {
            // Update phone number in the emergencycontact table
            $update_emergency_phone_query = "UPDATE emergencycontact SET phone_number = ? WHERE emergency_contact_id = 
                    (SELECT emergency_contact_id FROM employee WHERE emp_id = ?)";
            $stmt_update_emergency_phone = mysqli_prepare($con, $update_emergency_phone_query);
            mysqli_stmt_bind_param($stmt_update_emergency_phone, "ss", $new_emergency_phone, $emp_id);

            if (mysqli_stmt_execute($stmt_update_emergency_phone)) {
                echo "Emergency contact phone number updated successfully!";
            } else {
                error_log("Error: " . $update_emergency_phone_query . "\n" . mysqli_error($con), 0);
                echo "An error occurred while updating the emergency contact phone number. Please try again later.";
            }
            mysqli_stmt_close($stmt_update_emergency_phone);
        }

        $update_query = "UPDATE employee SET";
        $param_types = "";
        $param_values = array();

        if ($new_salary !== null) {
            $update_query .= " salary = ?,";
            $param_types .= "s";
            $param_values[] = $new_salary;
        }
        if ($new_address !== null) {
            $update_query .= " address = ?,";
            $param_types .= "s";
            $param_values[] = $new_address;
        }
        if ($new_manager_id !== null) {
            $update_query .= " manager_id = ?,";
            $param_types .= "s";
            $param_values[] = $new_manager_id;
        }
        if (!empty($param_values)) {
            $update_query = rtrim($update_query, ',');
            $update_query .= " WHERE emp_id = ?";

            $param_types .= "s";
            $param_values[] = $emp_id;

            echo "Debugging: $update_query\n";
            print_r($param_values);

            $stmt = mysqli_prepare($con, $update_query);
            mysqli_stmt_bind_param($stmt, $param_types, ...$param_values);

            if (mysqli_stmt_execute($stmt)) {
                echo "Employee details updated successfully!";
            } else {
                error_log("Error: " . $update_query . "\n" . mysqli_error($con), 0);
                echo "An error occurred while updating the employee details. Please try again later.";
            }
            mysqli_stmt_close($stmt);
        } else {
            echo "No fields provided for update.";
        }
    }
    mysqli_stmt_close($stmt_check_employee);
}
mysqli_close($con);
?>

