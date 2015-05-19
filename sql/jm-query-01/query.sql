# $Id: query.sql,v 1.4 2005/09/28 20:15:42 johnt Exp $

# invoke as e.g. "mysql -t -t -t < query.sql"
# NOTE: this query is unlikely to work on anything other than MySQL

# 1. Create the table and populate it

USE test;

CREATE TEMPORARY TABLE t1 (
  orderid varchar(4)  NOT NULL,
  item    varchar(20) NOT NULL
);

# order 'a' consists of a burger and fries
INSERT INTO t1 VALUES ('a','hamburger'), ('a','fries');

# order 'b' consists of a burger, fries, and a coke
INSERT INTO t1 VALUES ('b','hamburger'), ('b','fries'), ('b', 'coke');

# order 'c' consists of a milkshake 
INSERT INTO t1 VALUES ('c','milkshake');

# order 'd' consists of a burger, fries, a coke, and an octopus
INSERT INTO t1 VALUES ('d','hamburger'), ('d','fries'), ('d','octopus'),
	('d', 'coke');

# 2. query the data

set @n=0;
set @last='a';
SELECT @n:=if(@last=orderid,@n+1,1) as n,
       @last:=if(@last=orderid,@last,orderid) as last,
       orderid, item
FROM t1 ORDER BY orderid, item;

# Output is:
# n       last    orderid item
# 1       a       a       fries
# 2       a       a       hamburger
# 1       b       b       coke
# 2       b       b       fries
# 3       b       b       hamburger
# 1       c       c       milkshake
# 1       d       d       coke
# 2       d       d       fries
# 3       d       d       hamburger
# 4       d       d       octopus

