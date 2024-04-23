-- [극장 데이터베이스]

-- 극장 테이블 생성
create table theater(
    theaternumber number primary key,
    theatername varchar2(20),
    theaterlocation varchar2(30)
);

-- 상영관 테이블 생성
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

-- [판매원 데이터베이스]

























