-- G5_23BCS13761_Tanay Manish Nesari_session 2 --

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
  RETURN (
      SELECT DISTINCT(salary) from Employee order by salary DESC
      LIMIT 1 OFFSET N
      
  );

END
