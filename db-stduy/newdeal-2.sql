create or replace procedure usp_emplist
(
   p_sal IN number,
   p_cursor OUT SYS_REFCURSOR
)
is
  BEGIN
        OPEN p_cursor
        FOR
          select empno ,ename , sal from emp where sal > p_sal;

END;

create table dmlemp
as
 select empno, ename, job
 from emp
 where 1=2;


create or replace procedure usp_insert_emp
(
   vempno IN emp.empno%TYPE,
   vename IN emp.ename%TYPE,
   vjob    IN emp.job%TYPE,
   p_outmsg OUT varchar2
)
IS
  BEGIN
      insert into dmlemp(empno, ename, job)
      values(vempno,vename,vjob);
      COMMIT;
        p_outmsg := 'SUCCESS';
        EXCEPTION WHEN OTHERS THEN
        p_outmsg := SQLERRM;
        ROLLBACK;
END; 

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);