-- =========================================================
-- Data Processing - Employees (versi MySQL / phpMyAdmin)
-- =========================================================

-- Buat tabel Employees
CREATE TABLE Employees (
    Name VARCHAR(10) NULL,
    Position VARCHAR(50) NULL,
    JoinDate DATE NULL,
    ReleaseDate DATE NULL,
    YearsOfExperience FLOAT NULL,
    Salary INT NULL
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
WHERE Position = 'Engineer';

-- 3. Hitung total pengeluaran salary saat tahun 2021.
SELECT
    SUM(Salary) AS TotalPengeluaran2021
FROM Employees
WHERE YEAR(JoinDate) <= 2021
    AND (ReleaseDate IS NULL OR YEAR(ReleaseDate) >= 2021);

-- 4. Sorting menampilkan 3 employee paling banyak yang memiliki Years of Experience
SELECT *
FROM Employees
ORDER BY YearsOfExperience DESC
LIMIT 3;

-- 5. Subquery untuk employee dengan posisi engginer yang memiliki exeperience kurang dari sama dengan 3 tahun
SELECT *
FROM Employees
WHERE Name IN (
    SELECT Name
    FROM Employees
    WHERE Position = 'Engineer'
      AND YearsOfExperience <= 3.0
);