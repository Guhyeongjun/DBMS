select *
from customer;
select *
from orders;
select *
from book;
-- (1) ������ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid = 1;
-- (2) ������ 20,000�� �̻��� ������ �̸�
select bookname,price
from book
where price >= 20000;
-- (3) �������� �ѱ��ž�
select sum(saleprice) as "�������� �ѱ��ž�"
from orders
where custid = 1;
-- (4) �������� ������ ������ ��
select count(*) as "�������� ������ ������ ��"
from orders
where custid = 1;
-- (5) �������� ������ ������ ���ǻ� ��
select count(distinct publisher) as "�������� ������ ������ ���ǻ� ��"
from book
where bookid <= 3;
-- (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname as "������ �̸�",
    price as ����,
    1000 as "������ �ǸŰ����� ����"
from book
where bookid <= 3;

-- (1) ���缭�� ������ �Ѽ�
select count(*) as "������ �Ѽ�"
from book;
-- (2) ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�
select count(distinct publisher) as "���ǻ��� �Ѽ�"
from book;
-- (3) ��� ���� �̸�, �ּ�
select name as �̸�,
    address as �ּ�
from customer;
-- (4) 2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select orderid as "������ �ֹ���ȣ",
    orderdate as "�ֹ� ��¥"
from orders
where orderid >= 4 and orderid <= 7;
-- (5) 2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select orderid as "������ �ֹ���ȣ",
    orderdate as "�ֹ� ��¥"
from orders
where orderid < 4 or orderid > 7;
-- (6) ���� '��'���� ���� �̸��� �ּ�
select name as �̸�,
    address as �ּ�
from customer
where name like '��%';
-- (6) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name as �̸�,
    address as �ּ�
from customer
where name like '��_��%' 
    














