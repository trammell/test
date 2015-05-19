# $Id: foo.sql,v 1.2 2005/08/12 15:01:47 johnt Exp $

USE test;

DROP TABLE IF EXISTS student;
CREATE TEMPORARY TABLE student (
    studentid INT NOT NULL,
    studentname VARCHAR(30)
);

INSERT INTO student VALUES
    (1,'Andy'),
    (2,'Betty'),
    (3,'Carl'),
    (4,'Dan'),
    (5,'Eddie');

DROP TABLE IF EXISTS subjectgrade;
CREATE TABLE subjectgrade (
    studentid INT NOT NULL,
    subject VARCHAR(30) NOT NULL,
    grade CHAR(1)
);

INSERT INTO subjectgrade VALUES
    (1, 'Maths', 'A'),
    (1, 'Phys',  'B'),
    (1, 'Chem',  'A'),
    (2, 'Maths', 'A'),
    (2, 'Chem',  'A'),
    (3, 'Bio',   'C'),
    (3, 'Chem',  'A'),
    (4, 'Lit',   'A'),
    (4, 'Gym',   'A'),
    (4, 'Maths', 'A'),
    (4, 'Chem',  'A'),
    (5, 'Lit',   'A'),
    (5, 'Gym',   'A'),
    (5, 'Maths', 'A'),
    (5, 'Chem',  'B')
;

SELECT s.studentname
FROM student s, subjectgrade sg1, subjectgrade sg2
WHERE s.studentid = sg1.studentid
AND   sg1.subject = 'Maths'
AND   sg1.grade   = 'A'
AND   s.studentid = sg2.studentid
AND   sg2.subject = 'Chem'
AND   sg2.grade   = 'A';

SELECT studentname
FROM student
INNER JOIN subjectgrade sg1 USING (studentid)
INNER JOIN subjectgrade sg2 USING (studentid)
WHERE sg1.subject='Maths' AND sg1.grade='A'
AND   sg2.subject='Chem'  AND sg2.grade='A';
