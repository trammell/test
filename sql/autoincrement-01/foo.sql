
USE test;

CREATE TEMPORARY TABLE t (
    i int unsigned not null auto_increment PRIMARY KEY,
    c char(50) NOT NULL,
    j int unsigned not null auto_increment,
    PRIMARY KEY (i),
    UNIQUE KEY (c,j)
);

INSERT INTO t (c) VALUES ('a'), ('b'), ('c'), ('d');
INSERT INTO t (c) VALUES ('a'), ('a');
INSERT INTO t (c) VALUES ('b'), ('b'), ('b');
INSERT INTO t (c) VALUES ('c'), ('c'), ('c'), ('c');

SELECT * FROM t;

