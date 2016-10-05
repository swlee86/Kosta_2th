//// 테이블 ////

/* member */
CREATE TABLE member (
	member_id varchar2(30)  NOT NULL, /* 아이디 */
	member_pw varchar2(20) NOT NULL, /* 비밀번호 */
	member_name varchar2(15) NOT NULL, /* 이름 */
	member_phone varchar2(11), /* 전화번호 */
	member_redate DATE NOT NULL, /* 가입일자 */
	member_grade number NOT NULL, /* 직위 */
	member_okdate DATE, /* 승인일자 */
	member_okid varchar2(30), /* 승인자 */
	m_loginok varchar2(1) NOT NULL, /* 로그인 가능여부 */
	shop_code varchar2(10)  NOT NULL /* 매장 코드 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_id
		);

/* Shop */
CREATE TABLE shop (
	shop_code varchar2(10)  NOT NULL, /* 매장 코드 */
	shop_name  varchar2(50) NOT NULL, /* 매장 이름 */
	shop_addr varchar2(500) NOT NULL, /* 매장 주소 */
	shop_repre varchar2(15) NOT NULL, /* 대표자명 */
	shop_brn varchar2(18) NOT NULL, /* 사업자번호 */
	shop_phone  varchar2(16) NOT NULL, /* 매장 번호 */
	shop_redate DATE NOT NULL /* 매장 등록일자 */
);

ALTER TABLE shop
	ADD
		CONSTRAINT PK_shop
		PRIMARY KEY (
			shop_code
		);

/* board_hq */
CREATE TABLE board_hq (
	board_number number NOT NULL, /* 글번호 */
	board_writer varchar2(30)  NOT NULL, /* 아이디 */
	board_title varchar2(100) NOT NULL, /* 제목 */
	board_content varchar2(1000) NOT NULL, /* 내용 */
	board_date date NOT NULL, /* 작성일 */
	board_file varchar2(50) NOT NULL, /* 파일 이름 */
	board_file_size number NOT NULL /* 파일 사이즈 */
);

ALTER TABLE board_hq
	ADD
		CONSTRAINT PK_board_hq
		PRIMARY KEY (
			board_number
		);

/* inventory */
CREATE TABLE inventory (
	inv_name VARCHAR2(20) NOT NULL, /* 재고명 */
	inv_sn VARCHAR2(15) NOT NULL, /* 일련번호 */
	inv_color VARCHAR2(10) NOT NULL, /* 색상 */
	inv_amount NUMBER NOT NULL, /* 수량 */
	shop_code varchar2(10)  /* 매장 코드 */
);

ALTER TABLE inventory
	ADD
		CONSTRAINT PK_inventory
		PRIMARY KEY (
			inv_name,
			inv_sn
		);

/* board_shop */
CREATE TABLE board_shop (
	board_num number NOT NULL, /* 글번호 */
	board_writer varchar2(30)  NOT NULL, /* 아이디 */
	board_title varchar2(100) NOT NULL, /* 제목 */
	board_content varchar2(1000) NOT NULL, /* 내용 */
	board_date date NOT NULL, /* 작성일 */
	board_file varchar2(50) NOT NULL, /* 파일 이름 */
	board_file_size number NOT NULL /* 파일 사이즈 */
);

ALTER TABLE board_shop
	ADD
		CONSTRAINT PK_board_shop
		PRIMARY KEY (
			board_num
		);

/* trade */
CREATE TABLE trade (
	inv_name VARCHAR2(20) NOT NULL, /* 재고명 */
	inv_sn VARCHAR2(15) NOT NULL, /* 일련번호 */
	shop_code varchar2(10)  NOT NULL, /* 매장 코드 */
	model_name  varchar2(30)  NOT NULL, /* 모델명 */
	request_date DATE NOT NULL, /* 요청일자 */
	in_inv_memo  varchar2(50) , /* 입고메모 */
	in_inv_date DATE, /* 입고날짜 */
	out_inv_memo  varchar2(50) , /* 출고메모 */
	out_inv_date DATE, /* 출고날짜 */
	trade_state  varchar2(10)  NOT NULL /* 입출고상태 */
);

ALTER TABLE member
	ADD
		CONSTRAINT FK_shop_TO_member
		FOREIGN KEY (
			shop_code
		)
		REFERENCES shop (
			shop_code
		);

ALTER TABLE board_hq
	ADD
		CONSTRAINT FK_member_TO_board_hq
		FOREIGN KEY (
			board_writer
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE inventory
	ADD
		CONSTRAINT FK_shop_TO_inventory
		FOREIGN KEY (
			shop_code
		)
		REFERENCES shop (
			shop_code
		);

ALTER TABLE board_shop
	ADD
		CONSTRAINT FK_member_TO_board_shop
		FOREIGN KEY (
			board_writer
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE trade
	ADD
		CONSTRAINT FK_inventory_TO_trade
		FOREIGN KEY (
			inv_name,
			inv_sn
		)
		REFERENCES inventory (
			inv_name,
			inv_sn
		);

ALTER TABLE trade
	ADD
		CONSTRAINT FK_shop_TO_trade
		FOREIGN KEY (
			shop_code
		)
		REFERENCES shop (
			shop_code
		);