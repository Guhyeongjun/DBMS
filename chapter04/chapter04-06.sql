-- DML
-- �� ���̺� �����͸� �����ϴ� insert������ �ϳ��� ���̽ÿ�
-- �󿵰��� ������ ����
insert into cinema values(1,11,'�����ǵ���',15000,7);
-- �� ���̺� ������ ����
insert into movie_customer
values(22,'���','����');
-- ���� ���̺� ������ ����
insert into reservation values(1,10,22,7,'2024-4-24');
-- ���� ���̺� ������ ����
insert into theater values(33,'�Ե��ó׸�','���麻��');

-- 2. ��ȭ�� ������ 10% �λ��Ͻÿ�.
update cinema set movieprice = movieprice * 1.1;

