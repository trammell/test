# $Id: update.sql,v 1.1 2005/08/23 19:29:56 johnt Exp $

USE test;

DROP TABLE IF EXISTS t1;

CREATE TEMPORARY TABLE t1 (
    name varchar(10) NOT NULL,
    value text
);


INSERT INTO t1 VALUES ('"foo"','foo with quotes');
INSERT INTO t1 VALUES ('foo','foo without quotes');
INSERT INTO t1 VALUES ('"bar"','bar with quotes');
INSERT INTO t1 VALUES ('bar','bar without quotes');

SELECT * FROM t1;

UPDATE t1 set name=REPLACE(name,'"','');

SELECT * FROM t1;
