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

-- (5) ���� ������ ���ϰ� �ϱ� ���� �޴��� �̸��� ������������ ��Ÿ���ÿ�
select menu_id,name
from menu
order by name asc;

-- (6) ���� ����� 'ī��'�� '����'�� ī�带 ������ ���� 1000���� ���εȴ�.
-- ī�带 ������ ���� ������ȣ�� �ֹ���ȣ�� ��Ÿ���ÿ�
select payment_id,order_id, paymentMethod
from payment
where paymentMethod = 'ī��';
  
-- (7) ��� ���� ȸ�翡�� ī��� ������ ����� �������� ������ ����� ���� �˾ƺ��� ����
-- ī��� ������ ����� ���� �������� ������ ����� ���� ��Ÿ���ÿ�
select paymentMethod, count(*)
from payment
group by paymentMethod;

-- (8) ���� �ݾ��� 20000�� �̻��� ������ ������ �����Ϸ��� �Ѵ�.
-- �ش� �Ǵ� ���� ����ȣ�� �����ݾ��� ��Ÿ���ÿ�
select order_id as "����ȣ", price as "�����ݾ�"
from payment
where price >= 20000;

-- (9) ���� �ڽ��� �ֹ������� Ȯ���� �� �������� ������ �̸��� �޴� �̸���
-- ���ι��� �̿��ؼ� ��Ÿ���ÿ�. (���� ��7�� ����)
select shop.name, menu.name
from orders
join shop on orders.shop_id = shop.shop_id
join menu on orders.menu_id = menu.menu_id
where orders.user_id = 7;

-- (10) �Ϸ� ���� �� ������ �Ǹ��� �ֹ� �ݾ��� ����� Ȯ���ϱ� ����
-- �� ������ ��ȣ�� ��� �ֹ� �ݾ��� ��Ÿ���ÿ�
select shop_id, avg(price) as "��� �ֹ� �ݾ�"
from orders
group by shop_id
order by shop_id asc;

-- (11) ��� ȸ�翡�� ���� �ֹ��� �ݾ��� ���� �ð��븦 �˾ƺ��� ���� �ð��� ����
-- �ֹ��� ���� ��Ÿ���ÿ�
select substr(order_time,1,2) as "hour", sum(price) as "price"
from orders
group by substr(order_time,1,2)
order by substr(order_time,1,2);

-- (12) �Ϸ� ���� ���� ���� �ȸ� �޴��� �˾ƺ��� ����
-- �޴���ȣ�� �޴� ������ ��Ÿ���ÿ�
select menu_id, sum(quantity) as total_quantity
from orders
group by menu_id; 

-- (13) ���� ��� ���ÿ� ������ ���̵�� ��й�ȣ�� ������� ����
-- ã�� ���ؼ� ������ �ʿ�� �Ҷ� �̸��ϰ� ��ȭ��ȣ�� �Է��ؾ� �Ѵ�
-- �̶� ���� �Է��� �����Ϳ� ��� ���ÿ� ����� �����Ͱ� ������ Ȯ���ϱ� ����
-- ��� ���ÿ� ����� �� ���� �̸��ϰ� ��ȭ���θ� ��Ÿ���ÿ�
select email,phoneNumber
from customer;

-- (14) �� ���� �ֹ��� �޴� �߿��� ��� ���ݺ��� ���� ������ �޴��� ��ȸ�ؼ� ��Ÿ���ÿ�
select c.name as customer_name, o.menu_id, m.name as menu_name, m.price
from orders o
join customer c on o.user_id = c.user_id
join menu m on o.menu_id = m.menu_id
where o.menu_id in (
    select menu_id
    from orders
    group by menu_id
    having avg(price) > (
        select avg(price)
        from menu
    )
);

-- (15) 












