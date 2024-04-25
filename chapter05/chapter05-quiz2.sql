-- 마당서점 데이터베이스를 이용해 다음에 해당하는 뷰를 작성하시오
-- (1)
create view highorders(bookid,bookname,name,publisher,saleprice)
as select b.bookid,b.bookname,c.name,b.publisher,o.saleprice
from book b,orders o,customer c
where saleprice >= 20000 and c.custid = o.custid and o.bookid = b.bookid;
select * from highorders;
-- (2)
select bookname, name
from highorders;
-- (3)
create or replace view highorders
as select b.bookid,b.bookname,c.name,b.publisher
from book b,orders o,customer c
where saleprice >= 20000 and c.custid = o.custid and o.bookid = b.bookid;
select * from highorders;

-- [사원 데이터베이스] 3장의 연습문제 14번의 데이터베이스를 이용하여 다음 질의에 해당하는
-- SQL문을 작성하시오
-- (1)
select mgr from emp
where mgr is null;
-- (2)
select e.ename ,
(select dname from dept d where d.deptno = e.deptno);
-- (3)

-- (4)
select ename
from emp
where sal > (select avg(sal) from emp);

-- (5)
select ename
from emp
where sal > (select avg(sal) from emp);












