select * from emp;
select * from dept;
select * from salgrade;

SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, s.grade
  FROM emp e 
  JOIN dept d ON  e.deptno = d.deptno 
  JOIN salgrade s ON e.sal between s.losal and s.hisal;

CREATE VIEW v_001 AS
  SELECT empno, ename
  FROM emp;
  
  
SELECT * FROM v_001;

CREATE OR REPLACE VIEW v_emp
AS
  SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, s.grade
  FROM emp e 
  JOIN dept d ON  e.deptno = d.deptno 
  JOIN salgrade s ON e.sal between s.losal and s.hisal;
  
  
--1> 부서테이블의 모든 데이터를 출력하라.
SELECT *
FROM EMP;
 
--2> EMP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
SELECT job, empno, ename, TO_CHAR(hiredate, 'YYYY-MM-DD') 입사일 
FROM emp;

--3> EMP테이블에서 직업을 출력하되, 각 항목(ROW)가 중복되지 않게 출력하라.
SELECT DISTINCT job
FROM EMP;
 
--4> 급여가 2850 이상인 사원의 이름 및 급여를 출력하라.
SELECT ename, sal 
FROM emp
WHERE sal >= 2850;

--5> 사원번호가 7566인 사원의 이름 및 부서번호를 표시하는 출력하라.
SELECT ename, deptno
FROM emp
WHERE empno=7566;

--6> 급여가 1500이상 ~ 2850이하의 범위에 속하지 않는 모든 사원의 이름
-- 및 급여를 출력하라.
SELECT ename, sal
FROM emp
WHERE sal NOT BETWEEN 1500 AND 2850;

--7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 입사일을 출력하라. 입사일을 기준으로 해서 오름차순으로 정렬하라.
SELECT ename, JOB, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY hiredate;
 
--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를
-- 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.
SELECT ename, deptno
FROM emp
WHERE deptno IN (10, 30)
ORDER BY ename ASC;

--9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의 이름 및 급여를 출력하라.
--(단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)
SELECT ename AS 'Employee', sal AS ' Monthly Salary'
FROM emp
WHERE deptno IN(10,30) AND sal>1500;
 
--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라.
SELECT ename , job
FROM emp
WHERE mgr IS NULL;

--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 급여를 기준으로 내림차순으로 정렬하여 출력하라.
SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL
ORDER BY sal DESC;

--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.
SELECT ename
FROM emp
WHERE ename LIKE '__A%';

--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 출력하라.
SELECT ename
FROM emp
WHERE ename LIKE '%L%L%' AND deptno=30;

 
--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 
-- 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
SELECT ename, job, sal
FROM emp
WHERE job IN (UPPER('Clerk'), UPPER('Analyst'))
AND sal NOT IN(1000, 3000, 5000);



--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 
--컬럼명을 New Salary로 지정하여 출력하라.
SELECT empno, ename, sal, CAST(sal+(sal*0.15) as INTEGER) as "New Salary"
FROM emp;
--SELECT empno, ename, sal, ROUND(sal+(sal*0.15), 0) as "New Salary"
--FROM emp;

--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 
-- 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라).
SELECT empno, ename, sal, ROUND(sal+(sal*0.15), 0) as "New Salary",
 ROUND(sal+(sal*0.15), 0)-sal as "Increase"
FROM emp;

 
--18> 모든 사원의 이름(첫 글자는 
-- 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는
-- 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.
SELECT CONCAT(UPPER(SUBSTR(ename,1,1)),LOWER(SUBSTR(ename,2))) as name,
LENGTH(ename) AS "lenName"
FROM emp;
 
--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 사원의 커미션은 'no commission'으로 출력하라.
SELECT ename, NVL(TO_CHAR(comm),'no commission')
FROM emp;
 
 
--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.
SELECT e.ename, d.deptno, d.dname
FROM emp e 
LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

SELECT ename, deptno , DECODE(deptno,10,'ACCOUNTING',
                                    20,'RESEARCH',
                                    30,'SALES',
                                    40,'OPERATIONS') AS "dname"
FROM emp;


--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
SELECT e.ename, e.deptno, d.dname
FROM emp e 
JOIN dept d
ON e.deptno = d.deptno 
WHERE e.deptno = 30;

 
--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
--(단, 직업 목록이 중복되지 않게 하라.)
SELECT DISTINCT e.job, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.deptno = 30;

--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
SELECT e.ename, d.dname, d.loc
FROM emp e 
JOIN dept d
ON e.deptno = d.deptno 
WHERE e.comm IS NOT NULL;
 
 
--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.
SELECT e.ename, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename LIKE '%A%';


--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 출력하라.
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno 
WHERE d.loc = 'Dallas';

 
--26> 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되,
-- 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.
SELECT e.ename as "employee", e.empno as "emp#", e2.ename as "manager", e2.empno as "mgr#"
FROM emp e
JOIN emp e2
ON e.mgr = e2.empno;


--27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM emp e JOIN dept d
ON  e.deptno = d.deptno
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;

 
--28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
SELECT ename, hiredate
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = UPPER('Smith'));


--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일, 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을 Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 출력하라.
SELECT e.ename as "employee", e.hiredate as "emphiredate", e2.ename as "Manager", e2.hiredate as "MgrHiredate"
FROM emp e 
JOIN emp e2
ON e.mgr = e2.empno 
WHERE e.hiredate < e2.hiredate;


--30> 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 
-- 각 컬럼명을 Maximum,Minimum,Sum,Average로 지정하여 출력하라.
SELECT MAX(sal) as "Maximum", MIN(sal) as "Minimum", SUM(sal) as "Sum", AVG(sal) as "Average"
FROM emp;

--31> 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하라.
SELECT job, MAX(sal), MIN(sal), SUM(SAL), AVG(sal)
FROM emp
GROUP BY job;

 
--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
SELECT job, COUNT(job)
FROM emp
GROUP BY job;


--33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라. 그리고, 컬럼명을 Number of Manager로 지정하여 출력하라.
SELECT COUNT(DISTINCT(mgr)) AS "Number of Manager"
FROM emp;
 
--34> 최고 급여와 최저 급여의 차액을 출력하라.
SELECT MAX(sal)-MIN(sal) 
FROM emp;

--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라.
--단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 급여를 기준으로 출력 결과를 내림차순으로 정렬하라.
SELECT mgr, MIN(sal)
FROM emp
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) >= 1000
ORDER BY MIN(sal);
 
--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
-- 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.
SELECT e.deptno as "부서명", d.dname as "부서이름", d.loc as "위치", COUNT(e.empno) as "사원의 수", AVG(e.sal) as "평균급여"
FROM emp e
JOIN dept d
ON e.deptno=d.deptno
GROUP BY e.deptno, d.dname, d.loc;


--37> Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라. 단, Smith는 제외하고 출력하시오
SELECT ename, TO_CHAR(hiredate,'YYYY-MM-DD')
FROM emp
WHERE deptno IN
  (SELECT deptno
   FROM emp
   WHERE ename='SMITH')
AND ename!='SMITH';

 
--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 
--    표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라.
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;
 
 
--39> 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호 및 이름을 출력하라.
SELECT empno, ename
FROM emp
WHERE deptno IN
  (SELECT deptno
   FROM emp
   WHERE ename LIKE '%T%');
 
 
--40> 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력하라.
SELECT e.ename, e.deptno, e.job
FROM emp e 
JOIN dept d
ON e.deptno = d.deptno
AND d.loc = 'DALLAS';
 
--41> KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
SELECT ename, sal
FROM emp
WHERE mgr = 
  (SELECT empno
   FROM emp
   WHERE ename = 'KING');
 
--42> Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력하라.
SELECT e.deptno, e.ename, e.job
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
AND d.dname = 'SALES';

--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과 동일한 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
SELECT empno, ename, sal
FROM emp
WHERE sal > 
  (SELECT AVG(sal)
   FROM emp)
AND deptno IN
  (SELECT deptno
   FROM emp
   WHERE ename LIKE '%T%');

 
 
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 
-- 출력하라.
SELECT ename, deptno, sal
FROM emp
WHERE sal IN
  (SELECT sal
   FROM emp
   WHERE comm IS NOT NULL);
 

 
 
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름, 및 급여를 출력하시오
SELECT e.ename, d.dname, e.sal
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.job IN
  (SELECT e.job
   FROM emp e JOIN dept d
   ON e.deptno = d.deptno
   AND d.loc = 'DALLAS');
 
--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및 급여를 출력하시오
SELECT ename, hiredate, sal
FROM emp
WHERE sal = 
  (SELECT sal
   FROM emp
   WHERE ename = 'SCOTT')
AND NVL(comm,0) = 
  (SELECT NVL(comm,0)
   FROM emp
   WHERE ename = 'SCOTT');
 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호, 이름, 급여를 출력하되, 결과를 급여가 높은 순으로 정렬하라.
SELECT empno, ename, sal
FROM emp
WHERE sal > ALL
  (SELECT sal
   FROM emp
   WHERE job = 'CLERK') --결국 최대값과 비교 any 최소값과 비교
ORDER BY sal DESC;
 
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과 월급, 부서번호를 출력하라.
SELECT ename, sal, deptno
FROM emp
WHERE job IN
  (SELECT job
   FROM emp
   WHERE ename LIKE '%A%');
 
--49> New  York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 사원이름과 부서명을 출력하라.
 SELECT e.ename, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.sal IN
    (SELECT e.sal
     FROM emp e, dept d
     WHERE e.deptno = d.deptno
     AND d.loc = 'NEW YORK')
AND NVL(comm,0) IN
    (SELECT NVL(comm,0)
     FROM emp e, dept d
     WHERE e.deptno = d.deptno
     AND loc = 'NEW YORK');
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름, 직업,월급,부서명,커미션을 출력하되 
-- 커미션이 책정되지 않은 사원은 NoCommission으로 표시하고, 커미션의 컬럼명은 Comm으로 나오게 출력하시오. (단, 최고월급부터 출력되게 하시오)
SELECT e.empno, e.ename, e.job, e.sal, d.dname, NVL((TO_CHAR(e.comm)),'NoCommision') AS "Comm"
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE job IN
  (SELECT job
   FROM emp e, dept d
   WHERE e.deptno=  d.deptno
   AND loc = 'DALLAS')
AND mgr IN
  (SELECT mgr
   FROM emp e, dept d
   WHERE e.deptno = d.deptno AND loc = 'DALLAS');