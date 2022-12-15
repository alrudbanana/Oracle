DROP TABLE orders CASCADE CONSTRAINTS PURGE;



DROP TABLE products CASCADE CONSTRAINTS PURGE;



DROP TABLE member CASCADE CONSTRAINTS PURGE;



DROP TABLE tb_zipcode CASCADE CONSTRAINTS PURGE;



CREATE TABLE member
(
	id                   varchar2(20) NOT NULL ,
	pwd                  varchar2(20) NULL ,
	name                 varchar2(50) NULL ,
	address              varchar2(20) NULL ,
	tel                  varchar2(13) NULL ,
	indate               DATE DEFAULT  sysdate  NULL ,
	zipcode              VARCHAR2(7) NULL 
);



CREATE UNIQUE INDEX XPK회원 ON member
(id   ASC);



ALTER TABLE member
	ADD CONSTRAINT  XPK회원 PRIMARY KEY (id);



CREATE TABLE orders
(
	id                   varchar2(20) NOT NULL ,
	product_code         varchar2(20) NOT NULL ,
	o_seq                NUMBER(10) NOT NULL ,
	product_size         varchar2(5) NULL ,
	quantity             varchar2(5) NULL ,
	result               CHAR(1) NULL ,
	indate               DATE DEFAULT  sysdate  NULL 
);



CREATE UNIQUE INDEX XPK주문 ON orders
(o_seq   ASC);



ALTER TABLE orders
	ADD CONSTRAINT  XPK주문 PRIMARY KEY (o_seq);



CREATE TABLE products
(
	product_code         varchar2(20) NOT NULL ,
	product_name         varchar2(100) NULL ,
	product_kind         char(1) NULL ,
	product_price1       varchar2(10) NULL ,
	product_price2       varchar2(10) NULL ,
	product_content      varchar2(1000) NULL ,
	product_image        varchar2(50) NULL ,
	sizeSt               varchar2(5) NULL ,
	sizeEt               varchar2(5) NULL ,
	product_quantity     varchar2(5) NULL ,
	useyn                CHAR(1) NULL ,
	indate               DATE DEFAULT  sysdate  NULL 
);



CREATE UNIQUE INDEX XPK상품 ON products
(product_code   ASC);



ALTER TABLE products
	ADD CONSTRAINT  XPK상품 PRIMARY KEY (product_code);



CREATE TABLE tb_zipcode
(
	zipcode              VARCHAR2(7) NOT NULL ,
	sido                 VARCHAR2(30) NULL ,
	gugun                VARCHAR2(30) NULL ,
	dong                 varchar2(30) NULL ,
	bungi                varchar2(30) NULL 
);



CREATE UNIQUE INDEX XPK우편번호 ON tb_zipcode
(zipcode   ASC);



ALTER TABLE tb_zipcode
	ADD CONSTRAINT  XPK우편번호 PRIMARY KEY (zipcode);



ALTER TABLE member
	ADD (CONSTRAINT R_1 FOREIGN KEY (zipcode) REFERENCES tb_zipcode (zipcode) ON DELETE SET NULL);



ALTER TABLE orders
	ADD (CONSTRAINT R_2 FOREIGN KEY (id) REFERENCES member (id));



ALTER TABLE orders
	ADD (CONSTRAINT R_4 FOREIGN KEY (product_code) REFERENCES products (product_code));


show user; 
select * from user_constraints
where table_name in('TB_ZIPCODE');