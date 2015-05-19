-- $Id$
-- $Source$

USE world;

SELECT c1.Continent, c1.Name
FROM Country AS c1 JOIN Country AS c2
    ON c2.Continent = c1.Continent
    AND c1.Population <= c2.Population
GROUP BY c1.Continent, c1.Name
HAVING COUNT(*) = 1;

-- This query works similarly to #7, but uses a straight JOIN and
-- uses the join condition to order the countries by population. The
-- following query shows this in greater detail:

SELECT c1.Continent, c1.Name, count(*) as N, c1.Population
FROM Country AS c1 JOIN Country AS c2
    ON c2.Continent = c1.Continent
    AND c1.Population <= c2.Population
GROUP BY c1.Continent, c1.Name
ORDER BY c1.Continent, N;

