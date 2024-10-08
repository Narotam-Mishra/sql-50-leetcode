
-- Problem link : https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50

-- Create the World table
CREATE TABLE World (
    name VARCHAR(255) PRIMARY KEY,
    continent VARCHAR(255),
    area INT,
    population INT,
    gdp BIGINT
);

-- Insert data into the World table
INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);

SELECT * FROM World;

-- main query
-- Approach - 1
SELECT name, population, area 
FROM World 
WHERE area >= 3000000 OR population >= 25000000;


-- Approach - 2
SELECT name, population, area 
FROM World 
WHERE area >= 3000000
UNION
SELECT name, population, area 
FROM World 
WHERE population >= 25000000;
