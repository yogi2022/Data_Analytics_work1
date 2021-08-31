# -----------------------------------------

use test;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP function IF EXISTS getSalGrade;
DELIMITER $$
 
CREATE function getSalGrade(p_empNo int) returns varchar(10)
	DETERMINISTIC
BEGIN
    DECLARE empSal double;
    DECLARE empSalGrade varchar(10);
 
    SELECT sal INTO empSal
    FROM emp
    WHERE empno = p_empNo;
 
    IF empSal > 3000 THEN
      SET empSalGrade = 'HIGH';
    ELSEIF (empSal > 1000 && empSal <= 3000 ) THEN
      SET empSalGrade = 'MEDIUM';
    ELSEIF (empSal <= 1000) THEN
      SET empSalGrade = 'LOW';
    END IF;

    return empSalGrade; 
END$$

DELIMITER ;

select sal, getSalGrade(7839) from emp where empno = 7839;
select sal, getSalGrade(7369) from emp where empno = 7369;
select sal, getSalGrade(7698) from emp where empno = 7698;

SHOW FUNCTION STATUS WHERE Db = 'test';

SHOW PROCEDURE STATUS WHERE Db = 'test';