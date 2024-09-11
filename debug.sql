-- Active: 1726061067748@@127.0.0.1@3306@employees
select uuid();

select /*a4191f11-650a-11ef-bc26-0242ac120002*/
*
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

SELECT * FROM performance_schema.events_statements_summary_by_digest where query_sample_text like '%a4191f11-650a-11ef-bc26-0242ac120002%';

SELECT * from performance_schema.events_statements_history where `SQL_TEXT` like '%a4191f11-650a-11ef-bc26-0242ac120002%';