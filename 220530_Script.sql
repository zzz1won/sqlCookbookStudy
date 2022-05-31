/* 220530 */
CREATE TABLE EMP (
EMPNO INT AUTO_INCREMENT,
ENAME VARCHAR(255) NOT NULL,
JOB VARCHAR(255) NOT NULL,
MGR INT NOT NULL,
HIREDATE DATE NOT NULL,
SAL INT NOT NULL,
COMM INT,
DEPTNO INT,

CONSTRAINT PRIMARY KEY (EMPNO)
);

/*INSERT INTO EMP (ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES ('SMITH',)*/
DROP TABLE EMP;
SELECT * FROM EMP;
drop table IF EXISTs emp;
drop table IF EXISTs dept;

CREATE TABLE dept ( 
	deptno               int  NOT NULL  AUTO_INCREMENT,
	dname                varchar(20)    ,
	loc                  varchar(20)    ,
	CONSTRAINT pk_dept PRIMARY KEY ( deptno )
 ) engine=InnoDB;

CREATE TABLE emp ( 
	empno                int  NOT NULL  AUTO_INCREMENT,
	ename                varchar(20)    ,
	job      			 varchar(20),
	mgr                  smallint    ,
	hiredate             date    ,
	sal                  numeric(7,2)    ,
	comm                 numeric(7,2)    ,
	deptno               int    ,
	CONSTRAINT pk_emp PRIMARY KEY ( empno )
 ) engine=InnoDB;

CREATE INDEX idx_emp ON emp ( deptno );

ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY ( deptno ) REFERENCES dept( deptno ) ON DELETE NO ACTION ON UPDATE NO ACTION;

insert into dept values(10, 'ACCOUNTING', 'NEW YORK'),(20, 'RESEARCH', 'DALLAS'),(30, 'SALES', 'CHICAGO'),(40, 'OPERATIONS', 'BOSTON');
insert into emp values( 7839, 'KING', 'PRESIDENT', null, STR_TO_DATE ('17-11-1981','%d-%m-%Y'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('1-5-1981','%d-%m-%Y'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('9-6-1981','%d-%m-%Y'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('2-4-1981','%d-%m-%Y'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, DATE_ADD(STR_TO_DATE('13-7-1987','%d-%m-%Y'),INTERVAL -85 DAY)  , 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('3-12-1981','%d-%m-%Y'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-12-1980','%d-%m-%Y'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-2-1981','%d-%m-%Y'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-2-1981','%d-%m-%Y'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-09-1981','%d-%m-%Y'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('8-9-1981','%d-%m-%Y'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, DATE_ADD(STR_TO_DATE('13-7-1987', '%d-%m-%Y'),INTERVAL -51 DAY), 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('3-12-1981','%d-%m-%Y'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-1-1982','%d-%m-%Y'), 1300, null, 10);

-- 1.1 테이블의 모든 행과 열 검색
SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM EMP;

-- 1.2 테이블, 행의 하위 집합 검색
SELECT * FROM EMP WHERE DEPTNO = 10;

-- 1.3 여러 조건을 충족하는 행 찾기
SELECT * FROM EMP WHERE DEPTNO =10 OR COMM IS NOT NULL OR (SAL<=2000 AND DEPTNO =20);

SELECT * FROM EMP WHERE (DEPTNO =10 OR COMM IS NOT NULL OR SAL<=2000) AND DEPTNO =20; -- DEPTNO가 20인게 메인으로 잡히쥬

-- 1.4 열의 하위집합 검색하기
SELECT ENAME,DEPTNO,SAL FROM EMP;

-- 1.5 열에 의미 있는 이름 지정하기
SELECT ENAME AS 'NAME', SAL '급여', COMM '커미션' FROM EMP;
-- 일부 데이터베이스에서는 AS를 쓸 필요가 없지만 모두 용인한다.

-- 1.6 WHERE 절에서 별칭이 지정된 열 참조
SELECT ENAME AS 'NAME', SAL 'SALARY', COMM '커미션' FROM EMP WHERE SALARY < 5000; -- ERROR

SELECT * FROM (SELECT ENAME AS 'NAME', SAL 'SALARY', COMM '커미션' FROM EMP) X WHERE 커미션 IS NULL;
SELECT * FROM (SELECT ENAME AS 'NAME', SAL 'SALARY', COMM '커미션' FROM EMP) X WHERE NAME = 'ALLEN';
SELECT * FROM (SELECT ENAME AS 'NAME', SAL 'SALARY', COMM '커미션' FROM EMP) X WHERE SALARY <= 1800;
SELECT * FROM (SELECT ENAME AS 'NAME', SAL 'SALARY', COMM '커미션' FROM EMP)  WHERE SALARY <= 1800; -- ERROR
-- 서브쿼리로 묶어준 후 VIEW에서 확인 가능, X는 왜 붙이는거지?

-- 1.7 열 값 이어 붙이기
SELECT CONCAT(ENAME, 'WORKS AS A', JOB) FROM EMP WHERE DEPTNO = 10; -- MYSQL 문법

-- 1.8 select 문에서 조건식 사용하기
SELECT ename, sal,
CASE WHEN sal <= 2000 THEN 'underpaid'
	WHEN sal >= 4000 THEN 'overpaid'
	ELSE 'ok'
	END as status
FROM emp;

-- 1.9 반환되는 수 행 제한하기
SELECT * FROM emp LIMIT 5; -- mySQL 문법

-- 1.10 테이블에서 n개의 무작위 레코드 반환
SELECT ename,job FROM emp ORDER BY rand() LIMIT 5;

-- 1.11 null값 찾기
SELECT * FROM emp WHERE comm IS NULL;

-- 1.12 null을 실제 값으로 변환하기
SELECT coalesce(comm, 0) FROM emp;

-- 1..13 패턴검색하기
SELECT ename,job FROM emp WHERE deptno =10  OR deptno =20 AND (ename LIKE '%i%' OR job like '%er'); -- error
SELECT ename,job FROM emp WHERE deptno IN (10, 20) AND (ename LIKE '%i%' OR job like '%er');




-- 2.1 지정한 순서대로 쿼리 결과 반환하기
SELECT * FROM emp WHERE deptno=10 ORDER BY sal DESC;
SELECT ename, job, sal FROM emp WHERE deptno=10 ORDER BY 3 DESC; -- SELECT 절 다음에 오는 column의 번호로 대체 할 수 있다.(헐)

-- 2.2 다중 필드로 정렬하기
SELECT empno, deptno,sal,ename,sal FROM emp ORDER BY deptno, sal DESC; 
-- ORDER BY의 우선순위는 왼쪽에서 오른쪽.  

-- 2.3 부분 문자열로 정렬하기
-- job 열의 마지막 두 문자를 기준으로 정렬
SELECT ename, job FROM emp ORDER BY substr(job,LENGTH(job)-1) asc;

-- 2.4 혼합 영숫자 데이터 정렬하기 (mysql은 현재 적용 x)

-- 2.5 정렬할 때 null 처리하기
SELECT ename, sal, comm FROM emp ORDER BY comm desc; -- 이건 NULL 과 NOT NULL 을 정렬하는 방식
-- null과 not null을 구분하며, not null 데이터를 또 정렬하기
-- ?? 왜 안되지?
	SELECT ename, sal, comm 
	from (
	SELECT ename, sal, comm,
		   CASE WHEN comm IS NULL THEN 0 ELSE 1 END AS IS null
	FROM emp
	)x
	ORDER BY IS NULL DESC, comm;
	

SELECT ename, sal, comm
FROM (
SELECT ename,sal,comm,
	CASE WHEN comm IS NULL THEN 0 
	ELSE 1 
	END AS is_null
	FROM emp
	) x 
ORDER BY is_null DESC,comm;

-- null을 처음에 나타낸 후, null이 아닌 comm은 내림차순 정렬
SELECT ename, sal, comm
FROM (
SELECT ename, sal, comm,
CASE WHEN comm IS NULL THEN 0
ELSE 1
END AS is_null
FROM emp
)x
ORDER BY is_null, comm DESC;

-- 2.6 데이터 종속 키 기준으로 정렬하기 
-- order by절에서 case문을 돌린다. (오)

SELECT ename, sal, job, comm FROM emp ORDER BY CASE WHEN job = 'salesman' THEN comm ELSE sal end;



-- 3.1 행 집합을 다른 행 위에 추가하기
SELECT ename AS ename_and_dname, deptno FROM emp
WHERE deptno=10
UNION ALL  
SELECT dname, deptno FROM dept;

-- 3.2 연관 된 여러 행 결합하기
SELECT ename, loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.deptno=10;
SELECT ename, loc from emp e JOIN dept d ON (e.deptno = d.deptno) WHERE e.deptno=10;  

-- 3.3 두 테이블의 공통 행 찾기

CREATE VIEW V AS SELECT ename, job,sal FROM emp WHERE job = 'clerk';
SELECT * FROM V;

SELECT e.empno, e.ename,e.job,e.sal,e.deptno
FROM emp e,V
WHERE e.ename = v.ename
AND e.job=v.job AND e.sal=v.sal; -- ?

SELECT e.empno, e.ename,e.job,e.sal,e.deptno
FROM emp e JOIN V
ON (e.ename = v.ename and e.sal = v.sal and e.sal=v.sal);

-- 3.4 한 테이블에서 다른 테이블에 존재하지 않는 값 검색하기
-- 이해 안됨

-- 3.5 다른 테이블 행과 일치하지 않는 행 검색하기
-- null에 대한 외부 조인 및 필터 사용
SELECT * FROM emp;
SELECT * FROM dept;
SELECT d.* FROM dept d LEFT OUTER JOIN emp e ON (d.deptno = e.deptno) WHERE e.deptno IS NULL;
-- dept에 있으나 emp에 없는 데이터를 추출해서 출력한다.

CREATE TABLE T1 (ID INTEGER);
INSERT INTO T1 VALUES (1);

CREATE TABLE T10 (ID INTEGER);
INSERT INTO T10 VALUES (1);
INSERT INTO T10 VALUES (2);
INSERT INTO T10 VALUES (3);
INSERT INTO T10 VALUES (4);
INSERT INTO T10 VALUES (5);
INSERT INTO T10 VALUES (6);
INSERT INTO T10 VALUES (7);
INSERT INTO T10 VALUES (8);
INSERT INTO T10 VALUES (9);
INSERT INTO T10 VALUES (10);

-- 3.6 다른 조인을 방해하지 않고 쿼리에 조인 추가하기
select * from emp_bonus;
CREATE TABLE emp_bonus (
empno int,
received date,
TYPE int,
CONSTRAINT PRIMARY KEY (empno)
)

DROP TABLE emp_bonus;

INSERT INTO emp_bonus (empno,received,TYPE)
values(7369,'2005/03/14',1),(7900,'2005/03/14',2),(7788,'2005/03/14',3);

UPDATE emp_bonus SET TYPE = 3 WHERE empno=3;

SELECT e.ename, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno;

SELECT e.ename,d.loc,eb.received, FROM emp e, dept d, emp_bonus eb WHERE e.deptno=d.deptno AND e.empno = eb.empno;
-- ??

create view V2
as
select * from emp where deptno != 10
 union all
select * from emp where ename = 'WARD'

SELECT * FROM V2;


-- 4.1 새로운 레코드 삽입 
INSERT INTO dept (deptno, dname, loc)
VALUES (1,'A','B'),(2,'B','C');

SELECT * FROM dept;

INSERT INTO dept
VALUES (60,'PROGRAMMING2','BALTIMORE2'),(70,'PROGRAMMING3','BALTIMORE3');

-- 4.2 기본 값 삽입하기
-- 값을 지정하지않고 기본값 행을 삽입 할 수 있다.

CREATE TABLE D (
id integer DEFAULT 0
);

INSERT INTO D
VALUES (default);
SELECT * FROM D;

INSERT INTO D (id) VALUES (default);
INSERT INTO D VALUES ();

DROP TABLE d;
CREATE TABLE D (
id integer DEFAULT 0,
foo varchar(10)
);

INSERT INTO D (foo) values('Bar');


-- 4.3 null로 기본값 오버라이딩하기
INSERT INTO D (id, foo)
VALUES (NULL, '하하');
SELECT * FROM D;

INSERT INTO D (foo)
VALUES ('민들레');


-- 4.4 한 테이블에서 다른 테이블로 행 복사하기
-- 현재 dept_east라는 테이블은 없으니...

INSERT INTO dept_east(deptno,dname,loc)
SELECT deptno,dname,loc
FROM dept
WHERE loc IN ('New York','Boston');


-- 4.5 테이블 정의 복사하기
-- DB2
CREATE TABLE dept2 LIKE dept;
SELECT * FROM dept2;

-- Oracle, MySQL, PostgreSQL
CREATE TABLE dept3 AS SELECT * FROM dept WHERE 1 = 0;
SELECT * FROM dept3;

-- SQL Server
SELECT * INTO dept4 FROM dept WHERE 1=0;

CREATE TABLE dept5 AS SELECT * FROM dept WHERE 1 = 1;
SELECT * FROM dept5;


-- 4.6 한 번에 여러 테이블에 삽입
-- mySql 미지원

-- 4.7 특정 열에 대한 삽입 차단
 
CREATE VIEW NEW_emp AS SELECT empno, ename, job FROM emp;

INSERT INTO new_emp (empno,ename,job) VALUES (1,'jonathan','editor');
SELECT * FROM new_emp;
SELECT * FROM emp;


-- 4.8 테이블에서 레코드 수정하기
SELECT * FROM emp WHERE deptno = 20;

UPDATE emp SET sal = sal * 1.10
WHERE deptno = 20;

SELECT deptno, ename, sal AS orig_sal, sal*.10 AS amt_to_ADD, sal*1.10 AS NEW_sal
FROM emp WHERE deptno=20 ORDER BY 1,5;


-- 4.9 일치하는 행이 있을 때 업데이트 하기

SELECT * FROM emp_bonus;
UPDATE emp SET sal=sal/1.2 WHERE empno IN (SELECT empno FROM emp_bonus);
SELECT ename,sal AS '원래급여', sal*.2 '오른급여', sal*1.2 '최종급여' FROM emp WHERE sal IS NOT NULL AND empno IN (SELECT empno FROM emp_bonus) ;