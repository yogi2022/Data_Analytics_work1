# -----------------------------------------

use test;

DROP TABLE IF EXISTS emp_audit;

CREATE TABLE emp_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empno INT NOT NULL,
    ename VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DROP TRIGGER IF EXISTS before_emp_update;

DELIMITER $$
CREATE TRIGGER before_emp_update 
    BEFORE UPDATE ON emp
    FOR EACH ROW 
BEGIN
    INSERT INTO emp_audit
    SET action = 'Before update',
      empno = OLD.empno,
      ename = OLD.ename,
      changedat = NOW(); 
END$$
DELIMITER ;

update emp set sal = '5000' where empno = 7876;
update emp set job = 'analyst', deptno = 30 where empno = 7876;

select * from emp_audit;

# -----------------------------------------

DROP TRIGGER IF EXISTS after_insert_emp;

DELIMITER $$
CREATE TRIGGER after_insert_emp 
    AFTER INSERT ON emp
    FOR EACH ROW 
BEGIN
    INSERT INTO emp_audit
    SET action = 'After insert',
      empno = NEW.empno,
      ename = NEW.ename,
      changedat = NOW(); 
END$$
DELIMITER ;

insert into emp values (9999,'David','Manager',7902,'93/6/13',800,0.00,20);
insert into emp values (8888,'David','Manager',7902,'93/6/13',800,0.00,20);

select * from emp_audit;

# -----------------------------------------

DROP TRIGGER IF EXISTS after_delete_emp;

DELIMITER $$
CREATE TRIGGER after_delete_emp 
    AFTER DELETE ON emp
    FOR EACH ROW 
BEGIN
    INSERT INTO emp_audit
    SET action = 'After delete',
      empno = OLD.empno,
      ename = OLD.ename,
      changedat = NOW(); 
END$$
DELIMITER ;

delete from emp where empno = 9999;
delete from emp where empno = 8888;

select * from emp_audit;

