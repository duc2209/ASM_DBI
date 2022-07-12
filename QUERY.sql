-- 1.A query that uses ORDER BY to sort section by lecture id
SELECT * FROM Section
ORDER BY lid ASC

-- 2.A query that uses INNER JOINS to check which teachers Student studied
SELECT s.sname, L.lname
FROM Student s INNER JOIN G_Student gs ON s.sid = gs.sid
				INNER JOIN [Group] g ON gs.gid = g.gid
				INNER JOIN Lecture l ON l.lid = g.lid

-- 3.A query that uses aggregate functions to count how many section lecture teached
SELECT l.lname, COUNT (se.seid) AS NumberSectionTeached
FROM Lecture l INNER JOIN Section se ON se.lid = l.lid 
GROUP BY l.lname

-- 4.A query that uses the GROUP BY and HAVING clauses to check lecture teaches more than 10 section
SELECT l.lname, COUNT (se.seid) AS NumberSectionTeached
FROM Lecture l INNER JOIN Section se ON se.lid = l.lid 
GROUP BY l.lname 
HAVING  COUNT (se.seid) > 10

-- 5.A query that uses a sub-query as a relation to check 10 student have Lowest avg 
SELECT TOP 10 tb1.[Student Name], tb1.AVG, tb1.[Subject Name]
FROM
	(SELECT s.sid,s.sname AS [Student Name], su.suname AS [Subject Name],SUM(st.score * ia.Weight) AS[AVG]
	FROM  Student s INNER JOIN ScoreTable st ON s.sid = st.sid
					INNER JOIN Assessment a ON st.aid = a.aid
					INNER JOIN Subject su ON su.suid = a.suid
					INNER JOIN Info_Assessment ia ON ia.Category_ID = a.Category_ID
	GROUP BY s.sid, s.sname,su.suname) tb1
ORDER BY tb1.AVG 

-- 6.A query that uses a sub-query in the WHERE clause check 5 student have Lowest avg on subject dbi
SELECT TOP 5 tb1.[Student Name], tb1.AVG, tb1.[Subject Name]
FROM
	(SELECT s.sid,s.sname AS [Student Name], su.suname AS [Subject Name],SUM(st.score * ia.Weight) AS[AVG]
	FROM  Student s INNER JOIN ScoreTable st ON s.sid = st.sid
					INNER JOIN Assessment a ON st.aid = a.aid
					INNER JOIN Subject su ON su.suid = a.suid
					INNER JOIN Info_Assessment ia ON ia.Category_ID = a.Category_ID
	WHERE su.suname = 'DBI'
	GROUP BY s.sid, s.sname,su.suname) tb1
ORDER BY tb1.AVG 

-- 7.A query that uses partial matching in the WHERE clause to find student have name start with letters C
SELECT *
FROM Student s
WHERE s.sname LIKE 'C%'

-- 8.A query that uses a self-JOIN


-- 9.Check current avg of student
SELECT s.sid,s.sname AS [Student Name], su.suname AS [Subject Name],SUM(st.score * ia.Weight) AS[AVG]
FROM  Student s INNER JOIN ScoreTable st ON s.sid = st.sid
				INNER JOIN Assessment a ON st.aid = a.aid
				INNER JOIN Subject su ON su.suid = a.suid
				INNER JOIN Info_Assessment ia ON ia.Category_ID = a.Category_ID
GROUP BY s.sid, s.sname,su.suname
ORDER BY s.sid





