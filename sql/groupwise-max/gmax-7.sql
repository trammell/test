-- $Id$
-- $Source$

-- If you don't want to use sub-queries and prefer pure JOINs perhaps there
-- are for you:

USE world;

SELECT c1.continent, c1.name, c1.population
FROM Country AS c1 LEFT JOIN Country AS c2
ON c1.population < c2.population AND c1.continent = c2.continent
WHERE c2.population is NULL;

-- the trick here is that we're doing a self-join of table Country against
-- itself, but it's a LEFT join, and part of the join condition is that the
-- "left" table have a population less than the "right" table.  Some
-- row in the left table will not be able to satisfy the condition, forcing
-- the values for the right table columns to NULL.  The following query
-- is identical to the first, but it includes the shows the "right" columns
-- in the output:

SELECT c1.continent, c1.name, c1.population, c2.continent, c2.name, c2.population
FROM Country AS c1 LEFT JOIN Country AS c2
ON c1.population < c2.population AND c1.continent = c2.continent
WHERE c2.population is NULL;

-- the 'where' clause is a bit of a red herring, the condition could be on
-- any of the c2 columns, not just c2.population.

