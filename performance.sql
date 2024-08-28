-- Active: 1724584727501@@127.0.0.1@3306
select * from performance_schema.setup_instruments;

select * from performance_schema.setup_instruments where NAME LIKE 'wait%';
update performance_schema.setup_instruments set enabled='YES', TIMED='YES' where name like 'wait%';

SELECT * from performance_schema.events_waits_current;

SELECT * from performance_schema.events_waits_history;

SELECT * from performance_schema.events_waits_history_long;

select * from performance_schema.processlist;

-- 最多执行情况
SELECT * FROM performance_schema.events_statements_summary_by_digest ORDER BY COUNT_STAR DESC;

SELECT * FROM performance_schema.events_statements_summary_by_digest where query_sample_text like '%a4191f11-650a-11ef-bc26-0242ac120002%';

SELECT * from performance_schema.events_statements_history;

use performance_schema;
show tables;