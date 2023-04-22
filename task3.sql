

--ms sql compatible 

CREATE TABLE transfers (
    id int primary key identity(1,1),
    from_acc int,
    to_acc int,
    amount int,
    tdate date
);

--insert test data

INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (1, 2, 500, '2023-02-23');
INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (2, 3, 300, '2023-03-01');
INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (3, 1, 200, '2023-03-05');
INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (1, 3, 400, '2023-04-05');



WITH cte_balances AS (
  SELECT
    from_acc AS acc,
    tdate,
    -amount AS balance
  FROM transfers
  UNION ALL
  SELECT
    to_acc AS acc,
    tdate,
    amount AS balance
  FROM transfers
),
cte_periods AS (
  SELECT
    acc,
    tdate AS dt_from,
    LEAD(tdate, 1, '3000-01-01') OVER (PARTITION BY acc ORDER BY tdate) AS dt_to,
    SUM(balance) OVER (PARTITION BY acc ORDER BY tdate) AS balance
  FROM cte_balances
)
SELECT
  acc,
  dt_from,
  dt_to,
  balance
FROM cte_periods
WHERE balance IS NOT NULL
ORDER BY acc, dt_from;





--sqlite compatible


CREATE TABLE transfers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    from_acc INTEGER,
    to_acc INTEGER,
    amount INTEGER,
    tdate DATE
);

--insert test data

INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (1, 2, 500, '2023-02-23');
INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (2, 3, 300, '2023-03-01');
INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (3, 1, 200, '2023-03-05');
INSERT INTO transfers (from_acc, to_acc, amount, tdate) VALUES (1, 3, 400, '2023-04-05');

WITH cte_balances AS (
  SELECT
    from_acc AS acc,
    tdate,
    -amount AS balance
  FROM transfers
  UNION ALL
  SELECT
    to_acc AS acc,
    tdate,
    amount AS balance
  FROM transfers
),
cte_periods AS (
  SELECT
    acc,
    tdate AS dt_from,
    LEAD(tdate, 1, '3000-01-01') OVER (PARTITION BY acc ORDER BY tdate) AS dt_to,
    SUM(balance) OVER (PARTITION BY acc ORDER BY tdate) AS balance
  FROM cte_balances
)
SELECT
  acc,
  dt_from,
  dt_to,
  balance
FROM cte_periods
WHERE balance IS NOT NULL
ORDER BY acc, dt_from;



