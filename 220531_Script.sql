CREATE TABLE new_sal(
deptno int,
sal int
);

SELECT
	*
FROM
	new_sal;

INSERT
	INTO
	new_sal
VALUES (10,
4000);

ALTER TABLE new_sal ADD CONSTRAINT PRIMARY KEY (deptno);
-- add PRIMARY KEY

SELECT deptno, ename, sal, comm FROM emp ORDER BY 1;
DELETE FROM emp WHERE deptno IS NULL;

-- 4.10 다른 테이블 값으로 업데이트 하기
UPDATE emp e, new_sal ns
SET e.sal = ns.sal,
e.comm = ns.sal*0
WHERE e.deptno = ns.deptno; -- deptno가 10인 사람에게 급여의 반을 commition으로 제공.

SELECT * FROM new_sal;
SELECT * FROM emp WHERE deptno=10;


-- 4.11 레코드 병합하기
CREATE TABLE emp_commission(
deptno int,
empno int,
ename varchar(255),
comm int
);

INSERT INTO emp_commission
SELECT deptno, empno, ename,comm 
FROM emp
WHERE deptno = 10;

SELECT * FROM emp_commission;


-- 4.12 테이블에서 모든 레코드 삭제
DELETE FROM emp WHERE empno = 7782;
SELECT * FROM emp ORDER BY deptno;
-- 4.13 특정 레코드 삭제
-- 4.14 단일 레코드 삭제

-- 4.15 참조 무결성 위반 삭제하기
DELETE FROM emp 
WHERE NOT EXISTS (
SELECT * FROM dept WHERE dept.deptno = emp.deptno
);
-- 먼소리지
SELECT * FROM emp;


-- 4.16 중복 레코드 삭제하기
CREATE TABLE dupes (
id int,
name varchar(255)
);

insert into dupes values (1, 'NAPOLEON');
insert into dupes values (2, 'DYNAMITE');
insert into dupes values (3, 'DYNAMITE');
insert into dupes values (4, 'SHE SELLS');
insert into dupes values (5, 'SEA SHELLS');
insert into dupes values (6, 'SEA SHELLS');
insert into dupes values (7, 'SEA SHELLS');

SELECT * FROM dupes ORDER BY 1;

-- mysql
DELETE FROM dupes 
WHERE id NOT IN (
	SELECT min(id) FROM (
		SELECT id, name FROM dupes
	) tmp 
GROUP BY name);

SELECT * FROM dupes;

SELECT min(id) FROM dupes GROUP BY name;

DELETE FROM dupes
WHERE id NOT IN (
	SELECT max(id) FROM (  SELECT id, name FROM dupes 	) 
	tmp2 GROUP BY name);
	

-- 다른 테이블에서 참조 된 레코드 삭제하기
create table dept_accidents
( deptno         integer,
  accident_name  varchar(20) );

insert into dept_accidents values (10,'BROKEN FOOT');
insert into dept_accidents values (10,'FLESH WOUND');
insert into dept_accidents values (20,'FIRE');
insert into dept_accidents values (20,'FIRE');
insert into dept_accidents values (20,'FLOOD');
insert into dept_accidents values (30,'BRUISED GLUTE');

select * from dept_accidents;

DELETE FROM emp
WHERE deptno IN (
	SELECT deptno 
	FROM dept_accidents
	GROUP BY deptno
	HAVING count(*) >=3
);

	SELECT deptno 
	FROM dept_accidents
	GROUP BY deptno
	HAVING count(*) >=3;
	


-- 기존 mapper/mybatis 에 있던 쿼리 분석 
<select id="selectJudgeApplyList" parameterType="Map" resultType="ApplyVO">
	<![CDATA[ -- 이게 들어가면 html특수문자 코드(>,<,&)에서 조금 자유롭다.
		/* selectJudgeApplyList */
		SELECT
				  @ROWNUM := @ROWNUM - 1 AS ROWNUM
				, C.*
		FROM(
				SELECT
						  A.edu_apply_info_no
						, A.judge_no
						, A.judge_name
						, A.judge_kind
						, A.ac_edu_id
						, A.etc_info
						, A.use_yn
						, A.reg_date
						, A.reg_id
						, A.apply_confirm_date
						, A.apply_confirm_id
						, A.cert_confirm_date
						, A.cert_confirm_id
						, B.ac_edu_schedule_no
						, B.ac_edu_title
						, CASE WHEN length(B.ac_edu_title) < 36
							   THEN B.ac_edu_title
							   ELSE RPAD(SUBSTRING(B.ac_edu_title, 1, 12), 16, '*') END AS ac_edu_title_mask
						, B.ac_edu_place
						, B.ac_edu_start_date
						, B.ac_edu_end_date
						, B.ac_edu_institute
						, (SELECT
										C.ac_edu_cert_file_path
						   FROM
										AC_EDU_CERT_INFO C
						   WHERE
										A.judge_no = C.judge_no
						   AND
										A.ac_edu_id = C.ac_edu_id) AS ac_edu_cert_file_path
				FROM
						EDU_APPLY_INFO A
				JOIN
						AC_EDU_SCHEDULE B
				ON
						A.ac_edu_id = B.ac_edu_id
				WHERE
						YEAR(B.ac_edu_start_date) = #{year}
				AND
						A.judge_no = #{judgeNo}
				ORDER BY
						B.ac_edu_start_date DESC
			) C
				WHERE
						@ROWNUM := #{applyListCnt} + 1
		]]>
	</select>
	
	-- 220607 
	
	 SELECT column_name FROM information_schema.`COLUMNS`
	 WHERE TABLE_SCHEMA = 'smart5db'
	 AND TABLE_NAME = 'dept';
	 
	-- ㅎㄷㄷ 나온다니
	
	SHOW TABLE STATUS; -- 현재 선택된 DB의 모든 테이블 정보 조회
	
	SHOW TABLE status WHERE name = 'emp'; --현재 선택 된 db의 해당 테이블에 대한 정보 조회
	
	-- 5.4
	SELECT a.TABLE_name,
	a.constraint_name,
	b.column_name,
	a.constraint_name
	FROM information_schema.TABLE_CONSTRAINTS a,
	information_schema.KEY_COLUMN_USAGE b;

SELECT a.TABLE_name,
	a.constraint_name,
	b.column_name,
	a.constraint_name
	FROM information_schema.TABLE_CONSTRAINTS a,
	information_schema.KEY_COLUMN_USAGE b
	WHERE a.table_name = 'emp'
	AND a.TABLE_SCHEMA = 'smeagol'
	AND a.TABLE_SCHEMA = b.table_name
	AND a.TABLE_SCHEMA =b.table_schema
	AND a.constraint_name = b.constraint_name
	
	
-- 6.1 문자열 짚어보기
	
	SELECT substr(e.ename, iter.pos,1) AS '컬럼명'
	FROM (SELECT ename FROM emp WHERE ename = 'king') e,
	(SELECT id AS pos FROM t10) iter
	WHERE iter.pos <= length(e.ename);

SELECT ename, iter.pos 
FROM (SELECT ename FROM emp WHERE ename='king') e,
(SELECT id AS pos FROM t10) iter;

SELECT ename, iter.pos 
FROM (SELECT ename FROM emp WHERE ename='king') e,
(SELECT id AS pos FROM t10) iter
WHERE iter.pos <= length(e.ename);

select substr(e.ename,iter.pos) a,
       substr(e.ename,length(e.ename)-iter.pos+1) b
  from (select ename from emp where ename = 'KING') e,
       (select id pos from t10) iter
 where iter.pos <= length(e.ename);
 
SELECT e.job, d.loc
FROM emp e JOIN dept d
ON (e.deptno = d.deptno)
WHERE e.deptno =10;

SELECT * FROM emp;
SELECT * FROM dept;


SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM shippers;

SELECT * 
FROM (
(orders JOIN customers ON orders.CustomerID = customers.CustomerID) JOIN shippers on
shippers.ShipperId = Customers.ShipperID);

-- 0608
-- 6.1 문자열 짚어보기
SELECT substr(e.ename, iter.pos) AS '6.1예제'
FROM (SELECT ename FROM emp WHERE ename = 'king')e, 
(SELECT id AS pos FROM t10) iter 
WHERE iter.pos <= LENGTH(e.ename);

-- 6.10 테이블 행으로 구분된 목록 만들기
SELECT deptno, 
group_concat(ename ORDER BY empno SEPARATOR '♥') AS emps -- SEPARATOR 뒤에 콤마 붙어있어서 에러 남
FROM emp
GROUP BY deptno;

SELECT deptno FROM emp;

-- 6.11 다중값 in 목록으로 변환하기
SELECT ename, sal, deptno 
FROM emp
WHERE empno IN ('7654,7698,7782,7788'); -- 에러 나는건 아니고 실패하는 것 뿐인가보군.

-- 심화

SELECT
	empno,
	sal,
	deptno
FROM
	emp
WHERE
	empno IN(
	SELECT
		substring_index(
		substring_index(list.vals, ',', iter.pos), ',',-1) empno
	FROM
		(
		SELECT
			id pos
		FROM
			t10) AS iter,
		(
		SELECT
			'7654,7698,7782,7788' AS vals
		FROM
			t1) list
	WHERE
		iter.pos <= (LENGTH(list.vals)-LENGTH(REPLACE(list.vals, ',', '')))+ 1
		);
	
	
	-- 6.12 문자열을 알파벳순으로 정렬
 select ename, group_concat(c order by c separator '')
   from (
 select ename, substr(a.ename,iter.pos,1) c
   from emp a,
        ( select id pos from t10 ) iter
  where iter.pos <= length(a.ename)
        ) x
  group by ename; -- 왜 하는지 모르겠는.


  -- 3.1 행 집합을 다른 행과 통합! union, unionAll
  SELECT ename AS '이름', deptno'부서' 
  FROM emp
  WHERE deptno = 10
  UNION all
  SELECT '-------', NULL 
  FROM t1
  UNION all
  SELECT dname, deptno 
  FROM dept;
 
 SELECT deptno '부서'
 FROM emp
 UNION 
 SELECT deptno FROM dept;

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT ename,loc FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno=10;

SELECT ename,d.loc,e.deptno 'emp_deptno', d.deptno 'dept_deptno'FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno=10;

SELECT e.ename, d.loc FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE e.deptno =10;

SELECT * FROM V;

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, E.DEPTNO
FROM EMP E, V
WHERE E.ENAME = V.ename
AND E.job =V.job;

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, E.DEPTNO
FROM emp e JOIN v ON (e.ename = v.ename AND e.job = v.job AND e.sal=v.sal) ;
-- 괄호를 하는게 무슨 의미가 있는거지?

-- 3.4 테이블 내에 없는 값 검색
SELECT deptno FROM dept
WHERE deptno NOT IN (SELECT deptno FROM emp);-- 1,2,20,40,50,60,70

SELECT deptno FROM emp; -- 10~,30~
SELECT deptno FROM dept; -- 1,2,10,20,30,40,50,60,70


SELECT deptno
FROM dept
WHERE deptno IN (10,70,NULL); -- null값은 반환X 

SELECT * FROM dept;

SELECT deptno
FROM dept
WHERE (deptno=10 OR deptno=50 OR deptno = NULL); -- ...??

SELECT deptno FROM dept
WHERE deptno NOT IN (10,50,null);

SELECT d.deptno 
FROM dept d
WHERE NOT exists (
SELECT 1 FROM emp e WHERE d.deptno = e.deptno 
);
SELECT * FROM dept;
SELECT * FROM emp;

SELECT d.* FROM dept d LEFT OUTER JOIN emp e
ON d.deptno = e.deptno WHERE e.job NOT IN ('clerk');

SELECT d.* FROM dept d;
SELECT * FROM emp;

SELECT d.* FROM dept d 
LEFT JOIN emp e 
ON d.deptno =e.deptno
WHERE e.job NOT IN ('clerk');

SELECT d.* FROM dept d 
WHERE d.deptno IN (10,40);

SELECT d.* FROM dept d 
WHERE d.deptno NOT IN (SELECT e.* FROM emp e WHERE e.deptno= 10);

SELECT e.* FROM emp e WHERE e.deptno= 10;

SELECT d.* FROM dept d WHERE d.deptno NOT IN (SELECT e.deptno FROM emp e WHERE e.job='clerk');

-- 3.6 쿼리 방해 없이 조인 추가
SELECT * FROM emp_bonus;

SELECT * 
FROM emp e, dept d
WHERE e.deptno =d.deptno ;

SELECT e.ename, d.loc, eb.`TYPE` 
FROM emp e, dept d, emp_bonus eb 
WHERE e.deptno =d.deptno AND  e.empno = eb.empno ;

SELECT e.ename, d.loc, eb.`TYPE`
from emp e JOIN dept d ON e.deptno = d.deptno 
LEFT JOIN emp_bonus eb ON e.empno =eb.empno; 

SELECT e.ename, d.loc
from emp e JOIN dept d ON e.deptno = d.deptno;


-- 220609
SELECT ename
FROM emp
LIMIT 5;

-- 3.9 집계를 사용할 때 조인 수행하기
SELECT empno FROM emp_bonus
UNION
SELECT empno FROM emp;

SELECT * FROM emp;
SELECT * FROM emp_bonus;

UPDATE emp_bonus SET empno = 7934 WHERE TYPE=3; 


SELECT e.empno, eb.empno, e.ename, eb.`TYPE`, e.sal
 from emp e, emp_bonus eb
where e.empno  = eb.empno
  and e.deptno = 10; -- 안나오는데?... 
  -- 오 겹치는 데이터가 없었어
  
select deptno,
       sum(sal) as total_sal,
       sum(bonus) as total_bonus
  from (
select e.empno,
       e.ename,
       e.sal,
       e.deptno,
       e.sal*case when eb.type = 1 then .1
                  when eb.type = 2 then .2
                  else .3
             end as bonus
  from emp e, emp_bonus eb
 where e.empno  = eb.empno
   and e.deptno = 10
       ) x
 group by deptno;
 

select e.empno,
       e.ename,
       e.sal,
       e.deptno,
       e.sal*case when eb.type = 1 then .1
                  when eb.type = 2 then .2
                  else .3
             end as bonus
  from emp e, emp_bonus eb
 where e.empno  = eb.empno;
 



SELECT deptno,
		sum(sal) '합계',
		sum(svt) '세븐틴짱'
FROM
(
SELECT e.empno, 
e.ename, 
e.deptno,
e.sal,
e.sal * CASE WHEN eb.`TYPE` = 1 THEN .1 -- CASE WHEN THEN 문은 나중에 와야하는건가?
			WHEN eb.`TYPE` =2 THEN .2
			ELSE .3
			END AS svt
FROM emp_bonus eb, emp e
WHERE eb.empno = e.empno 
	AND e.deptno =10
)t
GROUP BY deptno;


-- 3.10 집계를 사용 할 때 외부 조인 수행
SELECT * FROM emp_bonus eb ;
-- 부서 10의 모든 사원에게 보너스가 주어지지 않도록 emp_bonus 테이블 수정

/*SELECT e.empno,
e.ename,
e.sal,
e.hiredate
e.sal * CASE WHEN e.deptno = 10 THEN 0
		WHEN eb.
			
FROM emp_bonus eb
JOIN emp e ON eb.empno = e.empno ;*/

SELECT *FROM emp WHERE deptno=10;
SELECT * FROM emp_bonus;
UPDATE emp SET deptno=30 WHERE empno=7934;
INSERT INTO emp_bonus (empno,received,`TYPE`) values(7499,now(),1);

SELECT ttt.deptno '부서', sum(sal) AS '급여 합계', sum(svt) '보너스', ttt.ename
from
(
SELECT e.empno,
e.ename, 
e.sal, 
eb.`TYPE`, 
e.deptno,
e.sal * CASE WHEN e.deptno = 10 THEN 0
			WHEN eb.`TYPE`=1 THEN .1
					WHEN eb.`TYPE`=2 THEN .2
					ELSE .3 END AS svt
FROM emp_bonus eb 
JOIN emp e
ON eb.empno = e.empno
)ttt
GROUP BY deptno;


SELECT * FROM emp;
SELECT * FROM dept;
INSERT INTO emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(7961,'SERA','CLERK',7500,19820128,1200,NULL,null); 
UPDATE emp SET deptno='70' WHERE ename='SERA';
-- 3.11 여러 테이블에서 누락된 데이터 반환
-- 사원이 없는 부서를 찾고자 dept 테이블에서 emp 테이블에 없는 행을 반환.

SELECT * FROM emp e
JOIN dept d ON e.deptno = d.deptno 
WHERE job NOT IN ('CLERK')
GROUP BY d.deptno;


SELECT test.deptno '부서',
test.job '직업',
test.ename '이름',
test.loc '거주지'
from
	(SELECT e.deptno, e.job, e.ename, d.loc
	FROM dept d
	JOIN emp e 
	ON d.deptno = e.deptno)test
WHERE job = 'CLERK';

SELECT * FROM dept;
SELECT * FROM emp WHERE job = 'clerk'; 

SELECT d.deptno, d.dname,d.loc, e.empno , e.job , e.sal
FROM dept d
LEFT JOIN emp e
ON (d.deptno = e.deptno);


SELECT d.deptno, d.dname,d.loc, e.empno , e.job , e.sal
FROM dept d
LEFT JOIN emp e
ON (d.deptno = e.deptno) WHERE e.job NOT IN ('clerk') ;

SELECT d.deptno, d.dname,d.loc, e.ename, e.empno , e.job , e.sal
FROM dept d
right JOIN emp e
ON (d.deptno = e.deptno) WHERE e.job NOT IN ('clerk')
UNION 
SELECT d.deptno, d.dname,d.loc, e.ename, e.empno , e.job , e.sal
FROM dept d
LEFT JOIN emp e
ON (d.deptno = e.deptno) WHERE e.job IS NULL ORDER BY deptno;



SELECT	COUNT(*)
FROM	(
	SELECT 	(CASE WHEN A.ac_edu_end_date < DATE_FORMAT(NOW(), '%Y%m%d')	THEN '04' -- 종료
			WHEN A.ac_apply_end_date < DATE_FORMAT(NOW(), '%Y%m%d') THEN '03' -- 인원마감
			WHEN A.ac_apply_limit_count = 
					(	SELECT COUNT(*) 
						FROM EDU_APPLY_INFO B
						WHERE A.ac_edu_id = B.ac_edu_id
						)										  THEN '03' -- 인원마감
			WHEN A.ac_apply_start_date > DATE_FORMAT(NOW(), '%Y%m%d')  THEN '01' -- 대기중
			ELSE '02' -- 신청중
		END) AS ac_edu_status /* 01: 대기중, 02: 신청중, 03: 인원마감, 04: 종료 */
	FROM	AC_EDU_SCHEDULE A
	WHERE
		YEAR(ac_edu_start_date) =
		#{year}
			) B
	]]>
		<if test="eduStatus != null and eduStatus != ''">
		<![CDATA[
		WHERE
				B.ac_edu_status = #{eduStatus}
		]]>
		</if>