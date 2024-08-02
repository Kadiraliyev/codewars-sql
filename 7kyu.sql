-- ❓ Return the number (count) of vowels in the given string.
-- We will consider a, e, i, o, u as vowels for this Kata (but not y).
-- The input string will only consist of lower case letters and/or spaces.
-- ✅ Solution:
SELECT
  str,
  LENGTH (str) - LENGTH (
    REPLACE (
      REPLACE (
        REPLACE (
          REPLACE (REPLACE (str, 'a', ''), 'e', ''),
          'i',
          ''
        ),
        'o',
        ''
      ),
      'u',
      ''
    )
  ) AS res
FROM
  getcount;

-- ❓ For this challenge you need to create a simple SELECT statement that will return all columns from the products table, and join to the companies table so that you can return the company name.
-- products table schema
-- id
-- name
-- isbn
-- company_id
-- price
-- companies table schema
-- id
-- name
-- You should return all product fields as well as the company name as "company_name".
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- ✅ Solution:
SELECT
  products.*,
  companies.name AS company_name
FROM
  products
  JOIN companies ON products.company_id = companies.id;

-- ❓ For this challenge you need to create a SELECT statement, this SELECT statement will use an IN to check whether a department has had a sale with a price over 90.00 dollars BUT the sql MUST use the WITH statement which will be used to select all columns from sales where the price is greater than 90.00, you must call this sub-query special_sales.
-- departments table schema
-- id
-- name
-- sales table schema
-- id
-- department_id (department foreign key)
-- name
-- price
-- card_name
-- card_number
-- transaction_date
-- resultant table schema
-- id
-- name
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- ✅ Solution:
WITH
  special_sales AS (
    SELECT
      *
    FROM
      sales
    WHERE
      price > 90
  )
SELECT
  *
FROM
  departments
WHERE
  id IN (
    SELECT
      department_id
    FROM
      special_sales
  );

--  ❓ You have access to a table of monsters as follows:
-- monsters schema
-- id
-- name
-- legs
-- arms
-- characteristics
-- The monsters in the provided table have too many characteristics, they really only need one each. Your job is to trim the characteristics down so that each monster only has one. If there is only one already, provide that. If there are multiple, provide only the first one (don't leave any commas in there).
-- You must return a table with the format as follows:
-- output schema
-- id
-- name
-- characteristic
-- Order by id
-- ✅ Solution:
SELECT
  id,
  name,
  split_part (characteristics, ',', 1) as characteristic
FROM
  monsters
ORDER BY
  id


-- ❓ Given a demographics table in the following format:

-- ** demographics table schema **

-- id
-- name
-- birthday
-- race
-- you need to return the same table where all text fields (name & race) are changed to the bit length of the string.

-- ✅ Solution:

SELECT 
    id,
    -- Convert the name field to its bit length
    LENGTH(name) * 8 AS name,
    -- Convert the race field to its bit length
    LENGTH(race) * 8 AS race,
    birthday
FROM 
    demographics;
