-- $Id$
-- $Source$

-- Instead of using a temporary table as internal steps we can write the same
-- also as simple sub-query which is creating a temporary table internally.

USE world;

SELECT c1.continent, c1.name, c1.population
FROM Country AS c1, (
    SELECT continent, MAX(population) AS maxpop
    FROM Country
    GROUP BY continent
) AS c2
WHERE c1.continent = c2.continent
AND c1.population = c2.maxpop;

--  +---------------+----------------------------------------------+------------+
--  | continent     | name                                         | population |
--  +---------------+----------------------------------------------+------------+
--  | Oceania       | Australia                                    |   18886000 |
--  | South America | Brazil                                       |  170115000 |
--  | Asia          | China                                        | 1277558000 |
--  | Africa        | Nigeria                                      |  111506000 |
--  | Europe        | Russian Federation                           |  146934000 |
--  | North America | United States                                |  278357000 |
--  | Antarctica    | Antarctica                                   |          0 |
--  | Antarctica    | Bouvet Island                                |          0 |
--  | Antarctica    | South Georgia and the South Sandwich Islands |          0 |
--  | Antarctica    | Heard Island and McDonald Islands            |          0 |
--  | Antarctica    | French Southern territories                  |          0 |
--  +---------------+----------------------------------------------+------------+

