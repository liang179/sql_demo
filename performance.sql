-- Active: 1726061067748@@127.0.0.1@3306@demo
select * from performance_schema.setup_instruments;

select * from performance_schema.setup_instruments where NAME LIKE '%long%';
update performance_schema.setup_instruments set enabled='YES', TIMED='YES' where name like '%wait%';


UPDATE performance_schema.setup_instruments
SET ENABLED = 'YES', TIMED = 'YES'
WHERE NAME LIKE 'wait/%';

UPDATE performance_schema.setup_consumers
SET ENABLED = 'YES'
WHERE NAME LIKE 'events_waits%';
SELECT * from performance_schema.events_waits_current;

SELECT * from performance_schema.events_waits_history;

SELECT * from performance_schema.events_waits_history_long;

select * from performance_schema.processlist;

show full processlist;

kill 17;

SELECT * FROM performance_schema.threads;

-- 最多执行情况
SELECT * FROM performance_schema.events_statements_summary_by_digest ORDER BY COUNT_STAR DESC;

SELECT * FROM performance_schema.events_statements_summary_by_digest where query_sample_text like '%a4191f11-650a-11ef-bc26-0242ac120002%';

SELECT * from performance_schema.events_statements_history;

show variables like 'performance_schema_events_statements_history%';

SELECT * FROM performance_schema.events_statements_current;

SELECT * FROM performance_schema.events_transactions_current;

use performance_schema;
show tables;