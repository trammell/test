-- $Id: foo.pl,v 1.1 2005/07/18 17:08:50 johnt Exp $

USE test;

SELECT VERSION();

DROP TABLE IF EXISTS t1;
CREATE TEMPORARY TABLE t1( c1 CHAR(8) );

-- insert 10 rows into the database (6 "real", 4 NULL)

INSERT INTO t1 VALUES ('apple'),
                      ('banana'),
                      (NULL),
                      ('carrot'),
                      (NULL),
                      ('dropbear'),
                      (NULL),
                      ('elephant'),
                      ('furby'),
                      (NULL);

SELECT * FROM t1;
SELECT DISTINCT * FROM t1;
SELECT COUNT(*) FROM t1;
SELECT COUNT(c1) FROM t1;
SELECT COUNT(DISTINCT c1) FROM t1;

