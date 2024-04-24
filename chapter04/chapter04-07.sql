-- [�Ǹſ� �����ͺ��̽�]
-- (1) ����

-- (2) ��� �Ǹſ��� �̸��� �޿��� ���̽ÿ�. (��, �ߺ� ���� ���� �Ѵ�)
select distinct name, salary from sales_person;
-- sales_person�� ������ ����
insert into sales_person values('���Ǹ�1',31,3001);
insert into sales_person values('���Ǹ�2',32,3002);
insert into sales_person values('���Ǹ�3',33,3003);
insert into sales_person values('���Ǹ�4',34,3004);
insert into sales_person values('���Ǹ�5',35,3005);

-- (3) ���̰� 30�� �̸��� �Ǹſ��� �̸��� ���̽ÿ�
select name from sales_person where age < 30;
insert into sales_person values('���Ǹ�6',26,2006);
insert into sales_person values('���Ǹ�7',27,2007);

-- (4) 's'�� ������ ���ÿ� ��� ���� �̸��� ���̽ÿ�
select name from sales_customer where city like '%s';
insert into sales_customer values('���1','New York','���ǰŷ���');
insert into sales_customer values('���2','Los Angeles','movie star');
insert into sales_customer values('���3','Chicago','pizza');
insert into sales_customer values('���4','Houston','farmer');
insert into sales_customer values('���5','Phoenix','pilot');

-- (5) �ֹ��� �� ���� ��(���� �ٸ� ����)�� ���Ͻÿ�
select count(distinct custname) from sales_order;
insert into sales_order values(1,'���1','���Ǹ�1',1001);
insert into sales_order values(2,'���2','���Ǹ�2',1001);
insert into sales_order values(3,'���3','���Ǹ�3',1001);
insert into sales_order values(4,'���4','���Ǹ�4',1001);
insert into sales_order values(5,'���5','���Ǹ�5',1001);

-- (6) �Ǹſ� ������ ���Ͽ� �ֹ��� ���� ����Ͻÿ�
select salesperson, count(*) from sales_order group by salesperson;

-- (7) 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�
select * from sales_person
where name in
(select salesperson from sales_order
where custname in 
(select name from sales_customer where city = 'LA'));
-- (�μ����� ���)
-- sales_customer���̺��� �⺻Ű�� onumber�Ӽ����� ����
insert into sales_customer values('���6','LA','����1');
insert into sales_customer values('���7','LA','����7');
insert into sales_order values(6,'���6','���Ǹ�1',1006);
insert into sales_order values(7,'���6','���Ǹ�1',1007);
insert into sales_order values(8,'���6','���Ǹ�3',1008);

-- (������ ���)
select * from sales_customer
where c.city like 'LA';













