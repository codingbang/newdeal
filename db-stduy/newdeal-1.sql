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
  
  
--1> �μ����̺��� ��� �����͸� ����϶�.
SELECT *
FROM EMP;
 
--2> EMP���̺��� �� ����� ����, �����ȣ, �̸�, �Ի����� ����϶�.
SELECT job, empno, ename, TO_CHAR(hiredate, 'YYYY-MM-DD') �Ի��� 
FROM emp;

--3> EMP���̺��� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ� ����϶�.
SELECT DISTINCT job
FROM EMP;
 
--4> �޿��� 2850 �̻��� ����� �̸� �� �޿��� ����϶�.
SELECT ename, sal 
FROM emp
WHERE sal >= 2850;

--5> �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ǥ���ϴ� ����϶�.
SELECT ename, deptno
FROM emp
WHERE empno=7566;

--6> �޿��� 1500�̻� ~ 2850������ ������ ������ �ʴ� ��� ����� �̸�
-- �� �޿��� ����϶�.
SELECT ename, sal
FROM emp
WHERE sal NOT BETWEEN 1500 AND 2850;

--7> 1981�� 2�� 20�� ~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�,���� �� �Ի����� ����϶�. �Ի����� �������� �ؼ� ������������ �����϶�.
SELECT ename, JOB, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY hiredate;
 
--8> 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ��
-- ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ����϶�.
SELECT ename, deptno
FROM emp
WHERE deptno IN (10, 30)
ORDER BY ename ASC;

--9> 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ� ����� �̸� �� �޿��� ����϶�.
--(�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)
SELECT ename AS 'Employee', sal AS ' Monthly Salary'
FROM emp
WHERE deptno IN(10,30) AND sal>1500;
 
--10> �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�.
SELECT ename , job
FROM emp
WHERE mgr IS NULL;

--11> Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, �޿��� �������� ������������ �����Ͽ� ����϶�.
SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL
ORDER BY sal DESC;

--12> �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
SELECT ename
FROM emp
WHERE ename LIKE '__A%';

--13> �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ����϶�.
SELECT ename
FROM emp
WHERE ename LIKE '%L%L%' AND deptno=30;

 
--14> ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� 
-- �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
SELECT ename, job, sal
FROM emp
WHERE job IN (UPPER('Clerk'), UPPER('Analyst'))
AND sal NOT IN(1000, 3000, 5000);



--15> �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� 
--�÷����� New Salary�� �����Ͽ� ����϶�.
SELECT empno, ename, sal, CAST(sal+(sal*0.15) as INTEGER) as "New Salary"
FROM emp;
--SELECT empno, ename, sal, ROUND(sal+(sal*0.15), 0) as "New Salary"
--FROM emp;

--16> 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� 
-- �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�).
SELECT empno, ename, sal, ROUND(sal+(sal*0.15), 0) as "New Salary",
 ROUND(sal+(sal*0.15), 0)-sal as "Increase"
FROM emp;

 
--18> ��� ����� �̸�(ù ���ڴ� 
-- �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ�
-- ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ����϶�.
SELECT CONCAT(UPPER(SUBSTR(ename,1,1)),LOWER(SUBSTR(ename,2))) as name,
LENGTH(ename) AS "lenName"
FROM emp;
 
--19> ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� ����� Ŀ�̼��� 'no commission'���� ����϶�.
SELECT ename, NVL(TO_CHAR(comm),'no commission')
FROM emp;
 
 
--20> ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.
SELECT e.ename, d.deptno, d.dname
FROM emp e 
LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

SELECT ename, deptno , DECODE(deptno,10,'ACCOUNTING',
                                    20,'RESEARCH',
                                    30,'SALES',
                                    40,'OPERATIONS') AS "dname"
FROM emp;


--21> 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ����϶�.
SELECT e.ename, e.deptno, d.dname
FROM emp e 
JOIN dept d
ON e.deptno = d.deptno 
WHERE e.deptno = 30;

 
--22> 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ����϶�.
--(��, ���� ����� �ߺ����� �ʰ� �϶�.)
SELECT DISTINCT e.job, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.deptno = 30;

--23> Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ����϶�.
SELECT e.ename, d.dname, d.loc
FROM emp e 
JOIN dept d
ON e.deptno = d.deptno 
WHERE e.comm IS NOT NULL;
 
 
--24> �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ����϶�.
SELECT e.ename, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename LIKE '%A%';


--25> Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ����϶�.
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno 
WHERE d.loc = 'Dallas';

 
--26> ����̸� �� �����ȣ, �ش� �������̸� �� ������ ��ȣ�� ����ϵ�,
-- �� �÷����� employee,emp#,manager,mgr#���� ǥ���Ͽ� ����϶�.
SELECT e.ename as "employee", e.empno as "emp#", e2.ename as "manager", e2.empno as "mgr#"
FROM emp e
JOIN emp e2
ON e.mgr = e2.empno;


--27> ��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ����϶�.
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM emp e JOIN dept d
ON  e.deptno = d.deptno
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;

 
--28> Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�.
SELECT ename, hiredate
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = UPPER('Smith'));


--29> �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���, �������� �̸�, �������� �Ի����� ����ϵ� ���� �÷����� Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� ����϶�.
SELECT e.ename as "employee", e.hiredate as "emphiredate", e2.ename as "Manager", e2.hiredate as "MgrHiredate"
FROM emp e 
JOIN emp e2
ON e.mgr = e2.empno 
WHERE e.hiredate < e2.hiredate;


--30> ��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ����ϵ� 
-- �� �÷����� Maximum,Minimum,Sum,Average�� �����Ͽ� ����϶�.
SELECT MAX(sal) as "Maximum", MIN(sal) as "Minimum", SUM(sal) as "Sum", AVG(sal) as "Average"
FROM emp;

--31> �� �������� �޿� ������.�ְ��,�Ѿ� �� ��վ��� ����϶�.
SELECT job, MAX(sal), MIN(sal), SUM(SAL), AVG(sal)
FROM emp
GROUP BY job;

 
--32> ������ ������ ��� ���� ������ ���� ����϶�.
SELECT job, COUNT(job)
FROM emp
GROUP BY job;


--33> �������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�. �׸���, �÷����� Number of Manager�� �����Ͽ� ����϶�.
SELECT COUNT(DISTINCT(mgr)) AS "Number of Manager"
FROM emp;
 
--34> �ְ� �޿��� ���� �޿��� ������ ����϶�.
SELECT MAX(sal)-MIN(sal) 
FROM emp;

--35> ������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ����϶�.
--��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ���ܽ�Ű�� �޿��� �������� ��� ����� ������������ �����϶�.
SELECT mgr, MIN(sal)
FROM emp
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) >= 1000
ORDER BY MIN(sal);
 
--36> �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�.
-- �׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�.
SELECT e.deptno as "�μ���", d.dname as "�μ��̸�", d.loc as "��ġ", COUNT(e.empno) as "����� ��", AVG(e.sal) as "��ձ޿�"
FROM emp e
JOIN dept d
ON e.deptno=d.deptno
GROUP BY e.deptno, d.dname, d.loc;


--37> Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ����϶�. ��, Smith�� �����ϰ� ����Ͻÿ�
SELECT ename, TO_CHAR(hiredate,'YYYY-MM-DD')
FROM emp
WHERE deptno IN
  (SELECT deptno
   FROM emp
   WHERE ename='SMITH')
AND ename!='SMITH';

 
--38> �ڽ��� �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ, �̸�, �޿��� 
--    ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ������������ �����϶�.
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;
 
 
--39> �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ �� �̸��� ����϶�.
SELECT empno, ename
FROM emp
WHERE deptno IN
  (SELECT deptno
   FROM emp
   WHERE ename LIKE '%T%');
 
 
--40> �μ���ġ�� Dallas�� ��� ����� �̸�,�μ���ȣ �� ������ ����϶�.
SELECT e.ename, e.deptno, e.job
FROM emp e 
JOIN dept d
ON e.deptno = d.deptno
AND d.loc = 'DALLAS';
 
--41> KING���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
SELECT ename, sal
FROM emp
WHERE mgr = 
  (SELECT empno
   FROM emp
   WHERE ename = 'KING');
 
--42> Sales �μ��� ��� ����� ���� �μ���ȣ, �̸� �� ������ ����϶�.
SELECT e.deptno, e.ename, e.job
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
AND d.dname = 'SALES';

--43> �ڽ��� �޿��� ��� �޿����� ���� �̸��� T�� ���� ����� ������ �μ��� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ����϶�.
SELECT empno, ename, sal
FROM emp
WHERE sal > 
  (SELECT AVG(sal)
   FROM emp)
AND deptno IN
  (SELECT deptno
   FROM emp
   WHERE ename LIKE '%T%');

 
 
--44> Ŀ�̼��� �޴� ����� �޿��� ��ġ�ϴ� ����� �̸�,�μ���ȣ,�޿��� 
-- ����϶�.
SELECT ename, deptno, sal
FROM emp
WHERE sal IN
  (SELECT sal
   FROM emp
   WHERE comm IS NOT NULL);
 

 
 
--45> Dallas���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�,�μ��̸�, �� �޿��� ����Ͻÿ�
SELECT e.ename, d.dname, e.sal
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.job IN
  (SELECT e.job
   FROM emp e JOIN dept d
   ON e.deptno = d.deptno
   AND d.loc = 'DALLAS');
 
--46> Scott�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸�, �Ի��� �� �޿��� ����Ͻÿ�
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
 
--47> ������ Clerk �� ����麸�� �� ���� �޿��� �޴� ����� �����ȣ, �̸�, �޿��� ����ϵ�, ����� �޿��� ���� ������ �����϶�.
SELECT empno, ename, sal
FROM emp
WHERE sal > ALL
  (SELECT sal
   FROM emp
   WHERE job = 'CLERK') --�ᱹ �ִ밪�� �� any �ּҰ��� ��
ORDER BY sal DESC;
 
--48> �̸��� A�� ���� ����� ���� ������ ���� ����� �̸��� ����, �μ���ȣ�� ����϶�.
SELECT ename, sal, deptno
FROM emp
WHERE job IN
  (SELECT job
   FROM emp
   WHERE ename LIKE '%A%');
 
--49> New  York ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� ����� ����̸��� �μ����� ����϶�.
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
 
--50> Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�, ����,����,�μ���,Ŀ�̼��� ����ϵ� 
-- Ŀ�̼��� å������ ���� ����� NoCommission���� ǥ���ϰ�, Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�. (��, �ְ���޺��� ��µǰ� �Ͻÿ�)
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