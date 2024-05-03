-- SQL문(배달어플 관련 데이터베이스)

-- (1) Delivery에 있는 customer 테이블의 값을 읽으시오.
/*
    select * from customer은 "customer" 테이블에 있는 모든 고객의 정보를 조회한다. 
    반환되는 결과는 "customer" 테이블의 모든 열과 해당 고객의 모든 행이 포함된다.
*/
select * from customer;

-- (2) Delivery에 있는 menu 테이블의 값을 읽으시오.
/*
    select * from menu는 "menu" 테이블에 있는 모든 메뉴의 정보를 조회한다. 
    반환되는 결과는 "menu" 테이블의 모든 열과 해당 메뉴의 모든 행이 포함된다.
*/
select * from menu;

-- (3) Delivery에 있는 orders 테이블의 값을 읽으시오.
/*
    select * from orders은 "orders" 테이블에 있는 모든 주문 정보를 조회한다. 
    반환되는 결과는 "orders" 테이블의 모든 열과 해당 주문들의 모든 행이 포함된다.
*/
select * from orders;

-- (4) Delivery에 있는 payment 테이블의 값을 읽으시오.
/*
    select * from paymemt는 "payment" 테이블에 있는 모든 결제 정보를 조회한다. 
    반환되는 결과는 "payment" 테이블의 모든 열과 해당 결제들의 모든 행이 포함된다.
*/
select * from payment;

-- (5) Delivery에 있는 shop 테이블의 값을 읽으시오.
/*
    select * from shop은 "shop" 테이블에 있는 모든 상점의 정보를 조회한다. 
    반환되는 결과는 "shop" 테이블의 모든 열과 해당 상점의 모든 행이 포함된다.
*/
select * from shop;

-- (6) 어플에 가입한 고객을 확인하기 위해 모든 고객의 이름과 이메일을 조회하기
/*  
    Customer 테이블에서 내가 원하는 속성의 값만 나타내기 위해 
    select name,email을 작성하였다
*/
select name,email from customer;

-- (7) 고객들이 상점에서 구매할 메뉴의 정보를 알기 위해 모든 메뉴의 이름과 가격을 조회하기
/*  
    Menu 테이블에서 내가 원하는 속성의 값만 나타내기 위해 
    select name,price을 작성하였다
*/
select name,price from menu;

-- (8) 최소주문 금액이 15000원이상이라 가정하였을 때 메뉴 1개만 시켜도 주문을 시킬수 있는
--     메뉴들만 메뉴의 번호,이름,가격을 조회하기
/*
    Menu 테이블에서 데이터를 가져온 후 메뉴의 가격이 15,000원 이상인 메뉴들을 선택한다.
    선택된 메뉴들의 메뉴ID,메뉴 이름, 가격을 나타낸다

*/
select menu_id,name,price
from menu
where price >= 15000;

-- (9) 어플 관리를 편하게 하기 위해 메뉴의 이름을 오름차순으로 나타내시오
/*
    Menu의 테이블에서 데이터를 가져오고 
    order by asc 를 이용해서 메뉴의 이름을 오름차순으로 정렬한다
*/
select menu_id,name
from menu
order by name asc;

-- (10) 결제 방법이 '카드'와 '현금'중 카드를 선택한 고객은 1000원이 할인된다.
-- 카드를 선택한 고객의 결제번호와 주문번호를 나타내시오
/*
    Payment 테이블에서 데이터를 가져온 후 paymentMethod가 
    ‘카드‘에 해당하는 데이터만 찾아서 결제번호와 주문번호, 결제방법을 나타낸다
*/
select payment_id,order_id, paymentMethod
from payment
where paymentMethod = '카드';
  
-- (11) 배달 어플 회사에서 카드로 결제한 사람과 현금으로 결제한 사람의 수를 알아보기 위해
-- 카드로 결제한 사람의 수와 현금으로 결제한 사람의 수를 나타내시오
/*
    Payment 테이블에서 데이터를 가져온 후 결제 방법을 기준으로 데이터를 그룹화한다
    그리고 각 그룹 내에서 count(*) 함수를 사용하여 각 결제 방법의 수를 계산한다
*/
select paymentMethod, count(*)
from payment
group by paymentMethod;

-- (12) 결제 금액이 20000원 이상인 고객에게 쿠폰을 지급하려고 한다.
-- 해당 되는 고객의 고객번호와 결제금액을 나타내시오
/*
    Payment 테이블에서 데이터를 가져온 후 결제 금액이 20000원 이상인 결제 정보를 선택한다
    order_id를 “고객번호”,price를 “결제금액” 이라는 새로운 이름으로 반환한다
*/
select order_id as "고객번호", price as "결제금액"
from payment
where price >= 20000;

-- (13) 고객이 자신의 주문내역을 확인할 때 보여지는 상점의 이름과 메뉴 이름을
-- 조인문을 이용해서 나타내시오. (고객은 고객7로 설정)
/*
    order 테이블에서 테이터를 가져온다. order테이블을 shop테이블과 menu테이블에 조인한다. 
    "shop" 테이블과는 "orders" 테이블의 "shop_id" 열과 "shop" 테이블의 "shop_id" 열을 조인합니다.
    "menu" 테이블과는 "orders" 테이블의 "menu_id" 열과 "menu" 테이블의 "menu_id" 열을 조인합니다. 
    주문한 사용자의 ID가 7인 주문 정보만 선택한다
*/
select shop.name as "상점이름", menu.name as "메뉴이름"
from orders
join shop on orders.shop_id = shop.shop_id
join menu on orders.menu_id = menu.menu_id
where orders.user_id = 7;

-- (14) 하루 동안 각 상점이 판매한 주문 금액의 평균을 확인하기 위해
-- 각 상점의 번호와 평균 주문 금액을 나타내시오
/*
    order 테이블에서 테이터를 가져온다. 상점 ID를 기준으로 데이터를 그룹화한다
    각 그룹 내에서 주문 금액의 평균을 계산한다. 결과를 상점 ID의 오름차순으로 정렬한다
*/
select shop_id, avg(price) as "평균 주문 금액"
from orders
group by shop_id
order by shop_id asc;

-- (15) 배달 회사에서 가장 주문 금액이 많은 시간대를 알아보기 위해 시간대 별로
-- 주문의 수를 나타내시오
/*
    order 테이블에서 테이터를 가져온다. 주문 시간에서 시간 부분만 추출하여 그룹화한다
    SUBSTR함수를 사용하여 주문 시간의 첫 두 자리를 추출한다. 
    각 그룹의 주문 금액의 합계를 계산한다. 결과를 주문 시간의 시간 단위 오름차순으로 정렬한다
*/
select substr(order_time,1,2) as "hour", sum(price) as "price"
from orders
group by substr(order_time,1,2)
order by substr(order_time,1,2);

-- (16) 하루 동안 가장 많이 팔린 메뉴를 알아보기 위해
-- 메뉴번호와 메뉴 수량을 나타내시오
/*
    order 테이블에서 테이터를 가져온다. 메뉴 ID를 기준으로 데이터를 그룹화한다
    각 그룹 내에서 주문 수량의 합계를 계산한다
*/
select menu_id, sum(quantity) as total_quantity
from orders
group by menu_id; 

-- (17) 고객이 배달 어플에 가입한 아이디와 비밀번호를 기억하지 못해
-- 찾기 위해서 인증을 필요로 할때 이메일과 전화번호를 입력해야 한다
-- 이때 고객이 입력한 데이터와 배달 어플에 저장된 데이터가 같은지 확인하기 위해
-- 배달 어플에 저장된 각 고객의 이메일과 전화번로를 나타내시오
/*
    customer 테이블에서 테이터를 가져온다. 필요한 email,phoneNumber 속성만 찾는다
*/
select email,phoneNumber
from customer;

-- (18) 각 고객이 주문한 메뉴 중에서 평균 가격보다 높은 가격의 메뉴만 조회해서 나타내시오
/*
    주문 정보를 가져오고, 해당 주문에 대한 고객정보와 메뉴 정보를 결합한다
    메뉴별 평균 가격을 계산하기 위해 메뉴 테이블을 기준으로 서브쿼리를 실행한다. 
    전체 메뉴 중 평균 가격이 높은 메뉴들의 ID를 찾기 위해 주문 테이블을 
    기준으로 메뉴를 그룹화하고, 평균 가격이 평균 가격보다 높은 메뉴의 ID를 반환한다. 
*/
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

-- (19) 고객1은 동삼동에 거주한다. 동삼동에 위치한 상점의 이름과 번호를 나타내시오.
/*
    shop 테이블에서 테이터를 가져온다. 상점에 위치에서 ‘동삼동’이 포함된 행만 선택한다
    이를 위해 like 연산자와 ‘%’를 사용하여 부분 문자열 매칭을 수행한다 .
*/
select name, shopNumber
from shop
where location like '%동삼동%';

-- (20) 각 고객의 가장 최근 주문 기록을 확인하기 위하여 고객이 마지막으로 주문한
-- 주문의 주문 번호와 주문 시간을 나타내시오
/*
    order테이블에서 데이터를 가져오고  사용자 ID,주문번호,주문 시간 열을 선택한다
    “orders”테이블을 기준으로 사용자별로 최대 주문 시간을 찾는다. 
    사용자 ID를 그룹화하고, 각 사용자별로 가장 최근 주문 시간을 찾는다
    메인 쿼리에서 선택한 주문 정보 중에서, 사용자 ID와
    주문 시간이 부속질의에서 찾은 것과 일치하는 행만 선택한다
*/
select user_id,order_id,order_time
from orders
where (user_id, order_time) in (
    select user_id, max(order_time) 
    from orders
    group by user_id
);  











