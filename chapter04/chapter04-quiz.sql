-- [���� �����ͺ��̽�]

-- ���� ���̺� ����
create table theater(
    theaternumber number primary key,
    theatername varchar2(20),
    theaterlocation varchar2(30)
);

-- �󿵰� ���̺� ����
create table movie(
    tmovienumber number,
    movienumber number,
    moviename varchar2(30),
    movieprice number check (movieprice < 20000),
    movieseat number,
    primary key (tmovienumber, movienumber)
);

drop table theater;
drop table movie;

-- [�Ǹſ� �����ͺ��̽�]

























