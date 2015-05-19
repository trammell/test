-- $Id$
-- $Source$

USE world;

-- And as the last one the modified max-concat example from the manual.

SELECT
    continent,
    SUBSTRING( MAX( CONCAT(LPAD(population,10,'0'),name) ), 10+1) AS name,
    MAX( population ) AS population
FROM Country
GROUP BY continent;

-- The result is slightly different but it is more about the idea.

--  +---------------+----------------------------------------------+------------+
--  | continent     | name                                         | population |
--  +---------------+----------------------------------------------+------------+
--  | Asia          | China                                        | 1277558000 |
--  | Europe        | Russian Federation                           | 146934000  |
--  | North America | United States                                | 278357000  |
--  | Africa        | Nigeria                                      | 111506000  |
--  | Oceania       | Australia                                    | 18886000   |
--  | Antarctica    | South Georgia and the South Sandwich Islands | 0          |
--  | South America | Brazil                                       | 170115000  |
--  +---------------+----------------------------------------------+------------+

-- NOTE that the 'population' column doesn't include the duplicate/tied
-- Antarctica values as the previous queries did.

