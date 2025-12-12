--Create Table Statement
CREATE TABLE UserProfile (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

-- Insert Values
INSERT INTO UserProfile (ID, Name, Age, Email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');

--SQL UPDATE Query to identify and flag the record with the highest ID for duplicate emails
UPDATE UserProfile
SET Email = 'duplicate email'
WHERE ID IN (
    SELECT MAX(T1.ID)
    FROM UserProfile T1
    WHERE T1.Email IN (
        SELECT Email
        FROM UserProfile
        GROUP BY Email
        HAVING COUNT(Email) > 1
    )
    GROUP BY T1.Email
);

SELECT * FROM UserProfile;