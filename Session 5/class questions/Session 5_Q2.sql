--Create Table Statement
CREATE TABLE Triangle (
    x INT,
    y INT,
    z INT,
    PRIMARY KEY (x, y, z)
);

--Insert Values
INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);


SELECT
    x,
    y,
    z,
    CASE
        WHEN (x + y > z) AND (x + z > y) AND (y + z > x) THEN 'Yes'
        ELSE 'No'
    END AS Triangle_formed
FROM
    Triangle;