-- $Id$
-- $Source$

USE world;

-- added 2005-05-28 as no. 11, sent in by rudy@r937.com

SELECT c1.continent, c1.name, c1.population
FROM Country AS c1 JOIN Country AS c2
    ON c1.continent = c2.continent
GROUP BY c1.continent, c1.name
HAVING c1.population = MAX(c2.population);

-- This query is similar to #8 in that it uses a straight JOIN, but this
-- one instead uses the HAVING clause to limit the result set to the
-- groupwise maximum.  Nice!

-- This query shows the result set before applying the HAVING clause:

SELECT c1.continent, c1.name, c1.population, MAX(c2.population)
FROM Country AS c1 JOIN Country AS c2
    ON c1.continent = c2.continent
GROUP BY c1.continent, c1.name;

-- NOTE: the original SELECT query was:
--    SELECT co1.continent, co1.name
-- which caused the HAVING clause to fail until I added the 'population'
-- column to the select.

