-- SQL문(배달어플 관련 데이터베이스)

-- (1) Delivery에 있는 customer,menu,orders,payment,shop 테이블의 값을 읽으시오.
select * from customer;
select * from menu;
select * from orders;
select * from payment;
select * from shop;

-- (2) 어플에 가입한 고객을 확인하기 위해 모든 고객의 이름과 이메일을 조회하기
select name,email from customer;

-- (3) 고객들이 상점에서 구매할 메뉴의 정보를 알기 위해 모든 메뉴의 이름과 가격을 조회하기
select name,price from menu;

-- (4) 최소주문 금액이 15000원이상이라 가정하였을 때 메뉴 1개만 시켜도 주문을 시킬수 있는
--     메뉴들만 메뉴의 번호,이름,가격을 조회하기
select menu_id,name,price
from menu
where price >= 15000;

-- (5) 어플 관리를 편하게 하기 위해 메뉴의 이름을 오름차순으로 나타내시오
select menu_id,name
from menu
order by name asc;

-- (6) 결제 방법이 '카드'와 '현금'중 카드를 선택한 고객은 1000원이 할인된다.
-- 카드를 선택한 고객의 결제번호와 주문번호를 나타내시오
select payment_id,order_id, paymentMethod
from payment
where paymentMethod = '카드';
  
-- (7) 배달 어플 회사에서 카드로 결제한 사람과 현금으로 결제한 사람의 수를 알아보기 위해
-- 카드로 결제한 사람의 수와 현금으로 결제한 사람의 수를 나타내시오
select paymentMethod, count(*)
from payment
group by paymentMethod;

-- (8) 결제 금액이 20000원 이상인 고객에게 쿠폰을 지급하려고 한다.
-- 해당 되는 고객의 고객번호와 결제금액을 나타내시오
select order_id as "고객번호", price as "결제금액"
from payment
where price >= 20000;

-- (9) 고객이 자신의 주문내역을 확인할 때 보여지는 상점의 이름과 메뉴 이름을
-- 조인문을 이용해서 나타내시오. (고객은 고객7로 설정)
select shop.name, menu.name
from orders
join shop on orders.shop_id = shop.shop_id
join menu on orders.menu_id = menu.menu_id
where orders.user_id = 7;

-- (10) 하루 동안 각 상점이 판매한 주문 금액의 평균을 확인하기 위해
-- 각 상점의 번호와 평균 주문 금액을 나타내시오
select shop_id, avg(price) as "평균 주문 금액"
from orders
group by shop_id
order by shop_id asc;

-- (11) 배달 회사에서 가장 주문이 금액이 많은 시간대를 알아보기 위해 시간대 별로
-- 주문의 수를 나타내시오
select substr(order_time,1,2) as "hour", sum(price) as "price"
from orders
group by substr(order_time,1,2)
order by substr(order_time,1,2);

-- (12) 하루 동안 가장 많이 팔린 메뉴를 알아보기 위해
-- 메뉴번호와 메뉴 수량을 나타내시오
select menu_id, sum(quantity) as total_quantity
from orders
group by menu_id; 

-- (13) 고객이 배달 어플에 가입한 아이디와 비밀번호를 기억하지 못해
-- 찾기 위해서 인증을 필요로 할때 이메일과 전화번호를 입력해야 한다
-- 이때 고객이 입력한 데이터와 배달 어플에 저장된 데이터가 같은지 확인하기 위해
-- 배달 어플에 저장된 각 고객의 이메일과 전화번로를 나타내시오
select email,phoneNumber
from customer;

-- (14) 각 고객이 주문한 메뉴 중에서 평균 가격보다 높은 가격의 메뉴만 조회해서 나타내시오
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












