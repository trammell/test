-- $Id$
-- $Source$

USE world;

SELECT MAX(population) AS maxpop, continent
FROM Country
GROUP BY continent;

--    +------------+---------------+
--    | maxpop     | continent     |
--    +------------+---------------+
--    | 1277558000 | Asia          |
--    |  146934000 | Europe        |
--    |  278357000 | North America |
--    |  111506000 | Africa        |
--    |   18886000 | Oceania       |
--    |          0 | Antarctica    |
--    |  170115000 | South America |
--    +------------+---------------+

SELECT code, name, continent, population from Country
WHERE population = 1277558000
AND continent = 'Asia';

