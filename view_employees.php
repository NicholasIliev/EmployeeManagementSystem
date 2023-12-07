<?php
require_once 'db_connect.php';

// Assuming you have a table named 'employees'
$sql = "SELECT * FROM employees";
$result = mysqli_query($con, $sql);

if (!$result) {
    die("Error retrieving data: " . mysqli_error($con));
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles.css">
    <title>View Employees</title>
</head>
<body>
    <h1>View Employees</h1>

    <!-- Display employee data here -->
    <table>
        <thead>
            <tr>
                <th>Emp ID</th>
                <!-- Add other table headers for employee details -->
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['emp_id'] . "</td>";
                // Add other table cells for employee details
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>

</body>
</html>

<?php
// Close the result set and the database connection
mysqli_free_result($result);
mysqli_close($con);
?>
