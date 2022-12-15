DROP TABLE stock_management CASCADE CONSTRAINTS PURGE;



DROP TABLE manager CASCADE CONSTRAINTS PURGE;



DROP TABLE sale CASCADE CONSTRAINTS PURGE;



DROP TABLE wine CASCADE CONSTRAINTS PURGE;



DROP TABLE wine_type CASCADE CONSTRAINTS PURGE;



DROP TABLE today CASCADE CONSTRAINTS PURGE;



DROP TABLE nation CASCADE CONSTRAINTS PURGE;



DROP TABLE theme CASCADE CONSTRAINTS PURGE;



DROP TABLE member CASCADE CONSTRAINTS PURGE;



DROP TABLE grade_pt_rade CASCADE CONSTRAINTS PURGE;



CREATE TABLE grade_pt_rade
(
	mem_grade            VARCHAR2(20) NOT NULL ,
	grade_pt_rate        NUMBER(3,2) NULL 
);



CREATE UNIQUE INDEX XPKgrade_pt_rade ON grade_pt_rade
(mem_grade   ASC);



ALTER TABLE grade_pt_rade
	ADD CONSTRAINT  XPKgrade_pt_rade PRIMARY KEY (mem_grade);



CREATE TABLE manager
(
	manager_id           VARCHAR2(30) NOT NULL ,
	manager_pwd          VARCHAR2(20) NOT NULL ,
	manager_tel          VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPKmanager ON manager
(manager_id   ASC);



ALTER TABLE manager
	ADD CONSTRAINT  XPKmanager PRIMARY KEY (manager_id);



CREATE TABLE member
(
	mem_id               VARCHAR2(6) NOT NULL ,
	mem_pw               VARCHAR2(20) NOT NULL ,
	mem_birth            DATE DEFAULT  sysdate
  NOT NULL ,
	mem_tel              VARCHAR2(20) NULL ,
	mem_pt               VARCHAR2(10) DEFAULT  0
  NOT NULL ,
	mem_grade            VARCHAR2(20) NOT NULL 
);



CREATE UNIQUE INDEX XPKmember ON member
(mem_id   ASC);



ALTER TABLE member
	ADD CONSTRAINT  XPKmember PRIMARY KEY (mem_id);



CREATE TABLE nation
(
	nation_code          VARCHAR2(26) NOT NULL ,
	nation_name          VARCHAR2(50) NOT NULL 
);



CREATE UNIQUE INDEX XPK국가관련정보 ON nation
(nation_code   ASC);



ALTER TABLE nation
	ADD CONSTRAINT  XPK국가관련정보 PRIMARY KEY (nation_code);



CREATE TABLE sale
(
	sale_date            DATE NOT NULL ,
	sale_amount          CHAR(18) NULL ,
	sale_price           varchar2(6) NULL ,
	sale_not_price       VARCHAR2(15) NULL ,
	id                   VARCHAR2(30) NOT NULL ,
	wine_code            VARCHAR2(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKsale ON sale
(sale_date   ASC);



ALTER TABLE sale
	ADD CONSTRAINT  XPKsale PRIMARY KEY (sale_date);



CREATE TABLE stock_management
(
	stock_code           VARCHAR2(6) NOT NULL ,
	wine_code            VARCHAR2(26) NOT NULL ,
	ware_date            DATE DEFAULT  sysdate
  NOT NULL ,
	stock_amount         NUMBER(5) NOT NULL ,
	manager_id           VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPKstock_management ON stock_management
(stock_code   ASC);



ALTER TABLE stock_management
	ADD CONSTRAINT  XPKstock_management PRIMARY KEY (stock_code);



CREATE TABLE theme
(
	theme_code           VARCHAR2(6) NOT NULL ,
	theme_name           VARCHAR2(50) NULL 
);



CREATE UNIQUE INDEX XPK와인테마정보 ON theme
(theme_code   ASC);



ALTER TABLE theme
	ADD CONSTRAINT  XPK와인테마정보 PRIMARY KEY (theme_code);



CREATE TABLE today
(
	today_code           VARCHAR2(6) NOT NULL ,
	today_sens_value     NUMBER(3) NULL ,
	today_intell_value   NUMBER(3) NULL ,
	today_phy_value      NUMBER(3) NULL 
);



CREATE UNIQUE INDEX XPKtoday ON today
(today_code   ASC);



ALTER TABLE today
	ADD CONSTRAINT  XPKtoday PRIMARY KEY (today_code);



CREATE TABLE wine
(
	wine_code            VARCHAR2(26) NOT NULL ,
	wine_name            VARCHAR2(100) NOT NULL ,
	wine_url             BLOB NULL ,
	nation_code          VARCHAR2(26) NOT NULL ,
	wine_type_code       VARCHAR2(6) NOT NULL ,
	wine_sugar_code      NUMBER(2) NULL ,
	wine_price           NUMBER(15) NOT NULL ,
	wine_vintage         DATE NULL ,
	theme_code           VARCHAR2(6) NOT NULL ,
	today_code           VARCHAR2(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKwine ON wine
(wine_code   ASC);



ALTER TABLE wine
	ADD CONSTRAINT  XPKwine PRIMARY KEY (wine_code);



CREATE TABLE wine_type
(
	wine_type_code       VARCHAR2(6) NOT NULL ,
	wine_type_name       VARCHAR2(50) NULL 
);



CREATE UNIQUE INDEX XPKwine_type ON wine_type
(wine_type_code   ASC);



ALTER TABLE wine_type
	ADD CONSTRAINT  XPKwine_type PRIMARY KEY (wine_type_code);



ALTER TABLE member
	ADD (CONSTRAINT R_8 FOREIGN KEY (mem_grade) REFERENCES grade_pt_rade (mem_grade));



ALTER TABLE sale
	ADD (CONSTRAINT R_11 FOREIGN KEY (id) REFERENCES member (mem_id));



ALTER TABLE sale
	ADD (CONSTRAINT R_24 FOREIGN KEY (wine_code) REFERENCES wine (wine_code));



ALTER TABLE stock_management
	ADD (CONSTRAINT R_22 FOREIGN KEY (wine_code) REFERENCES wine (wine_code));



ALTER TABLE stock_management
	ADD (CONSTRAINT R_23 FOREIGN KEY (manager_id) REFERENCES manager (manager_id));



ALTER TABLE wine
	ADD (CONSTRAINT R_12 FOREIGN KEY (theme_code) REFERENCES theme (theme_code));



ALTER TABLE wine
	ADD (CONSTRAINT R_13 FOREIGN KEY (nation_code) REFERENCES nation (nation_code));



ALTER TABLE wine
	ADD (CONSTRAINT R_14 FOREIGN KEY (today_code) REFERENCES today (today_code));



ALTER TABLE wine
	ADD (CONSTRAINT R_15 FOREIGN KEY (wine_type_code) REFERENCES wine_type (wine_type_code));
