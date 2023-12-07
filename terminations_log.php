<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>Terminations Log</title>
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
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="birthday_employees.php">Birthday Employees</a></li>
                <li><a href="terminations_log.php" class="active">Terminations Log</a></li>
            </ul>
        </div>

        <div class="content">
            <header>
                <h1>Terminations Log</h1>
                <p class="lead">Kilburnazon</p>
            </header>

            <section>
                <?php
                // Include database connection code
                include 'db_connect.php';

                // Query to retrieve termination records
                $query = "SELECT * FROM terminations_log";

                $result = mysqli_query($con, $query);

                // Check if there are any results
                if (mysqli_num_rows($result) > 0) {
                    echo '<div style="text-align: center;">';
                    echo '</div>';
                    echo "<table border='1' align='center' style='width: 80%; margin-top: 20px; background-color: white;'>
                            <tr style='background-color: #2980b980;'>
                                <th style='padding: 8px;'>Employee ID Left</th>
                                <th style='padding: 8px;'>Termination Date</th>
                                <th style='padding: 8px;'>Termination Time</th>
                                <th style='padding: 8px;'>Deleting Employee ID</th>
                            </tr>";

                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>
                                <td>{$row['emp_id']}</td>
                                <td>{$row['termination_date']}</td>
                                <td>{$row['termination_time']}</td>
                                <td>{$row['deleting_employee_id']}</td>
                            </tr>";
                    }

                    echo "</table>";
                } else {
                    echo "No termination records found.";
                }

                // Close the database connection
                mysqli_close($con);
                ?>
            </section>
        </div>
    </div>
</body>
</html>

