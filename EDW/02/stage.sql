DROP TABLE IF EXISTS account CASCADE
;

DROP TABLE IF EXISTS client CASCADE
;

DROP TABLE IF EXISTS card CASCADE
;

DROP TABLE IF EXISTS disposition CASCADE
;

DROP TABLE IF EXISTS district CASCADE
;

DROP TABLE IF EXISTS loan CASCADE
;

DROP TABLE IF EXISTS pernament_order CASCADE
;

DROP TABLE IF EXISTS transaction CASCADE
;

CREATE TABLE account
(
	account_id integer NOT NULL,
	date date NULL,
	district_id integer NULL,
	frequency varchar(50) NULL
)
;

CREATE TABLE client
(
	client_id integer NOT NULL,
	birth_number integer NULL,
	district_id integer NULL
)
;

CREATE TABLE card
(
	card_id integer NOT NULL,
	disp_id integer NULL,
	issued date NULL,
	type varchar(50) NULL
)
;

CREATE TABLE disposition
(
	disp_id integer NOT NULL,
	account_id integer NULL,
	client_id integer NULL,
	type varchar(50) NULL
)
;

CREATE TABLE district
(
	a1 integer NOT NULL,
	a2 varchar(50) NULL,
	a3 varchar(50) NULL,
	a4 integer NULL,
	a5 integer NULL,
	a6 integer NULL,
	a7 integer NULL,
	a8 integer NULL,
	a9 integer NULL,
	a10 numeric NULL,
	a11 integer NULL,
	a12 varchar(50) NULL,
	a13 numeric NULL,
	a14 integer NULL,
	a15 varchar(50) NULL,
	a16 integer NULL
)
;

CREATE TABLE loan
(
	loan_id integer NOT NULL,
	account_id integer NOT NULL,
	date date NOT NULL,
	amount numeric NOT NULL,
	duration integer NOT NULL,
	payments numeric NOT NULL,
	status varchar(1) NULL
)
;


CREATE TABLE pernament_order
(
	order_id integer NOT NULL,
	account_id integer NOT NULL,
	k_symbol varchar(30) NULL,
	account_to integer NOT NULL,
	amount numeric NOT NULL,
	bank_to varchar(2) NOT NULL
)
;

CREATE TABLE transaction
(
	trans_id integer NOT NULL,
	account_id integer NOT NULL,
	k_symbol varchar(30) NULL,
	operation varchar(50) NULL,
	type varchar(10) NOT NULL,
	account integer NULL,
	amount numeric NOT NULL,
	balance numeric NOT NULL,
	bank varchar(2) NULL,
	date date NULL
)
;
