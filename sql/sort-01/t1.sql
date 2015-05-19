# $Id: t1.sql,v 1.1 2005/08/08 18:48:06 johnt Exp $

# usage: mysql -t -v < t1.sql

USE test;

DROP TABLE IF EXISTS t1;
CREATE TEMPORARY TABLE t1 ( c1 int );

# insert 5 rows into the database

INSERT INTO t1 VALUES (4),(4),(5),(5),(NULL),(NULL);

SELECT * FROM t1;

SELECT * FROM t1 ORDER BY c1 ASC;
SELECT * FROM t1 ORDER BY c1 DESC;

SELECT * FROM t1 WHERE c1 IS NOT NULL ORDER BY c1 ASC;



