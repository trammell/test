-- $Id$
-- $Source$

USE world;

SELECT c.continent, c.name, c.population
FROM Country as c
WHERE c.population >= ALL (
    SELECT population
    FROM Country
    WHERE continent = c.continent
);

