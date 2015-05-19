-- $Id$
-- $Source$

-- using correlated subquery to determine groupwise maximum:

USE world;

SELECT c.continent, c.name, c.population
FROM Country AS c
WHERE c.population = (
    SELECT MAX(population) AS maxpop
    FROM Country
    WHERE Country.continent = c.continent
);

-- To be read as: 'Get the countries which have the same population as the
-- maximum population of the current country'. Using such a sub-qeury
-- results in more readable sub-queries. BUT ... they a 'DEPENDENT' as the
-- inner query is refering to a field of the outer query. This means that
-- for each row of the outer query the inner query is executed.

-- see also:
--  http://dev.mysql.com/doc/refman/5.0/en/correlated-subqueries.html

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

-- NOTE: this query is noticeably slower!

