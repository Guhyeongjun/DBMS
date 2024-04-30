-- customer(��) ���̺� ����
create table customer(
    user_id number primary key, -- ����ȣ(PK)
    name varchar2(20), -- ���̸�
    email varchar2(50), -- ���̸���
    phoneNumber varchar2(50) -- �� ��ȭ��ȣ
);
-- shop(����) ���̺� ����
create table shop(
    shop_id number primary key, -- ������ȣ(PK)
    name varchar2(50), -- �����̸�
    location varchar2(100), -- ������ġ
    shopNumber varchar2(50) -- ���� ��ȭ��ȣ
);
-- orders(�ֹ�) ���̺� ����
create table orders(
    order_id number primary key, -- �ֹ���ȣ(PK)
    user_id number, -- ����ȣ(FK)
    shop_id number, -- ������ȣ(FK) 
    menu_id number, -- �޴���ȣ(FK)
    quantity number, -- ����
    price number, -- �Ѱ���
    order_time varchar2(50), -- �ֹ��ð�
    foreign key(user_id) references customer(user_id),
    foreign key(shop_id) references shop(shop_id),
    foreign key(menu_id) references menu(menu_id)
);
-- payment(����) ���̺� ����
create table payment(
    payment_id number primary key, -- ������ȣ(PK)
    order_id number, -- �ֹ���ȣ(FK)
    paymentMethod varchar2(20), -- �������(ī�� : 1000������)
    price number, -- �����ݾ�
    foreign key(order_id) references orders(order_id)
);
-- menu(�޴�) ���̺� ����
create table menu(
    menu_id number primary key, -- �޴���ȣ(PK)
    name varchar2(50), -- �޴��̸�
    description varchar2(200), -- �޴�����
    price number -- �޴�����
);

-- menu ���̺� shop_id �ܷ�Ű �߰�
alter table menu add shop_id number;
alter table menu add foreign key(shop_id) references shop(shop_id);

-- customer(��) ���̺� �Ӽ� �߰�
insert into customer values (1,'��1','customer1@naver.com','010-0001-0001');
insert into customer values (2,'��2','customer2@naver.com','010-0002-0002');
insert into customer values (3,'��3','customer3@naver.com','010-0003-0003');
insert into customer values (4,'��4','customer4@naver.com','010-0004-0004');
insert into customer values (5,'��5','customer5@naver.com','010-0005-0005');
insert into customer values (6,'��6','customer6@naver.com','010-0006-0006');
insert into customer values (7,'��7','customer7@naver.com','010-0007-0007');
insert into customer values (8,'��8','customer8@naver.com','010-0008-0008');

-- shop(����) ���̺� �Ӽ� �߰�
insert into shop values (10,'������ ����','�뱳��1�� 80 1��','050-6941-7362');
insert into shop values (11,'�����ߵ������̴�','���׵�1�� 169-22','050-88196-8363');
insert into shop values (12,'�����������','�߾ӵ�3�� 14-10 1��','050-36214-7645');
insert into shop values (13,'7��������','������386','050-7779-9191');
insert into shop values (14,'�����״߰���','���ﵿ 231-19 1��','050-7780-8169');
insert into shop values (15,'����ǰ�â','���ﵿ 510-2 2��','050-7997-4197');
insert into shop values (16,'�Ľ�Ÿ�� �Ļ��','û�е� 85 3��','050-4831-1062');
insert into shop values (17,'BBQġŲ','���ﵿ 354-1','050-36228-2754');
insert into shop values (18,'ȫ�����0410','������1�� 21-5','050-6831-0493');
insert into shop values (19,'����α��','���ﵿ 510-15 1��','050-4933-8026');
insert into shop values (20,'��Ƽ��Ŀ��','û�е� 99-339','050-4822-6686');

-- menu(�޴�) ���̺� �Ӽ� �߰�
insert into menu values(101,'�������','���ϸ��� ���� ��� ���� ����',30000,10);
insert into menu values(111,'�ѿ��������','�ߵ�����+�ѿ����â',22900,11);
insert into menu values(121,'�������','��������� �� Ƣ�ѳ�',8500,12);
insert into menu values(131,'�����޺���̼�','���������� ��ᰡ ����',26900,13);
insert into menu values(141,'������ �߰���','1�κо� ���尡��',20000,14);
insert into menu values(151,'��ȭ��ä��â����','100% ������ ��â',22000,15);
insert into menu values(161,'����� �Ľ�Ÿ','������ ũ���� �������� ���ϴ�',11900,16);
insert into menu values(171,'Ȳ�ݿø���ġŲ','���� ���� ����',20000,17);
insert into menu values(181,'¥���','�߽�Ư���� ������ ������',7000,18);
insert into menu values(191,'���������','������� �ñ״�ó �޴�',4800,19);
insert into menu values(201,'�ٴҶ���','���ٰ���ī���� �ֻ�� �ٴҶ��',5000,20);

-- orders(�ֹ�) ���̺� �Ӽ� �߰�
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

-- payment(����) ���̺� �Ӽ� �߰�
insert into payment values(1,1000,'ī��',16000);
insert into payment values(2,1001,'����',20000);
insert into payment values(3,1002,'ī��',59000);
insert into payment values(4,1003,'����',15000);
insert into payment values(5,1004,'ī��',29000);
insert into payment values(6,1005,'ī��',22800);
insert into payment values(7,1006,'ī��',21900);
insert into payment values(8,1007,'ī��',20000);
insert into payment values(9,1008,'����',22000);
insert into payment values(10,1009,'����',5000);
insert into payment values(11,1010,'ī��',13400);
insert into payment values(12,1011,'ī��',25900);
insert into payment values(13,1012,'ī��',59000);
insert into payment values(14,1013,'ī��',7500);
insert into payment values(15,1014,'����',15000);
insert into payment values(16,1015,'ī��',39000);
insert into payment values(17,1016,'ī��',24000);












