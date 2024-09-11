create or replace view V_statements_digest
as
SELECT
    SCHEMA_NAME,
    digest,
    digest_text,
    QUERY_SAMPLE_TEXT,
    round(
        sum_timer_wait / 1000000000000,
        6
    ) as timer_wait,
    count_star
FROM performance_schema.events_statements_summary_by_digest
WHERE `SCHEMA_NAME`='employees';

SELECT * from `V_statements_digest`;

create or replace view V_statements_history
as
SELECT
  `THREAD_ID`,
  `EVENT_ID`,
  `END_EVENT_ID`,
  `EVENT_NAME`,
  `SOURCE`,
  `TIMER_START`,
  `TIMER_END`,
  `TIMER_WAIT`,
  round(TIMER_WAIT/1000000000000,6) as timer_wait_s,
  `LOCK_TIME`,
  `SQL_TEXT`,
  `DIGEST`,
  `DIGEST_TEXT`,
  `CURRENT_SCHEMA`,
  `OBJECT_TYPE`,
  `OBJECT_SCHEMA`,
  `OBJECT_NAME`,
  `OBJECT_INSTANCE_BEGIN`,
  `MYSQL_ERRNO`,
  `RETURNED_SQLSTATE`,
  `MESSAGE_TEXT`,
  `ERRORS`,
  `WARNINGS`,
  `ROWS_AFFECTED`,
  `ROWS_SENT`,
  `ROWS_EXAMINED`,
  `CREATED_TMP_DISK_TABLES`,
  `CREATED_TMP_TABLES`,
  `SELECT_FULL_JOIN`,
  `SELECT_FULL_RANGE_JOIN`,
  `SELECT_RANGE`,
  `SELECT_RANGE_CHECK`,
  `SELECT_SCAN`,
  `SORT_MERGE_PASSES`,
  `SORT_RANGE`,
  `SORT_ROWS`,
  `SORT_SCAN`,
  `NO_INDEX_USED`,
  `NO_GOOD_INDEX_USED`,
  `NESTING_EVENT_ID`,
  `NESTING_EVENT_TYPE`,
  `NESTING_EVENT_LEVEL`,
  `STATEMENT_ID`,
  `CPU_TIME`,
  `MAX_CONTROLLED_MEMORY`,
  `MAX_TOTAL_MEMORY`,
  `EXECUTION_ENGINE`
FROM performance_schema.events_statements_history
WHERE `CURRENT_SCHEMA`='employees';

SELECT * from `V_statements_history`;