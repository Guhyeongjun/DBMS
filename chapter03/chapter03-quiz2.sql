select *
from orders;

select * 
from book;

select *
from customer;

-- (3) �������� �ѱ��ž�
select sum(saleprice)
from orders,customer
where orders.custid = 1 and customer.custid = 1;

-- (4) �������� ������ ������ ��
select count(*)
from orders
where orders.custid = 1;

-- (5) �������� ������ ������ ���ǻ� ��
select count(distinct publisher)
from orders,book
where orders.custid = 1 and orders.bookid = book.bookid;

-- (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, price, book.price - orders.saleprice
from book, orders
where orders.custid = 1 and book.bookid = orders.bookid;

-- (7) �������� �������� ���� ������ �̸�
select bookname
from orders, book
where orders.custid != 1 and orders.bookid = book.bookid;

-- (10) ���� �̸��� ���� ���ž�
select name,sum(saleprice)
from customer,orders
where customer.custid = orders.custid
group by customer.name
order by customer.name;

-- (11) ���� �̸��� ���� ������ ���� ���
select name, bookname
from customer,orders, book
where customer.custid = orders.custid and orders.bookid = book.bookid
order by customer.name;

-- (12) ������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ� 
select *
from book b, orders o
where b.bookid = o.bookid
and price - saleprice = (
    select max(price-saleprice)
    from book b, orders o
    where b.bookid = o.bookid
    );
    
-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
--select name, avg(saleprice)
--from customer c, orders o
--where c.custid = o.custid
--group by name
--having by(saleprice) > (
--    select avg(saleprice)
--    from orders
--    );

-- �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select name
from customer c, orders o, book b
where c.custid = o.custid
and o.bookid = b.bookid
and name not like '������'
and publisher in ( -- �������� ������ ������ ���ǻ�
    select b.publisher
    from customer c, orders o, book b
    where c.custid = o.custid
    and o.bookid = b.bookid
    and name like '������'
    )
    ;
    
-- �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select c.name,count(b.publisher)
from customer c, orders o, book b
where c.custid = o.custid
and b.bookid = o.bookid
group by name
having count(distinct b.publisher) >= 2;

-- ��ü ���� 30% �̻��� ������ ����


























