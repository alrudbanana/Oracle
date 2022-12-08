-- tb_zibcode
create table tb_zibcode (
zipcode varchar2(7)constraint tb_zipcode_PK primary key,
sido varchar2(30),
gugum varchar2(30),
dong varchar2(30),
bungi varchar2(30)
);
 drop table tb_zibcode;
-- 값 넣기 
insert into tb_zibcode 
values (1111-111,'서울','성동구','송정동','1111');

insert into tb_zibcode 
values (2222-111,'서울','성동구','성수동','2222');

insert into tb_zibcode 
values (3333-111,'서울','성동구','왕십리','3333');

insert into tb_zibcode 
values (4444-111,'서울','성동구','장한평동','4444');

insert into tb_zibcode 
values (5555-111,'서울','광진구','화양동','5555');

select * from tb_zibcode;
commit;
--member
create table member (
id varchar2(20) constraint PK_member_id primary key,
pwd varchar2(20),
name varchar2(50),
zipcode varchar2(7),
constraint FK_member_id_tb_zipcode foreign key (zipcode) references tb_zibcode (zipcode),
address varchar2(20),
tel varchar2(13),
indate date
);
drop table memeber;

--값 넣기 
insert into member 
values ('aaaa','1234','정동원',1111-111,'성동구','010-0000-0000','2022-12-08');

insert into member 
values ('bbbb','1234','강동원',2222-111,'성동구','010-0000-0000','2022-12-08');

insert into member 
values ('cccc','1234','문빈',3333-111,'성동구','010-0000-0000','2022-12-08');

insert into member 
values ('dddd','1234','준호',4444-111,'성동구','010-0000-0000','2022-12-08');

insert into member 
values ('eeee','1234','셔누',5555-111,'성동구','010-0000-0000','2022-12-08');

select * from member;
commit;
--products
create table products (
 product_code varchar2(20) constraint PK_products_product_code primary key,
 product_name varchar2(100),
 product_kind char(1),
 product_price1 varchar2(10),
 product_price2 varchar2(10),
 product_content varchar2(1000),
 product_image varchar2(50),
 sizeSt varchar2(5),
 sizeEt varchar2(5),
 product_quantity varchar2(5),
  useyn char(1),
  indate date
  );
  
insert into products
values ('abc','스투시','1',40000,0,'기모후드','사진없음','XL','s','1','0','2022-12-01');

insert into products
values ('bcd','스투시','2',40000,0,'후드','사진없음','XL','s','1','0','2022-12-01');

insert into products
values ('cde','스투시','3',40000,0,'기모후드','사진없음','XL','s','1','0','2022-12-01');

insert into products
values ('efg','스투시','4',40000,0,'기모후드','사진없음','XL','s','1','0','2022-12-01');

insert into products
values ('fgh','스투시','5',40000,0,'기모후드','사진없음','XL','s','1','0','2022-12-01');
commit;
select * from products;

--orders
create table orders (
o_seq number(10) constraint  PK_orders_o_seq primary key,
product_code varchar2(20), 
constraint FK_orders_product_code_products foreign key (product_code) references products (product_code),
id varchar2(16),
constraint FK_orders_id_member foreign key (id) references member (id),
product_size varchar2(5),
 quantity varchar2(5),
 result char(1),
 indate date
 );
select * from orders;
insert into orders 
values ('1111','abc','aaaa','xl','1','o','2022-12-08');
 
insert into orders 
values ('2222','bcd','bbbb','xl','1','x','2022-12-08');

insert into orders 
values ('3333','cde','cccc','xl','1','x','2022-12-08');

insert into orders 
values ('4444','efg','cccc','xl','2','x','2022-12-08');

insert into orders 
values ('5555','fgh','aaaa','xl','1','o','2022-12-08');

commit;