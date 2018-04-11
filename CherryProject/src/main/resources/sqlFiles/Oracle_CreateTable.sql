-- BusinessCard Project 테이블 생성 및 샘플 데이터 입력 sql
-- 2018.03.30. 정보승

-- 회원정보 TABLE 
CREATE TABLE tbl_userinfo (

    userid          VARCHAR2(50)    PRIMARY KEY     -- 회원 ID
    , userpw        VARCHAR2(100)   NOT NULL        -- 회원 비밀번호
    , username      VARCHAR2(100)   NOT NULL        -- 회원 이름
    , emailverify 	CHAR(1) 		DEFAULT 'N'		-- 이메일 인증
    
);

COMMIT;


--ALTER TABLE
--	tbl_userinfo
--ADD (
--	emailverify char(1) DEFAULT 'N'
--);


-- 본인 명함 관리 TABLE
CREATE TABLE tbl_mycardinfo (

	mycardnum			VARCHAR2(100)	PRIMARY KEY		-- 명함 등록 번호 : 식별자를 통해 제작 명함과 등록 명함을 구분 (ex. m01 : 제작, m11:등록, c01: 받은 명함)
	, userid			VARCHAR2(50)					-- 회원 ID : 회원정보 TABLE의 useid를 참조.
	, company			VARCHAR2(100)					-- 회사명
	, name1				VARCHAR2(100)					-- 성명
	, name2				VARCHAR2(100)					-- 성명
	, name3				VARCHAR2(100)					-- 성명
	, phone				VARCHAR2(100)					-- 연락처
	, tel				VARCHAR2(100)					-- 회사 전화번호
	, fax				VARCHAR2(100)					-- 팩스 번호
	, email				VARCHAR2(100)					-- E-mail 주소
	, address			VARCHAR2(200)					-- 회사 주소
	, job				VARCHAR2(100)					-- 직책, 직위, 직급
	, department		VARCHAR2(100)					-- 부서명
	, otherinfo			VARCHAR2(200)					-- 기타 정보
	, frontimgsaved		VARCHAR2(300)	NOT NULL		-- 명함 앞면의 이미지 경로
	, backimgsaved		VARCHAR2(300)					-- 명함 뒷면의 이미지 경로
	, cardorder			NUMBER			DEFAULT 0		-- 명함의 순서(현재 사용하고 있는 명함의 숫자가 가장 크다)
	, frontimgoriginal	VARCHAR2(300)					-- 
	, backimgoriginal	VARCHAR2(300)					-- 
	
);

COMMIT;

-- 외래키 등록
ALTER TABLE 
	tbl_mycardinfo
ADD CONSTRAINT 
	FK_tbl_mycardinfo_userid FOREIGN KEY(userid)
REFERENCES 
	tbl_userinfo(userid);

COMMIT;


-- 받은 명함 관리 TABLE
CREATE TABLE tbl_yourcardinfo (

	yourcardnum			VARCHAR2(100)	PRIMARY KEY		-- 다른 사람에게 받은 명함의 등록번호 : 받은 사람의 명함 등록 번호를 따로 부여 (ex.  c01: 받은 명함)
	, userid			VARCHAR2(50)	NOT NULL		-- 회원 ID : 회원정보 TABLE의 useid를 참조
	, yournum			VARCHAR2(50)	NOT NULL		-- 명함을 준 사람들의 번호 : 받은 사람의 번호를 부여해서 명함을 그룹화(동명이인의 경우를 대비) (ex. you01)
	, mycardnum			VARCHAR2(100)	NOT NULL		-- 내 명함의 등록 번호 : 본인 명함 관리 TABLE의 mycardnum을 참조
	, memo				VARCHAR2(500)					-- 간단한 메모를 저장
	, company			VARCHAR2(100)					-- 회사명
	, name1				VARCHAR2(100)					-- 성명
	, name2				VARCHAR2(100)					-- 성명
	, name3				VARCHAR2(100)					-- 성명
	, phone				VARCHAR2(100)					-- 연락처
	, tel				VARCHAR2(100)					-- 회사 전화번호
	, fax				VARCHAR2(100)					-- 팩스 번호
	, email				VARCHAR2(100)					-- E-mail 주소
	, address			VARCHAR2(200)					-- 회사 주소
	, job				VARCHAR2(100)					-- 직책, 직위, 직급
	, department		VARCHAR2(100)					-- 부서명
	, otherinfo			VARCHAR2(200)					-- 기타 정보
	, frontimgsaved		VARCHAR2(300)	NOT NULL		-- 명함 앞면의 이미지 경로 : OCR로 판독하기 위한 사진의 앞쪽 명함 이미지 경로
	, backimgsaved		VARCHAR2(300)					-- 명함 뒷면의 이미지 경로 : OCR로 판독하기 위한 사진의 뒤쪽 명함 이미지 경로
	, cardorder			NUMBER			DEFAULT 0		-- 명함의 순서(현재 사용하고 있는 명함의 숫자가 가장 크다)
	, sex				CHAR(1)			DEFAULT 'M'
	, frontimgoriginal	VARCHAR2(300)
	, backimgoriginal	VARCHAR2(300)
	
	
);

COMMIT;

-- 외래키 등록
ALTER TABLE 
	tbl_yourcardinfo
ADD CONSTRAINT 
	FK_tbl_yourcardinfo_userid FOREIGN KEY(userid)
REFERENCES 
	tbl_userinfo(userid);

ALTER TABLE 
	tbl_yourcardinfo
ADD CONSTRAINT 
	FK_tbl_yourcardinfo_mycardnum FOREIGN KEY(mycardnum)
REFERENCES 
	tbl_mycardinfo(mycardnum);

COMMIT;

CREATE SEQUENCE seq_yourcardnum START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_yournum START WITH 1 INCREMENT BY 1;

COMMIT;



-- 레이아웃 TABLE : 명함등록 번호 및 레이아웃 구분번호는 기본적으로 입력된다.
--					배경이미지의 경우 : x, y, z 위치 값, (이미지 경로)만 입력
--					텍스트의 경우 : 위의 경우 포함 및 글자체, 글자크기, 객체 색, 회전, 메모까지의 입력
--					일반 이미지(템플릿, 아이콘, 로고 모두 포함) : 글자체와 글자크기, 메모만 제외한 모든 값 입력
CREATE TABLE tbl_cardlayout (

	layoutnum		NUMBER			PRIMARY KEY					-- 의미없는 구분 번호 Sequence
	, mycardnum		VARCHAR2(100)								-- 내 명함의 등록 번호 : 본인 명함 관리 TABLE의 mycardnum을 참조
	, xposition		NUMBER			NOT NULL					-- x위치
	, yposition		NUMBER			NOT NULL					-- y위치
	, zposition		NUMBER			DEFAULT 1					-- z위치 : 레이아웃의 겹쳐지는 높이를 의미. 배경이미지 값이 0
	, font			VARCHAR2(50)								-- 글자체
	, fontsize		NUMBER										-- 글차크기
	, fontcolor		VARCHAR2(100)								-- 객체의 색 : 글자의 경우 폰트의 색, 이미지의 경우 배경의 색
	, rotation		NUMBER			DEFAULT 0					-- 객체의 회전각도
	, backgrimg		VARCHAR2(300)								-- 이미지, 템플릿 경로
	, memo			VARCHAR2(100)								-- 텍스트 박스의 경우 텍스트 내용을 저장. 이 값이 null이면 이미지, 템플릿
	
);

COMMIT; 

ALTER TABLE 
	tbl_cardlayout
ADD CONSTRAINT 
	FK_tbl_cardlayout_mycardnum FOREIGN KEY(mycardnum)
REFERENCES 
	tbl_mycardinfo(mycardnum);

COMMIT;

-- 시퀀스 생성
CREATE SEQUENCE seq_layoutnum START WITH 1 INCREMENT BY 1;

COMMIT;

CREATE SEQUENCE seq_mycardnum START WITH 1 INCREMENT BY 1;





