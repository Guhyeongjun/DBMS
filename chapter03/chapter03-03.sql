-- select문 예제
-- 기본 검색
-- 모든 도서의 이름과 가격을 검색하시오
select bookname,price
from book;
-- 대소문자를 구분하지 않는다
-- SQL예약어는 대문자로, 테이블이나 속성이름은 소문자로 적는데
-- 이런 규칙은 아주 엄격하진 않다

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
select bookid,bookname,publisher,price
from book;