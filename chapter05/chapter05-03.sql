-- in, not in
-- in�� �� ������ �Ӽ����� �μ����ǿ��� ������ ��� ���տ� �ִ��� Ȯ���ϴ� ������ �Ѵ�
-- in �����ڿ��� ��� ������ �μ����Ǵ� �����
-- ���� ��, ���� ���� ��ȯ�� �� �ִ�
-- where ���� ���Ǵ� �Ӽ����� �μ������� ��� ���հ�
-- ���� �ϳ��� ������ ���� �ȴ�
-- not in �����ڴ� ���� �������� ������ ���� �ȴ�

-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�
select sum(saleprice) from orders
where custid in(
select custid from customer where address like '%���ѹα�%');

-- all, some(any)
-- all, some(any) �����ڴ� �� �����ڿ� �Բ� ���ȴ�
-- all�� ���, some�� ���(�ּ��� �ϳ���)�̶�� �ǹ̸� ������
-- any�� some�� ������ ����� �Ѵ�
-- ���� ����
-- ���̸� (�� ������)(all|some(any)(�μ�����)

-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ���
-- �ֹ� ��ȣ�� �ݾ��� ���̽ÿ�.
select orderid, saleprice from orders
where saleprice > all (select saleprice from orders where custid = 3);

-- exists, not exists
-- ���� ������, �������� ���� ���θ� Ȯ���Ѵ�
-- �� ���ǿ��� �μ����Ƿ� ������ �Ӽ��� ���� ������
-- �μ������� ������ �����Ͽ� ���� �����ϸ� ���� �ǰ�
-- �� ���Ǵ� �ش� ���� �����͸� ����Ѵ�
-- not exist�� ��� �̿� �ݴ�� �����Ѵ�
-- ���� ����
-- where (not) exists (�μ�����)
-- exists �����ڴ� ���ʿ� ���� ������� �ʴ´�
-- �ݵ�� �μ����ǿ� �� ������ �� �̸��� �����Ǿ�� �Ѵ�

-- exists �����ڸ� ����Ͽ� '���ѹα�'�� �����ϴ�
-- ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�
select sum(saleprice) from orders o
where exists (select * from customer c where address like '%���ѹα�%'
    and c.custid = o.custid);
    
-- ��Į�� �μ����� - select �μ� ����
-- ��Į�� �μ����Ǵ� select������ ���Ǵ� �μ����Ƿ�
-- �μ������� ������� ���� ��, ���� ���� ������ ��ȯ�Ѵ�
-- ��Į�� : �ϳ��� ���ڷθ� ǥ�õǴ� ��

-- ���缭���� ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���)
select (select name from customer c where c.custid = o.custid)
from orders o;

select (select name from customer c where c.custid = o.custid), sum(saleprice) 
from orders o
group by custid;

-- ��Į�� �μ����Ǵ� select���� �Բ� update�������� ����� �� �ִ�
-- orders ���̺� ���ο� �Ӽ��� ���� �̸��� �߰�
alter table orders add bookname varchar2(40);
select * from orders;

-- ��� ������ ���Ͽ� �����̸��� �����ؾ� �Ѵ�
update orders set bookname = '�ǰ� ����' where bookid = 1;
-- �̷��� ������ ��� ������ ���Ͽ� ������ ó���ؾ� �ϹǷ� ��ȿ�����̴�
-- ��Į�� �μ����Ǹ� ����ϸ� �����̸��� �ϰ� ������ �� �ִ�

-- orders ���̺� �� �ֹ��� �´� �����̸��� �Է��Ͻÿ�
update orders set bookname=(
    select bookname
    from book
    where book.bookid = orders.bookid);
select * from orders;

-- �ζ��� �� - from �μ�����
-- ��� ���� ���̺�κ��� �Ͻ������� ������� ������ ���̺��� ���Ѵ�

-- ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�(�� �̸��� ���� �Ǹž� ���)
select c.name,sum(o.saleprice)
from (select custid, name
    from customer where custid <= 2) c,
    orders o
where c.custid = o.custid
group by c.name;
-- customer ���̺��� �ʿ��� �����͸� �̾� ���ν�ų �� �����Ƿ�
-- ó�� ������ ���� �� �ִ�



















