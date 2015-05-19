-- $Id$
-- $Source$

USE world;

-- [A] way that doesn't work (yet).

SELECT co2.continent, MAX(co2.population) AS maxpop, (
    SELECT name
    FROM Country
    WHERE population = maxpop
    AND continent = co2.continent
)
FROM Country AS co2
GROUP BY co2.continent;

-- ERROR 1247 (42S22): Reference 'maxpop' not supported (reference to group function)

