-- $Id: foo.pl,v 1.1 2005/07/18 18:48:23 johnt Exp $

USE test;

CREATE TEMPORARY TABLE t1 (
    c1 date PRIMARY KEY
);

INSERT INTO t1 VALUES
    ('2005-01-01'),
    ('2005-01-02'),
    ('2005-01-03'),
    ('2005-01-04'),
    ('2005-02-01'),
    ('2005-02-02'),
    ('2005-02-03'),
    ('2005-02-04'),
    ('2005-03-01');

SELECT * FROM t1;
SELECT * FROM t1 WHERE c1 LIKE '2005%';
SELECT * FROM t1 WHERE c1 LIKE '2005-02%';

EXPLAIN SELECT * FROM t1 WHERE c1 LIKE '2005-02%' \G

