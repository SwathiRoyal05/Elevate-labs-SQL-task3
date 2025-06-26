mysql> CREATE TABLE Employees (
    ->     EmpID INTEGER PRIMARY KEY,
    ->     Name TEXT NOT NULL,
    ->     Department TEXT,
    ->     Salary INTEGER,
    ->     Email VARCHAR(255) UNIQUE,  -- ✅ Use VARCHAR instead of TEXT
    ->     JoiningDate DATE
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO Employees (EmpID, Name, Department, Salary, Email, JoiningDate) VALUES
    -> (1, 'Alice', 'HR', 50000, 'alice@company.com', '2023-01-10'),
    -> (2, 'Bob', 'IT', 70000, 'bob@company.com', '2022-11-23'),
    -> (3, 'Charlie', 'Finance', 60000, 'charlie@company.com', '2023-05-16'),
    -> (4, 'David', 'IT', 75000, 'david@company.com', '2021-09-01'),
    -> (5, 'Eva', 'HR', 48000, 'eva@company.com', '2023-02-28');
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> -- 1. Select all columns
mysql> SELECT * FROM Employees;
+-------+---------+------------+--------+---------------------+-------------+
| EmpID | Name    | Department | Salary | Email               | JoiningDate |
+-------+---------+------------+--------+---------------------+-------------+
|     1 | Alice   | HR         |  50000 | alice@company.com   | 2023-01-10  |
|     2 | Bob     | IT         |  70000 | bob@company.com     | 2022-11-23  |
|     3 | Charlie | Finance    |  60000 | charlie@company.com | 2023-05-16  |
|     4 | David   | IT         |  75000 | david@company.com   | 2021-09-01  |
|     5 | Eva     | HR         |  48000 | eva@company.com     | 2023-02-28  |
+-------+---------+------------+--------+---------------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> -- 2. Select specific columns
mysql> SELECT Name, Department FROM Employees;
+---------+------------+
| Name    | Department |
+---------+------------+
| Alice   | HR         |
| Bob     | IT         |
| Charlie | Finance    |
| David   | IT         |
| Eva     | HR         |
+---------+------------+
5 rows in set (0.00 sec)

mysql>
mysql> -- 3. Use WHERE to filter
mysql> SELECT * FROM Employees WHERE Department = 'IT';
+-------+-------+------------+--------+-------------------+-------------+
| EmpID | Name  | Department | Salary | Email             | JoiningDate |
+-------+-------+------------+--------+-------------------+-------------+
|     2 | Bob   | IT         |  70000 | bob@company.com   | 2022-11-23  |
|     4 | David | IT         |  75000 | david@company.com | 2021-09-01  |
+-------+-------+------------+--------+-------------------+-------------+
2 rows in set (0.00 sec)

mysql>
mysql> -- 4. Use AND / OR
mysql> SELECT * FROM Employees WHERE Department = 'IT' AND Salary > 70000;
+-------+-------+------------+--------+-------------------+-------------+
| EmpID | Name  | Department | Salary | Email             | JoiningDate |
+-------+-------+------------+--------+-------------------+-------------+
|     4 | David | IT         |  75000 | david@company.com | 2021-09-01  |
+-------+-------+------------+--------+-------------------+-------------+
1 row in set (0.00 sec)

mysql>
mysql> -- 5. LIKE for partial match
mysql> SELECT * FROM Employees WHERE Name LIKE '%a%';
+-------+---------+------------+--------+---------------------+-------------+
| EmpID | Name    | Department | Salary | Email               | JoiningDate |
+-------+---------+------------+--------+---------------------+-------------+
|     1 | Alice   | HR         |  50000 | alice@company.com   | 2023-01-10  |
|     3 | Charlie | Finance    |  60000 | charlie@company.com | 2023-05-16  |
|     4 | David   | IT         |  75000 | david@company.com   | 2021-09-01  |
|     5 | Eva     | HR         |  48000 | eva@company.com     | 2023-02-28  |
+-------+---------+------------+--------+---------------------+-------------+
4 rows in set (0.04 sec)

mysql>
mysql> -- 6. BETWEEN for range
mysql> SELECT * FROM Employees WHERE Salary BETWEEN 50000 AND 70000;
+-------+---------+------------+--------+---------------------+-------------+
| EmpID | Name    | Department | Salary | Email               | JoiningDate |
+-------+---------+------------+--------+---------------------+-------------+
|     1 | Alice   | HR         |  50000 | alice@company.com   | 2023-01-10  |
|     2 | Bob     | IT         |  70000 | bob@company.com     | 2022-11-23  |
|     3 | Charlie | Finance    |  60000 | charlie@company.com | 2023-05-16  |
+-------+---------+------------+--------+---------------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 7. ORDER BY ascending
mysql> SELECT * FROM Employees ORDER BY Salary;
+-------+---------+------------+--------+---------------------+-------------+
| EmpID | Name    | Department | Salary | Email               | JoiningDate |
+-------+---------+------------+--------+---------------------+-------------+
|     5 | Eva     | HR         |  48000 | eva@company.com     | 2023-02-28  |
|     1 | Alice   | HR         |  50000 | alice@company.com   | 2023-01-10  |
|     3 | Charlie | Finance    |  60000 | charlie@company.com | 2023-05-16  |
|     2 | Bob     | IT         |  70000 | bob@company.com     | 2022-11-23  |
|     4 | David   | IT         |  75000 | david@company.com   | 2021-09-01  |
+-------+---------+------------+--------+---------------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> -- 8. ORDER BY descending
mysql> SELECT * FROM Employees ORDER BY Salary DESC;
+-------+---------+------------+--------+---------------------+-------------+
| EmpID | Name    | Department | Salary | Email               | JoiningDate |
+-------+---------+------------+--------+---------------------+-------------+
|     4 | David   | IT         |  75000 | david@company.com   | 2021-09-01  |
|     2 | Bob     | IT         |  70000 | bob@company.com     | 2022-11-23  |
|     3 | Charlie | Finance    |  60000 | charlie@company.com | 2023-05-16  |
|     1 | Alice   | HR         |  50000 | alice@company.com   | 2023-01-10  |
|     5 | Eva     | HR         |  48000 | eva@company.com     | 2023-02-28  |
+-------+---------+------------+--------+---------------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> -- 9. LIMIT number of rows
mysql> SELECT * FROM Employees LIMIT 3;
+-------+---------+------------+--------+---------------------+-------------+
| EmpID | Name    | Department | Salary | Email               | JoiningDate |
+-------+---------+------------+--------+---------------------+-------------+
|     1 | Alice   | HR         |  50000 | alice@company.com   | 2023-01-10  |
|     2 | Bob     | IT         |  70000 | bob@company.com     | 2022-11-23  |
|     3 | Charlie | Finance    |  60000 | charlie@company.com | 2023-05-16  |
+-------+---------+------------+--------+---------------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 10. Aliasing
mysql> SELECT Name AS EmployeeName, Salary AS MonthlySalary FROM Employees;
+--------------+---------------+
| EmployeeName | MonthlySalary |
+--------------+---------------+
| Alice        |         50000 |
| Bob          |         70000 |
| Charlie      |         60000 |
| David        |         75000 |
| Eva          |         48000 |
+--------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> -- 11. DISTINCT
mysql> SELECT DISTINCT Department FROM Employees;
+------------+
| Department |
+------------+
| HR         |
| IT         |
| Finance    |
+------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 12. IN vs =
mysql> SELECT * FROM Employees WHERE Department IN ('HR', 'IT');
+-------+-------+------------+--------+-------------------+-------------+
| EmpID | Name  | Department | Salary | Email             | JoiningDate |
+-------+-------+------------+--------+-------------------+-------------+
|     1 | Alice | HR         |  50000 | alice@company.com | 2023-01-10  |
|     2 | Bob   | IT         |  70000 | bob@company.com   | 2022-11-23  |
|     4 | David | IT         |  75000 | david@company.com | 2021-09-01  |
|     5 | Eva   | HR         |  48000 | eva@company.com   | 2023-02-28  |
+-------+-------+------------+--------+-------------------+-------------+
4 rows in set (0.00 sec)

mysql> -- vs
mysql> SELECT * FROM Employees WHERE Department = 'HR'; -- Single value
+-------+-------+------------+--------+-------------------+-------------+
| EmpID | Name  | Department | Salary | Email             | JoiningDate |
+-------+-------+------------+--------+-------------------+-------------+
|     1 | Alice | HR         |  50000 | alice@company.com | 2023-01-10  |
|     5 | Eva   | HR         |  48000 | eva@company.com   | 2023-02-28  |
+-------+-------+------------+--------+-------------------+-------------+
2 rows in set (0.00 sec)