-- SQL��(��޾��� ���� �����ͺ��̽�)

-- (1) Delivery�� �ִ� customer,menu,orders,payment,shop ���̺��� ���� �����ÿ�.
select * from customer;
select * from menu;
select * from orders;
select * from payment;
select * from shop;

-- (2) ���ÿ� ������ ���� Ȯ���ϱ� ���� ��� ���� �̸��� �̸����� ��ȸ�ϱ�
select name,email from customer;

-- (3) ������ �������� ������ �޴��� ������ �˱� ���� ��� �޴��� �̸��� ������ ��ȸ�ϱ�
select name,price from menu;

-- (4) �ּ��ֹ� �ݾ��� 15000���̻��̶� �����Ͽ��� �� �޴� 1���� ���ѵ� �ֹ��� ��ų�� �ִ�
--     �޴��鸸 �޴��� ��ȣ,�̸�,������ ��ȸ�ϱ�
select menu_id,name,price
from menu
where price >= 15000;

-- (5) ���� ������ ���ϰ� �ϱ� ���� ������ �̸��� ������������ ��Ÿ���ÿ�
select menu_id,name
from menu
order by name asc;

















