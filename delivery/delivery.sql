-- customer(고객) 테이블 생성
create table customer(
    user_id number primary key, -- 고객번호(PK)
    name varchar2(20), -- 고객이름
    email varchar2(50), -- 고객이메일
    phoneNumber varchar2(50) -- 고객 전화번호
);
-- shop(상점) 테이블 생성
create table shop(
    shop_id number primary key, -- 상점번호(PK)
    name varchar2(50), -- 상점이름
    location varchar2(100), -- 상점위치
    shopNumber varchar2(50) -- 상점 전화번호
);
-- orders(주문) 테이블 생성
create table orders(
    order_id number primary key, -- 주문번호(PK)
    user_id number, -- 고객번호(FK)
    shop_id number, -- 상점번호(FK) 
    menu_id number, -- 메뉴번호(FK)
    quantity number, -- 수량
    price number, -- 총가격
    order_time varchar2(50), -- 주문시간
    foreign key(user_id) references customer(user_id),
    foreign key(shop_id) references shop(shop_id),
    foreign key(menu_id) references menu(menu_id)
);
-- payment(결제) 테이블 생성
create table payment(
    payment_id number primary key, -- 결제번호(PK)
    order_id number, -- 주문번호(FK)
    paymentMethod varchar2(20), -- 결제방법(카드 : 1000원할인)
    price number, -- 결제금액
    foreign key(order_id) references orders(order_id)
);
-- menu(메뉴) 테이블 생성
create table menu(
    menu_id number primary key, -- 메뉴번호(PK)
    name varchar2(50), -- 메뉴이름
    description varchar2(200), -- 메뉴설명
    price number -- 메뉴가격
);

-- menu 테이블에 shop_id 외래키 추가
alter table menu add shop_id number;
alter table menu add foreign key(shop_id) references shop(shop_id);

-- customer(고객) 테이블 속성 추가
insert into customer values (1,'고객1','customer1@naver.com','010-0001-0001');
insert into customer values (2,'고객2','customer2@naver.com','010-0002-0002');
insert into customer values (3,'고객3','customer3@naver.com','010-0003-0003');
insert into customer values (4,'고객4','customer4@naver.com','010-0004-0004');
insert into customer values (5,'고객5','customer5@naver.com','010-0005-0005');
insert into customer values (6,'고객6','customer6@naver.com','010-0006-0006');
insert into customer values (7,'고객7','customer7@naver.com','010-0007-0007');
insert into customer values (8,'고객8','customer8@naver.com','010-0008-0008');

-- shop(상점) 테이블 속성 추가
insert into shop values (10,'족발의 장인','대교동1가 80 1층','050-6941-7362');
insert into shop values (11,'내가닭도리탕이다','남항동1가 169-22','050-88196-8363');
insert into shop values (12,'점보수제돈까스','중앙동3가 14-10 1층','050-36214-7645');
insert into shop values (13,'7번가피자','태종로386','050-7779-9191');
insert into shop values (14,'유가네닭갈비','동삼동 231-19 1층','050-7780-8169');
insert into shop values (15,'모두의곱창','동삼동 510-2 2층','050-7997-4197');
insert into shop values (16,'파스타도 식사다','청학동 85 3층','050-4831-1062');
insert into shop values (17,'BBQ치킨','동삼동 354-1','050-36228-2754');
insert into shop values (18,'홍콩반점0410','영선동1가 21-5','050-6831-0493');
insert into shop values (19,'고봉민김밥','동삼동 510-15 1층','050-4933-8026');
insert into shop values (20,'모티브커피','청학동 99-339','050-4822-6686');

-- menu(메뉴) 테이블 속성 추가
insert into menu values(101,'산삼족발','매일매일 직접 삶는 수제 족발',30000,10);
insert into menu values(111,'한우곱도리탕','닭도리탕+한우곱대창',22900,11);
insert into menu values(121,'수제돈까스','생등심으로 갓 튀켜냄',8500,12);
insert into menu values(131,'슈퍼콤비네이션','가지각색의 재료가 토핑',26900,13);
insert into menu values(141,'유가네 닭갈비','1인분씩 포장가능',20000,14);
insert into menu values(151,'직화야채곱창볶음','100% 국내산 곱창',22000,15);
insert into menu values(161,'투움바 파스타','찐찐한 크림에 매콤함을 더하다',11900,16);
insert into menu values(171,'황금올리브치킨','부위 선택 가능',20000,17);
insert into menu values(181,'짜장면','중식특유의 불향이 가득함',7000,18);
insert into menu values(191,'돈가스김밥','고봉민의 시그니처 메뉴',4800,19);
insert into menu values(201,'바닐라빈라떼','마다가스카르산 최상급 바닐라빈',5000,20);

-- orders(주문) 테이블 속성 추가
insert into orders values(1000,1,12,121,2,17000,'14:05');
insert into orders values(1001,3,17,171,1,20000,'14:07');
insert into orders values(1002,8,14,141,3,60000,'14:10');
insert into orders values(1003,8,20,201,3,15000,'14:11');
insert into orders values(1004,2,10,101,1,30000,'14:11');
insert into orders values(1005,5,16,161,2,23800,'14:22');
insert into orders values(1006,7,11,111,1,22900,'15:09');
insert into orders values(1007,4,18,181,3,21000,'16:10');
insert into orders values(1008,6,15,151,1,22000,'16:55');
insert into orders values(1009,2,20,201,1,5000,'18:12');
insert into orders values(1010,1,19,191,3,14400,'18:35');
insert into orders values(1011,1,13,131,1,26900,'19:01');
insert into orders values(1012,3,10,101,2,60000,'20:35');
insert into orders values(1013,5,12,121,1,8500,'21:06');
insert into orders values(1014,7,20,201,3,15000,'22:43');
insert into orders values(1015,6,17,171,2,40000,'23:14');
insert into orders values(1016,8,20,201,5,25000,'23:35');

-- payment(결제) 테이블 속성 추가
insert into payment values(1,1000,'카드',16000);
insert into payment values(2,1001,'현금',20000);
insert into payment values(3,1002,'카드',59000);
insert into payment values(4,1003,'현금',15000);
insert into payment values(5,1004,'카드',29000);
insert into payment values(6,1005,'카드',22800);
insert into payment values(7,1006,'카드',21900);
insert into payment values(8,1007,'카드',20000);
insert into payment values(9,1008,'현금',22000);
insert into payment values(10,1009,'현금',5000);
insert into payment values(11,1010,'카드',13400);
insert into payment values(12,1011,'카드',25900);
insert into payment values(13,1012,'카드',59000);
insert into payment values(14,1013,'카드',7500);
insert into payment values(15,1014,'현금',15000);
insert into payment values(16,1015,'카드',39000);
insert into payment values(17,1016,'카드',24000);












