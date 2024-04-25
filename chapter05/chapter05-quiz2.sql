-- ���缭�� �����ͺ��̽��� �̿��� ������ �ش��ϴ� �並 �ۼ��Ͻÿ�
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

-- [��� �����ͺ��̽�] 3���� �������� 14���� �����ͺ��̽��� �̿��Ͽ� ���� ���ǿ� �ش��ϴ�
-- SQL���� �ۼ��Ͻÿ�
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












