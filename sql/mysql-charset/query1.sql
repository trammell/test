-- $Id: query1.sql,v 1.2 2007/08/17 19:05:29 johnt Exp $

USE test;
DROP TABLE if exists user;
DROP TABLE if exists user_message;

CREATE TEMPORARY TABLE user (
    userid varchar(10),
    firstname varchar(50),
    lastname varchar(50),
    PRIMARY KEY (userid)
) CHARACTER SET ascii COLLATE ascii_bin;

SHOW CREATE TABLE user \G

INSERT INTO user values
    ('jöhn','John','Trammell'),
    ('šušan','Susan','Trammell'),
    ('sarah','Sarah','Benson'),
    ('ann','Ann','Wendel');

SELECT * FROM user;
SELECT hex(userid) FROM user where userid like '%an';

CREATE TEMPORARY TABLE user_message (
    userid varchar(10),
    message text,
    KEY (userid)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

SHOW CREATE TABLE user_message \G

INSERT INTO user_message values
    ('jöhn','I am john'),
    ('šušan','I am susan'),
    ('sarah','I am Sarah'),
    ('sarah','I am still Sarah');

SELECT * FROM user_message;

SELECT * FROM user LEFT JOIN user_message using (userid);

