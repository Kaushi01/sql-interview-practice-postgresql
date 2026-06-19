# SQL Practice — Employees & Departments

A structured SQL practice file covering fundamental to advanced SQL concepts using two tables: `employees` and `departments`.

---

## Database Schema

### `employees`
| Column | Type | Description |
|---|---|---|
| `emp_id` | INT (PK) | Unique employee identifier |
| `name` | VARCHAR(50) | Employee name |
| `department` | VARCHAR(30) | Department name |
| `salary` | INT | Annual salary |

### `departments`
| Column | Type | Description |
|---|---|---|
| `dept_id` | INT (PK) | Unique department identifier |
| `department` | VARCHAR(50) | Department name |
| `manager` | VARCHAR(50) | Manager name |

### Sample Data

**Employees**
| emp_id | name | department | salary |
|---|---|---|---|
| 1 | Alice | HR | 45,000 |
| 2 | Bob | IT | 60,000 |
| 3 | Charlie | Finance | 55,000 |
| 4 | David | IT | 70,000 |
| 5 | Eva | HR | 50,000 |

**Departments**
| dept_id | department | manager |
|---|---|---|
| 101 | HR | Sophia |
| 102 | IT | James |
| 103 | Finance | Olivia |
| 104 | Marketing | Liam |
| 106 | Sales | Emma |

---

## Topics Covered

### Level 1 — Basics
- `SELECT` with specific columns
- `WHERE` clause filtering (comparison, range, NULL checks)
- `LIKE` for pattern matching
- `DISTINCT` values
- `ORDER BY` (ascending & descending, multi-column)
- `LIMIT` for row restriction
- Aggregate functions: `COUNT`, `MAX`, `MIN`, `AVG`, `SUM`

### Level 2 — Grouping & String Functions
- `GROUP BY` with aggregate functions (count, avg, max, min, sum per department)
- `HAVING` clause for post-aggregation filtering
- String functions: `UPPER`, `LOWER`, `LENGTH`, `LEFT`, `REPLACE`, `||` concatenation
- Math expressions: annual salary, bonus calculation, `ROUND`
- Date functions: `CURRENT_DATE`, `CURRENT_TIME`
- Subqueries for min/max salary lookups
- Window function `DENSE_RANK()` for Nth highest salary

### Level 3 — Joins
- `INNER JOIN` — matching rows across tables
- `LEFT JOIN` — all employees, matched departments
- `RIGHT JOIN` — all departments, matched employees
- `FULL OUTER JOIN` — all rows from both tables
- Self-join — finding employees in the same department
- Filtering unmatched rows (employees without departments, departments without employees)
- Aggregations after joins (count per manager, highest salary per manager)

### Level 4 — Advanced
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` window functions
- `PARTITION BY` for department-wise ranking
- `CASE` expressions for salary classification (Low / Medium / High)
- CTEs (`WITH` clause) for readable subqueries
- Subqueries for above-average salary, min/max earners
- Finding duplicate salaries
- Cumulative and running totals using `SUM() OVER()`
- Percentage contribution per employee salary

---

## How to Run

1. Use any SQL-compatible database: **PostgreSQL**, **MySQL**, or **SQLite**
2. Run the `CREATE TABLE` and `INSERT` statements first to set up the data
3. Execute individual queries to practice each concept

```sql
-- Quick start: set up both tables
CREATE TABLE employees ( ... );
INSERT INTO employees VALUES (...);

CREATE TABLE departments ( ... );
INSERT INTO departments VALUES (...);
```

---

## Known Issues / Doubts

The file includes a few queries marked with `--doubt` comments that contain logic errors or syntax not supported in standard SQL:

| Query | Issue |
|---|---|
| Department with highest avg salary | Uses invalid `IS (subquery)` syntax |
| `SELECT CURRENT_DATE` | Works in PostgreSQL; use `SELECT DATE('now')` in SQLite |
| Department-wise highest-paid employee | Grouped by name+salary — does not return one row per department |
| Cumulative / running total | Partitioned by emp_id — returns per-employee total, not a true running total |

---

## Skills Practiced

- Filtering and sorting data
- Aggregating and grouping records
- Combining tables with joins
- Writing subqueries and CTEs
- Using window functions for ranking and running calculations
- String and date manipulation

---

## Author Notes

This file is intended for SQL beginners to intermediate learners building confidence with real query writing. Levels progress from simple SELECT statements to complex window functions and multi-table joins.
