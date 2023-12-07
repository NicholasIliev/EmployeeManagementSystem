<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>Employee Birthday Display</title>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="index.php">Dashboard</a></li>
                <li><a href="add_employee.php">Add Employee</a></li>
                <li><a href="update_employee.php">Update Employee</a></li>
                <li><a href="delete_employee.php">Delete Employee</a></li>
                <li><a href="display_employees.php">Display Employees</a></li>
                <li><a href="#" class="active">Birthday Employees</a></li>
                <li><a href="terminations_log.php">Terminations Log</a></li>
            </ul>
        </div>

        <div class="content">
            <header>
                <h1>Month's Birthday Employees</h1>
                <p class="lead">Kilburnazon</p>
            </header>

            <section>
                <?php
                // Include database connection code
                include 'db_connect.php';

                // Get the current month
                $currentMonth = date('m');

                // Generate a unique table name based on the current timestamp
                $tableName = 'birthday_employees_' . time();

                // Generate SQL query to create a regular table for employees with birthdays in the current month
                $createTableQuery = "CREATE TABLE $tableName AS
                                    SELECT * FROM employee WHERE MONTH(dob) = $currentMonth
                                    ORDER BY DAY(dob)";


                // Execute the CREATE TABLE query
                if (mysqli_query($con, $createTableQuery)) {
                    echo "<p align='center'>Table '$tableName' created successfully.</p>";

                    // Generate SQL query to retrieve employees with birthdays in the current month
                    $selectQuery = "SELECT * FROM $tableName";

                    $result = mysqli_query($con, $selectQuery);

                    // Check if there are any results
                    if (mysqli_num_rows($result) > 0) {
                        echo '<div style="text-align: center;">';
                        echo '</div>';
                        
                        echo "<table border='1' align='center' width='80%'>
                                <tr>
                                    <th>Employee ID</th>
                                    <th>Name</th>
                                    <th>Date of Birth</th>
                                </tr>";

                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>
                                    <td>{$row['emp_id']}</td>
                                    <td>{$row['name']}</td>
                                    <td>{$row['dob']}</td>
                                </tr>";
                        }

                        echo "</table>";

                        echo "</table>";
                    } else {
                        echo "No results found.";
                    }

                    // Drop the temporary table after use
                    $dropTableQuery = "DROP TABLE IF EXISTS $tableName";
                    mysqli_query($con, $dropTableQuery);
                } else {
                    echo "Error creating table: " . mysqli_error($con);
                }

                // Close the database connection
                mysqli_close($con);
                ?>
            </section>
        </div>
    </div>
</body>
</html>
