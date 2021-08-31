# -----------------------------------------

use test;

DROP VIEW IF EXISTS empDetails;

CREATE VIEW empDetails AS
SELECT 
    empno, ename, job, deptno, count(job) as total 
FROM
    emp
GROUP by job
ORDER BY ename;

select * from empDetails;

# -----------------------------------------

DROP VIEW IF EXISTS empDept;

CREATE or REPLACE VIEW empDept AS
  select emp.empno, emp.ename, dept.dname, emp.job
  from emp
  inner join dept
  on emp.deptno=dept.deptno
  ORDER BY ename;

select * from empDept;

-- Show Create View empDept;

Alter view empDept
As
  select emp.empno, emp.ename, dept.dname
  from emp
  inner join dept
  on emp.deptno=dept.deptno;

select * from empDept;


DROP VIEW IF EXISTS empDetails;

CREATE VIEW empDetails AS
SELECT 
    empno, ename, job, deptno 
FROM
    emp;

select * from empDetails;

desc information_schema.views;

select * from information_schema.views where
TABLE_SCHEMA = 'test';

