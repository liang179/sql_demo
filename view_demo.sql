-- Active: 1726061067748@@127.0.0.1@3306@employees
create or replace view V_test
as
SELECT
    SCHEMA_NAME,
    digest,
    digest_text,
    round(
        sum_timer_wait / 1000000000000,
        6
    ) as timer_wait,
    count_star
FROM performance_schema.events_statements_summary_by_digest
ORDER BY sum_timer_wait DESC
LIMIT 10;

SELECT * from `V_test`;