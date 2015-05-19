# $Id: missing.sql,v 1.5 2005/08/18 21:25:05 johnt Exp $

USE test;

DROP TABLE IF EXISTS t1;

CREATE TABLE t1 (
    id int NOT NULL PRIMARY KEY
);

INSERT INTO t1 VALUES (0);
INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (4);
INSERT INTO t1 VALUES (9);
INSERT INTO t1 VALUES (16);
INSERT INTO t1 VALUES (25);

SELECT a.id as 'Rangemin', MIN(b.id) as 'Rangemax'
FROM t1 AS a, t1 AS b
WHERE a.id < b.id
GROUP BY a.id
HAVING Rangemax - Rangemin > 1;

#SELECT a.id+1 AS 'Missing From', MIN(b.id)-1 AS 'To'
#FROM t1 AS a, t1 AS b
#WHERE a.id+1 < b.id
#GROUP BY a.id+1
#HAVING 'Missing From' < MIN(b.id)
#ORDER BY 1;

#SELECT t1.id+1 AS 'Lower', t1.id-1 AS 'Upper'
#FROM t as t1; 
#, t as t2;
#MIN(id)+1 AS 'To' FROM t;

#SELECT a.id+1 AS 'Missing From', MIN(b.id)-1 AS 'To'
#FROM t AS a, t AS b
#WHERE a.id < b.id
#GROUP BY a.id
#HAVING a.id + 1 < MIN(b.id)
#ORDER BY 1;

