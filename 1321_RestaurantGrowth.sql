
-- Problem link : https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

-- Create Customer table
CREATE TABLE Customer (
    customer_id INT,
    name VARCHAR(255),
    visited_on DATE,
    amount INT,
    PRIMARY KEY (customer_id, visited_on)
);

-- Insert values into Customer table
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(1, 'Jhon', '2019-01-10', 130),
(3, 'Jade', '2019-01-10', 150);

SELECT * FROM Customer;

-- main query 
-- Approach - 1
SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM Customer
        WHERE
            visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM Customer
            WHERE
                visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM Customer c
WHERE
    visited_on >= (
        SELECT DATE_ADD(
                MIN(visited_on), INTERVAL 6 DAY
            )
        FROM Customer
    )
GROUP BY
    visited_on
ORDER BY visited_on;


-- Approach - 2




