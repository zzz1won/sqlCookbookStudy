CREATE TABLE new_sal(
deptno int,
sal int
);

SELECT * FROM new_sal;
INSERT INTO new_sal VALUES (10, 4000);
ALTER TABLE new_sal ADD CONSTRAINT PRIMARY KEY (deptno); -- add PRIMARY KEY

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
						, A.state
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
	-- ㅎ