-- sqlite compatible

-- random days 2-7 days in the future
WITH RECURSIVE dates(date) AS (
  VALUES (CURRENT_DATE)
  UNION ALL
  SELECT  DATE(date, '+' ||CAST((ABS(RANDOM()) % (7 - 2) + 2) AS INTEGER)   || ' days')
  FROM dates
  LIMIT 100
)
SELECT date FROM dates;