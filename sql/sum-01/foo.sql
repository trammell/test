# $Id: foo.sql,v 1.1 2005/07/20 17:56:57 johnt Exp $

USE test;

SELECT VERSION();

DROP TABLE IF EXISTS t1;
CREATE TEMPORARY TABLE t1 (
    filename varchar(10),
    size_in_bytes int unsigned,
    mydate date
);

# insert 5 rows into the database

INSERT INTO t1 VALUES
    ('apple',    100, 20010101),
    ('banana',   200, 20020101),
    ('carrot',   300, 20030101),
    ('dropbear', 400, 20040101),
    ('elephant', 500, 20050101);

SELECT * FROM t1;

SELECT SUM(size_in_bytes) FROM t1;

SELECT SUM(size_in_bytes) FROM t1
WHERE mydate BETWEEN 20020601 AND 20040601;

