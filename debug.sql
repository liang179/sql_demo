-- Active: 1726061067748@@127.0.0.1@3306@employees
select uuid();

select /*a29be562-727a-11ef-91a5-0242ac120002-3*/
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

SELECT * FROM performance_schema.events_statements_summary_by_digest where query_sample_text like '%a29be562-727a-11ef-91a5-0242ac120002%';

SELECT * from performance_schema.events_statements_history where `SQL_TEXT` like '%a29be562-727a-11ef-91a5-0242ac120002%';

UPDATE performance_schema.setup_consumers SET enabled = 'YES' WHERE name = 'events_statements_history_long'; 
SELECT * from performance_schema.events_statements_history_long where `SQL_TEXT` like '%a29be562-727a-11ef-91a5-0242ac120002%';

SELECT * FROM `V_statements_history` where `SQL_TEXT` like '%a29be562-727a-11ef-91a5-0242ac120002%';