<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/styles.css">
    <title>Employee Birthday Display</title>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h3>Kilburnazon</h3>
            <ul>
                <li><a href="../dashboard/dashboard.php">Dashboard</a></li>
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
                <h1>Month's Birthday Employees</h1>
                <p class="lead">Kilburnazon</p>
            </header>
            <section>
            <?php
            include '../../includes/db_connect.php';

            $currentMonth = date('m');

            // Get employees that have bday this month
            $selectQuery = "SELECT emp_id, name, dob FROM employee WHERE MONTH(dob) = $currentMonth
                            ORDER BY DAY(dob)";

            // Execute the query
            $result = mysqli_query($con, $selectQuery);
            // Check if there are results    
            if ($result && mysqli_num_rows($result) > 0) {
                // Display results in an HTML table
                echo '<div style="text-align: center;">';

                echo "<table border='1' align='center' style='width: 80%; margin-top: 20px; background-color: white;'>
                        <tr style='background-color: #2980b980;'>
                            <th style='padding: 8px;'>Employee ID</th>
                            <th style='padding: 8px;'>Name</th>
                            <th style='padding: 8px;'>Date of Birth</th>
                        </tr>";
                // Loop through the result set and output each row
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>
                            <td>{$row['emp_id']}</td>
                            <td>{$row['name']}</td>
                            <td>{$row['dob']}</td>
                        </tr>";
                }

                echo "</table>";

                echo '</div>';
            } else {
                echo "No results found.";
            }
            mysqli_close($con);
            ?>
            </section>
        </div>
    </div>
</body>
</html>
