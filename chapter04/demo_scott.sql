insert into dept
values(14,'ȫ��','2��');
insert into dept
values(20,'����','4��');
insert into dept
values(22,'����','6��');

-- (1) ����� �̸��� ������ ����Ͻÿ�.
insert into emp
values(1,'���1','ȫ��',10,'2024-04-24',10000,5000,14);
insert into emp
values(2,'���2','����',11,'2024-03-25',12000,3000,20);
insert into emp
values(3,'���3','����',12,'2024-02-11',13000,2000,22);
select ename as ����̸�,
    job as �������
from emp;

-- (2) 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����Ͻÿ�.
insert into dept
values(30,'����','5��');
insert into emp
values(4,'���4','����',15,'2023-06-21',20000,2000,30);
insert into emp
values(5,'���5','����',15,'2024-01-14',14000,2000,30);

select ename, sal
from emp 
where deptno = 30;

-- (3) �����ȣ�� �̸�, ���� �޿�, ������ �޿�(�� �̸��� '������'), 10% �λ�� �޿�
-- (�� �̸��� '�λ�� �޿�')�� �����ȣ������ ����Ͻÿ�
select
    empno,
    ename,
    sal as ����޿�,
    (sal * 1.1) - sal as ������,
    (sal * 1.1) as "�λ�� �޿�"
from emp
order by empno;

-- (4) 'S'�� �����ϴ� ��� ����� �μ���ȣ�� ����Ͻÿ�.
insert into emp
values(7,'Soft7 ','����',12,'2024-02-11',13000,2000,22);
insert into emp
values(8,'Some8','����',12,'2024-02-11',13000,2000,30);

select ename, deptno
from emp
where ename like 'S%';

-- (5) ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ����Ͻÿ�
-- �� �̸��� ���� MAX, MIN, SUM, AVG�� �Ѵ�. ��, �Ҽ��� ���ϴ� �ݿø��Ͽ� ������ ǥ��
select MAX(sal), MIN(sal), SUM(sal), ROUND(AVG(sal))
from emp;

-- (6) ���� �̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ�. 
-- �� �̸��� ���� '����'�� '������ �����'�� �Ѵ�
select 
    job as "����",
    count(*) as "������ �����"
    from emp
group by job;

-- (7) ����� �ִ� �޿��� �ּ� �޿��� ������ ����Ͻÿ�
select (MAX(sal) - MIN(sal)) as "����"
from emp;

-- (8) 30�� �μ��� ��� ���� ����� �޿��� �հ�� ����� ����Ͻÿ�
select
    count(*) as "��� ��",
    SUM(sal) as "�޿��� �հ�",
    AVG(sal) as "�޿��� ���"
from emp
where deptno = 30;

-- (9) ��� �޿��� ���� ���� �μ��� ��ȣ�� ����Ͻÿ�.
select deptno
from (
    select deptno, ROUND(AVG(sal)) as "��� �޿�"
    from emp
    group by deptno
    order by "��� �޿�" desc
    )
where rownum = 1; -- ������Ű�� �ڷῡ 1������ �ٴ� ����

-- (10) ��������� �����ϰ�, �� ������ ����� �ѱ޿��� 3,000 �̻��� �� ������ ���ؼ�,
-- ������� �� ������ ��� �޿��� ����Ͻÿ�. �� ��� �޿��� ������������ ����Ѵ�






