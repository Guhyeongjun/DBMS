-- alter문

-- enwbook 테이블에 varchar2(13)의 자료형을 가진 isbn속성을 추가하시오
alter table newbook add isbn varachar2(13);

-- newbook 테이블의 isbn속성의 데이터 타입을 number형으로 변경하시오
alter table newbook modify isbn number;

-- newbook 테이블의 isbn속성을 삭제하시오
alter table newbook drop column isbn;

-- newbook 테이블의 bookname속성에 not null 제약조건을 적용하시오
alter table newbook modify bookname varchar(20) not null;

-- newbook 테이블의 bookid 속성을 기본키로 변경하시오
alter table newbook add primary key(bookid);

-- drop문
-- 테이블을 삭제하는 명령이다
-- drop문은 테이블의 구조와 데이터를 모두 삭제하므로 사용에 주의해야 한다
-- 데이터만 삭제하려면 delete문을 사용한다
-- drop문의 문법

-- drop table 테이블 이름
drop table newbook;

-- newcustomer 테이블을 삭제하시오
drop table newcustomer;











