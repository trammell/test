
USE test;

DROP TABLE IF EXISTS t1;

CREATE TEMPORARY TABLE t1 (
    name text, pw text
);

INSERT INTO t1 VALUES ('jim', PASSWORD('foo') );
INSERT INTO t1 VALUES ('bob', MD5('foo') );
INSERT INTO t1 VALUES ('sally', SHA1('foo') );

SELECT * FROM t1;

SELECT * FROM t1 WHERE pw=PASSWORD('foo');
SELECT * FROM t1 WHERE pw=MD5('foo');
SELECT * FROM t1 WHERE pw=SHA1('foo');

