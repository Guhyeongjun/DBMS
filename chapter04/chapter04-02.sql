-- alter��

-- enwbook ���̺� varchar2(13)�� �ڷ����� ���� isbn�Ӽ��� �߰��Ͻÿ�
alter table newbook add isbn varachar2(13);

-- newbook ���̺��� isbn�Ӽ��� ������ Ÿ���� number������ �����Ͻÿ�
alter table newbook modify isbn number;

-- newbook ���̺��� isbn�Ӽ��� �����Ͻÿ�
alter table newbook drop column isbn;

-- newbook ���̺��� bookname�Ӽ��� not null ���������� �����Ͻÿ�
alter table newbook modify bookname varchar(20) not null;

-- newbook ���̺��� bookid �Ӽ��� �⺻Ű�� �����Ͻÿ�
alter table newbook add primary key(bookid);

-- drop��
-- ���̺��� �����ϴ� ����̴�
-- drop���� ���̺��� ������ �����͸� ��� �����ϹǷ� ��뿡 �����ؾ� �Ѵ�
-- �����͸� �����Ϸ��� delete���� ����Ѵ�
-- drop���� ����

-- drop table ���̺� �̸�
drop table newbook;

-- newcustomer ���̺��� �����Ͻÿ�
drop table newcustomer;











