
--create tables
CREATE TABLE employees (
    id integer primary key autoincrement,
    name varchar
);



CREATE TABLE sales (
    id integer PRIMARY KEY AUTOINCREMENT,
    employee_id int,
    price int,
     FOREIGN KEY (employee_id)  REFERENCES employees (id)
);


--insert test data

INSERT INTO employees (name) VALUES ('John Doe');
INSERT INTO employees (name) VALUES ('Alan Wake');
INSERT INTO employees (name) VALUES ('John Wick');
INSERT INTO employees (name) VALUES ('John Connor');
INSERT INTO employees (name) VALUES ('John Rambo');
INSERT INTO employees (name) VALUES ('John McClane');
INSERT INTO employees (name) VALUES ('Bob Marley');
INSERT INTO employees (name) VALUES ('Bob Dylan');

INSERT INTO sales (employee_id, price) VALUES (1, 100);
INSERT INTO sales (employee_id, price) VALUES (1, 200);

INSERT INTO sales (employee_id, price) VALUES (2, 300);


INSERT INTO sales (employee_id, price) VALUES (3, 200);

INSERT INTO sales (employee_id, price) VALUES (4, 400);

INSERT INTO sales (employee_id, price) VALUES (5, 500);

INSERT INTO sales (employee_id, price) VALUES (6, 600);

INSERT INTO sales (employee_id, price) VALUES (7, 700);
INSERT INTO sales (employee_id, price) VALUES (7, 700);

INSERT INTO sales (employee_id, price) VALUES (8, 800);

--rate effeciency of employees
SELECT e.id, e.name, COUNT(s.id) AS sales_c, DENSE_RANK() OVER (ORDER BY COUNT(s.id) DESC) AS sales_rank_c, SUM(s.price) AS sales_s, DENSE_RANK() OVER (ORDER BY SUM(s.price) DESC) AS sales_rank_s 
FROM employees e 
JOIN sales s ON e.id = s.employee_id 
GROUP BY e.id, e.name 
ORDER BY sales_rank_c, sales_rank_s


