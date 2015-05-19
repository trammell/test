-- $Id$
-- $Source$

-- The same query can be written in two other ways:

USE world;

SELECT continent, name, population
FROM Country
WHERE ROW(population, continent) IN (
    SELECT MAX(population), continent
    FROM Country
    GROUP BY continent
);

