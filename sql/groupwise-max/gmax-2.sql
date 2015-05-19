-- $Id$
-- $Source$

USE world;

CREATE TEMPORARY TABLE tt
SELECT continent, MAX(population) AS maxpop
FROM Country
GROUP BY continent;

SELECT * FROM tt;

--  +---------------+------------+
--  | continent     | maxpop     |
--  +---------------+------------+
--  | Asia          | 1277558000 |
--  | Europe        |  146934000 |
--  | North America |  278357000 |
--  | Africa        |  111506000 |
--  | Oceania       |   18886000 |
--  | Antarctica    |          0 |
--  | South America |  170115000 |
--  +---------------+------------+

SELECT c.continent, c.name, c.population
FROM Country AS c, tt
WHERE c.continent = tt.continent
AND c.population = tt.maxpop;

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

