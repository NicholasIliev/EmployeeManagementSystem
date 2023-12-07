<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>Employee Display</title>
</head>
<body>
    <div class="container">
    <div class="sidebar">
        <h3>Kilburnazon</h3>
        <ul>
            <li><a href="index.php">Dashboard</a></li>
            <li><a href="add_employee.php">Add Employee</a></li>
            <li><a href="update_employee.php">Update Employee</a></li>
            <li><a href="delete_employee.php">Delete Employee</a></li>
            <li><a href="#" class="active">Display Employees</a></li>
            <li><a href="birthday_employees.php">Birthday Employees</a></li>
            <li><a href="terminations_log.php">Terminations Log</a></li>
        </ul>
    </div>

        <div class="content">
            <header>
                <h1>Employee Display</h1>
            </header>

            <section>
                <form action="display_employees.php" method="post" class="employee-form">
                    <div class="form-group">
                        <label for="department">Select Department:</label>
                        <select name="department" required>
                            <option value="1">HR</option>
                            <option value="2">Management</option>
                            <option value="3">Packagers</option>
                            <option value="4">Drivers</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="emergency_relationship">Emergency Relationship:</label>
                        <input type="text" name="emergency_relationship" required>
                    </div>

                    <button type="submit" class="submit-btn">Display Employees</button>
                </form>
            </section>
        </div>
    </div>
</body>
</html>

<?php
// Include database connection code
include 'db_connect.php';

// Retrieve and sanitize form data
$department = mysqli_real_escape_string($con, $_POST['department']);
$emergency_relationship = mysqli_real_escape_string($con, $_POST['emergency_relationship']);

// Query to retrieve employees based on department and emergency relationship
$query = "SELECT e.name AS employee_name, d.name AS department_name, e.manager_id,
                ec.name AS emergency_contact_name, ec.relationship AS emergency_contact_relationship
          FROM employee e
          JOIN department d ON e.department_id = d.department_id
          JOIN emergencycontact ec ON e.emergency_contact_id = ec.emergency_contact_id
          WHERE d.name = '$department' AND ec.relationship = '$emergency_relationship'";

$result = mysqli_query($con, $query);

// Check if there are any results
if (mysqli_num_rows($result) > 0) {
    echo "<h2>Employees based on Department and Emergency Contact</h2>";
    echo "<table border='1'>
            <tr>
                <th>Employee Name</th>
                <th>Department</th>
                <th>Emergency Contact Name</th>
                <th>Emergency Contact Relationship</th>
                <th>Manager Name</th>
            </tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>
                <td>{$row['employee_name']}</td>
                <td>{$row['department_name']}</td>
                <td>{$row['emergency_contact_name']}</td>
                <td>{$row['emergency_contact_relationship']}</td>";

        // Get manager name
        $manager_id = $row['manager_id'];
        $manager_query = "SELECT name FROM employee WHERE emp_id = '$manager_id'";
        $manager_result = mysqli_query($con, $manager_query);

        if ($manager_row = mysqli_fetch_assoc($manager_result)) {
            echo "<td>{$manager_row['name']}</td>";
        } else {
            echo "<td>No Manager</td>";
        }

        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No results found.";
}

// Close the database connection
mysqli_close($con);
?>
