# $Id: missing-date.sql,v 1.1 2005/08/18 21:29:18 johnt Exp $

USE test;

DROP TABLE IF EXISTS t1;

CREATE TABLE t1 (
    d date NOT NULL PRIMARY KEY
);

INSERT INTO t1 VALUES ('2005-01-01');
INSERT INTO t1 VALUES ('2005-01-02');
INSERT INTO t1 VALUES ('2005-01-04');
INSERT INTO t1 VALUES ('2005-01-07');
INSERT INTO t1 VALUES ('2005-01-11');
INSERT INTO t1 VALUES ('2005-01-16');

SELECT a.d as 'Rangemin', MIN(b.d) as 'Rangemax'
FROM t1 AS a, t1 AS b
WHERE a.d < b.d
GROUP BY a.d
HAVING DATE_SUB(Rangemax,interval 1 day) > Rangemin;

