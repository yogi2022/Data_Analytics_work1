
START TRANSACTION;

SAVEPOINT tran0;

select count(*) from emp;

insert into emp values (8143,'Ravi','Manager',7839,'93/6/13',800,0.00,20);

SELECT * FROM emp;

SAVEPOINT tran1;

insert into emp values (8343,'Teja','Manager',7839,'93/6/13',800,0.00,20);

update emp set job ='clerk 2' where job = 'clerk';

SELECT * FROM emp;

SAVEPOINT tran2;

delete from emp where deptno = 10;

SELECT  count(*) FROM    emp;

ROLLBACK TO tran2;

SELECT  count(*) FROM    emp;

ROLLBACK TO tran1;

SELECT  count(*) FROM    emp;

ROLLBACK TO tran0;

SELECT  count(*) FROM    emp;

/* Update line 26 with Commit */