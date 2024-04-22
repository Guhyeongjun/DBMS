-- �μ�����
-- sql�� ���� �� �ٸ� sql���� �ۼ� �Ѵ�
-- ��) ������ ���� ��� ������ �̸��� ���ΰ�?

-- ���� ��� ���� ���ϱ�
select max(price)
from book;
-- ���� ��� �������� ������ �̸� ���ϱ�
select bookname
from book
where price = 35000;
-- ���� ��� ������ �̸��� ���̽ÿ� (�μ����� ���)
select bookname
from book
where price = (select max(price) from book);

-- ��ȣ�� ��� sql���� ��ø��Ű�� ���� �μ�����(subquery)
-- �μ����Ǵ� ���ǰ� ��ø�Ǿ� �ִٴ� �ǹ̿��� ��ø���Ƕ�� �Ѵ�
-- �μ������� ���� ������ where���� �μ����Ǹ� ���� ó���ϰ� ��ü���Ǹ� ó���Ѵ�

-- �μ����Ǵ� sql���̴�
-- sql���� ����� ���̺�
-- ���̺��� ����� �� ���� �� �ϳ��� �ȴ�
-- ������-���Ͽ�(1X), ������-������(nx1),������-������(1xn),������-������(nxn)

-- �μ������� ����� ������-���Ͽ��� ���� ���� ���� ��ȯ�ϸ�
-- �տ��� ��� inŰ���带 ����Ѵ�

-- ��) ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
-- ������ ���������� �ִ� �� ��ȸ
select custid
from orders;

select name
from customer
where custid in (1,2,3,4);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select name
from customer
where custid in (select cusid
                    from orders);
                    
-- �� �� �̻��� ��ø�� �μ����ǵ� �����ϴ�

-- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
select name
from customer
where custid in (select custid
                    from orders
                    where bookid in(select bookid
                                    from book
                                    where publisher = '���ѹ̵��'));
-- ���� ������ ���� �μ����Ǹ� ���� �����ϰ� �� ����� �̿��Ͽ�
-- ���� �μ����Ǹ� �����Ѵ�

-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�
select b1.bookname
from book b1
where b1.price >(select avg(b2.price)
                    from book b2
                    where b2.publisher = b1.publisher);
                    
-- ���̺��� ��Ī�� �� �� �ִ�











