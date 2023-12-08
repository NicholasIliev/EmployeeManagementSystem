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
                <li><a href="../update_employees/update_employee.php">Update Employee</a></li>
                <li><a href="#" class="active">Delete Employee</a></li>
                <li><a href="../display_employees/display_employees.php">Display Employees</a></li>
                <li><a href="../birthday_employees/birthday_employees.php">Birthday Employees</a></li>
                <li><a href="../terminations_log/terminations_log.php">Terminations Log</a></li>
                <li><a href="../../logout.php">Logout</a></li>
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
include '../../includes/db_connect.php';

session_start();

// Check if the user is logged in as we'll be using their ID to log the deletion
if (!isset($_SESSION['emp_id'])) {
    header('Location: login.php');
    exit;
}

// Get logged in employee's ID
$deleting_employee_id = $_SESSION['emp_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $emp_id = mysqli_real_escape_string($con, $_POST['emp_id']);

    // Check if the employee ID exists
    $check_employee_query = "SELECT * FROM employee WHERE emp_id = ?";
    $stmt_check_employee = mysqli_prepare($con, $check_employee_query);
    mysqli_stmt_bind_param($stmt_check_employee, "s", $emp_id);
    mysqli_stmt_execute($stmt_check_employee);
    mysqli_stmt_store_result($stmt_check_employee);

    if (mysqli_stmt_num_rows($stmt_check_employee) === 0) {
        echo "Employee with the specified ID does not exist.";
    } else {
        // Get the associated emergency_contact_id, department_id, and manager_id
        $get_employee_info_query = "SELECT emergency_contact_id, department_id, manager_id FROM employee WHERE emp_id = ?";
        $stmt_get_employee_info = mysqli_prepare($con, $get_employee_info_query);
        mysqli_stmt_bind_param($stmt_get_employee_info, "s", $emp_id);
        mysqli_stmt_execute($stmt_get_employee_info);
        $employee_info_result = mysqli_stmt_get_result($stmt_get_employee_info);

        if ($employee_info_row = mysqli_fetch_assoc($employee_info_result)) {
            $emergency_contact_id = $employee_info_row['emergency_contact_id'];
            $department_id = $employee_info_row['department_id'];
            $manager_id = $employee_info_row['manager_id'];

            // If the employee is a manager store info for later deletion
            // This is because the manager_id is a foreign key in the management table
            $manager_info = null;
            if ($department_id == 2) {
                $get_manager_info_query = "SELECT * FROM management WHERE emp_id = ?";
                $stmt_get_manager_info = mysqli_prepare($con, $get_manager_info_query);
                mysqli_stmt_bind_param($stmt_get_manager_info, "s", $emp_id);
                mysqli_stmt_execute($stmt_get_manager_info);
                $manager_info_result = mysqli_stmt_get_result($stmt_get_manager_info);

                if ($manager_info_row = mysqli_fetch_assoc($manager_info_result)) {
                    $manager_info = $manager_info_row;
                }
            }

            // Update the manager_id for the employee being deleted
            $update_employee_query = "UPDATE employee SET manager_id = NULL WHERE emp_id = ?";
            $stmt_update_employee = mysqli_prepare($con, $update_employee_query);
            mysqli_stmt_bind_param($stmt_update_employee, "s", $emp_id);

            mysqli_begin_transaction($con);

            if (mysqli_stmt_execute($stmt_update_employee)) {
                mysqli_commit($con);

                // Delete the employee from the employee table
                $delete_employee_query = "DELETE FROM employee WHERE emp_id = ?";
                $stmt_delete_employee = mysqli_prepare($con, $delete_employee_query);
                mysqli_stmt_bind_param($stmt_delete_employee, "s", $emp_id);

                mysqli_begin_transaction($con);

                if (mysqli_stmt_execute($stmt_delete_employee)) {
                    mysqli_commit($con);

                    // Delete the employee's emergency contact
                    $delete_emergency_query = "DELETE FROM emergencycontact WHERE emergency_contact_id = ?";
                    $stmt_delete_emergency = mysqli_prepare($con, $delete_emergency_query);
                    mysqli_stmt_bind_param($stmt_delete_emergency, "s", $emergency_contact_id);

                    mysqli_begin_transaction($con);

                    if (mysqli_stmt_execute($stmt_delete_emergency)) {
                        mysqli_commit($con);

                        // Log the deletion in the terminations log
                        $deletion_date = date('Y-m-d');
                        $deletion_time = date('H:i:s');
                        $log_termination_query = "INSERT INTO terminations_log (emp_id, termination_date, termination_time, deleting_employee_id)
                                                  VALUES (?, '$deletion_date', '$deletion_time', '$deleting_employee_id')";
                        $stmt_log_termination = mysqli_prepare($con, $log_termination_query);
                        mysqli_stmt_bind_param($stmt_log_termination, "s", $emp_id);

                        mysqli_begin_transaction($con);

                        if (mysqli_stmt_execute($stmt_log_termination)) {
                            mysqli_commit($con);
                            echo "Employee, associated data, and termination logged successfully!";
                        } else {
                            mysqli_rollback($con);
                            error_log("Error: " . $log_termination_query . "\n" . mysqli_error($con), 0);
                            echo "An error occurred while logging the termination. Please try again later.";
                        }
                    } else {
                        mysqli_rollback($con);
                        error_log("Error: " . $delete_emergency_query . "\n" . mysqli_error($con), 0);
                        echo "An error occurred while deleting the emergency contact. Please try again later.";
                    }
                } else {
                    mysqli_rollback($con);
                    error_log("Error: " . $delete_employee_query . "\n" . mysqli_error($con), 0);
                    echo "An error occurred while deleting the employee. Please try again later.";
                }

            } else {
                mysqli_rollback($con);
                error_log("Error: " . $update_employee_query . "\n" . mysqli_error($con), 0);
                echo "An error occurred while updating employee records. Please try again later.";
            }

            // If employee is manager delete the stored manager info
            // 2 is manager department id
            if ($department_id == 2 && $manager_info) {
                $delete_stored_manager_query = "DELETE FROM management WHERE emp_id = ?";
                $stmt_delete_stored_manager = mysqli_prepare($con, $delete_stored_manager_query);
                mysqli_stmt_bind_param($stmt_delete_stored_manager, "s", $manager_info['emp_id']);
                mysqli_stmt_execute($stmt_delete_stored_manager);
            }
        } else {
            echo "Error retrieving employee information.";
        }
    }
}
mysqli_close($con);
?>
