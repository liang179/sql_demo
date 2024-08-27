-- Active: 1724584727501@@127.0.0.1@3306@employees
select version();

select database();

SELECT COUNT(1) FROM employees;

SELECT * FROM employees;

SELECT * FROM employees WHERE emp_no = '10111';

SELECT * FROM employees WHERE first_name = 'Hugo' and last_name = 'Rosis';

show create table employees;

show INDEX from employees;

SELECT gender, count(1) FROM employees GROUP BY gender;

EXPLAIN SELECT gender, count(1) FROM employees GROUP BY gender;

SELECT * from titles;

select *
from employees t1
    JOIN titles t2
WHERE
    t1.emp_no = t2.emp_no;

select ROW_NUMBER() OVER (
        PARTITION BY
            t1.emp_no
        ORDER BY t2.to_date DESC
    ) as title_no, t1.*, t2.*
from employees t1
    JOIN titles t2
WHERE
    t1.emp_no = t2.emp_no;

select *
from (
        select ROW_NUMBER() OVER (
                PARTITION BY
                    t1.emp_no
                ORDER BY t2.to_date DESC
            ) as title_no, t1.*, t2.title, t2.from_date, t2.to_date
        from employees t1
            JOIN titles t2
        WHERE
            t1.emp_no = t2.emp_no
    ) t3
where
    t3.title_no = 1;

select emp_no, count(1) as num
from (
        select t1.emp_no as emp_no, t2.title as title
        from employees t1
            JOIN titles t2
        WHERE
            t1.emp_no = t2.emp_no
    ) t3
GROUP BY
    emp_no
ORDER BY num desc;

SELECT * from salaries;

select emp_no, max(salary) from salaries GROUP BY emp_no;