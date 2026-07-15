-- Query create table
CREATE TABLE test.dbo.Employees (
	Name varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Position] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	JoinDate date NULL,
	ReleaseDate date NULL,
	YearsOfExperience float NULL,
	Salary int NULL
);

-- Insert dummy data
INSERT INTO Employees (Name, Position, JoinDate, ReleaseDate, YearsOfExperience, Salary) VALUES
('Jacky', 'Solution Architect', '2018-07-25', '2022-07-25', 8, 150),
('John', 'Assistan Manager', '2016-02-02', '2021-02-02', 12, 155),
('Alano', 'Manager', '2010-11-09', NULL, 14, 175),
('Aaron', 'Engineer', '2021-08-16', '2022-08-16', 1, 80),
('Allen', 'Engineer', '2024-06-06', NULL, 4, 75),
('Peter', 'Team Leader', '2020-01-09', NULL, 3, 85);

-- 1. Insert Albert dengan posisi Enginner, join date 24 Januari 2024, dengan Year of experience 2.5 year. With salary $50.
INSERT INTO Employees (Name, Position, JoinDate, ReleaseDate, YearsOfExperience, Salary)
VALUES ('Albert', 'Engineer', '2024-01-24', NULL, 2.5, 50);

-- 2. Update table dengan posisi enginner with salaray $85
UPDATE Employees
SET Salary = 85
WHERE Position = 'Enginner';

-- 3. Hitung total pengeluaran salary saat tahun 2021.
SELECT
	SUM(e.Salary) AS TotalPengeluaran2021
--	e.Name,
--	e.Salary 
FROM test.dbo.Employees e
WHERE YEAR(e.JoinDate) <= 2021 
	AND (e.ReleaseDate IS NULL OR YEAR(e.ReleaseDate) >= 2021)
--GROUP BY e.Salary 
	
-- 4. Sorting menampilkan 3 employee paling banyak yang memiliki Years of Experience
SELECT TOP 3
	e.*
FROM test.dbo.Employees e 
ORDER BY e.YearsOfExperience DESC

-- 5. Subquery untuk employee dengan posisi engginer yang memiliki exeperience kurang dari sama dengan 3 tahun
SELECT 
	e.* 
FROM Employees e
WHERE e.Name IN (
    SELECT e.Name 
    FROM Employees 
    WHERE e.Position = 'Enginner' 
      AND e.YearsOfExperience <= 3.0
)