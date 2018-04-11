-- Sample DATA 
-- 회원정보
INSERT INTO
	TBL_USERINFO(
		 userid          
    	, userpw   
    	, username      
    	, emailverify 
	)
VALUES(
	'ik872000@gmail.com'
	, 'aaa'
	, '전병익'
	, 'Y'
);


INSERT INTO
	TBL_USERINFO(
		 userid          
    	, userpw   
    	, username      
    	, emailverify 
	)
VALUES(
	'aseinj@gmail.com'
	, 'aaa'
	, '전병익'
	, 'Y'
);


INSERT INTO
	TBL_USERINFO(
		 userid          
    	, userpw   
    	, username      
    	, emailverify 
	)
VALUES(
	'jbs880813@gmail.com'
	, 'aaa'
	, '정보승'
	, 'Y'
);

INSERT INTO
	TBL_USERINFO(
		 userid          
    	, userpw   
    	, username      
    	, emailverify 
	)
VALUES(
	'jhs910312@gmail.com'
	, 'ccc'
	, '정현수'
	, 'Y'
);

INSERT INTO
	TBL_USERINFO(
		 userid          
    	, userpw   
    	, username      
    	, emailverify 
	)
VALUES(
	'soratoume@gmail.com'
	, 'ddd'
	, '이현호'
	, 'Y'
);

INSERT INTO
	TBL_USERINFO(
		 userid          
    	, userpw   
    	, username      
    	, emailverify 
	)
VALUES(
	'tofha990@gmail.com'
	, 'eee'
	, '여지원'
	, 'Y'
);



-- 회원이 만든 카드정보

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'ik872000@gmail.com'
		, '무역아카데미'
		, '전병익'
		, ''
		, ''
		, '010-1111-1111'
		, ''
		, ''
		, 'ik872000@gmail.com'
		, '서울특별시'
		, '학생'
		, 'B반'
		, ''
		, '1.jpg'
		, '2.jpg'
		, 0
		, '1.jpg'
		, '2.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'ik872000@gmail.com'
		, '인터라인'
		, '전병익'
		, ''
		, ''
		, '010-1111-1212'
		, ''
		, ''
		, 'ik872000@gmail.com'
		, '서울특별시'
		, '직원'
		, '개발부'
		, ''
		, '3.jpg'
		, '19.jpg'
		, 1
		, '3.jpg'
		, '19.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'tofha990@gmail.com'
		, '삼성'
		, '전병익'
		, ''
		, ''
		, '010-1111-2222'
		, ''
		, ''
		, 'tofha990@gmail.com'
		, '수원시'
		, '사원'
		, 'CS'
		, ''
		, '4.jpg'
		, '5.jpg'
		, 0
		, '4.jpg'
		, '5.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'tofha990@gmail.com'
		, '삼성전자'
		, '전병익'
		, ''
		, ''
		, '010-1111-1222'
		, ''
		, ''
		, 'tofha990@gmail.com'
		, '수원시'
		, '대리'
		, 'CS'
		, ''
		, '6.jpg'
		, '21.jpg'
		, 1
		, '6.jpg'
		, '21.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'jbs880813@gmail.com'
		, '대한민국 공군'
		, '정보승'
		, ''
		, ''
		, '010-1111-2552'
		, ''
		, ''
		, 'jbs880813@gmail.com'
		, '진주시'
		, '중위'
		, '정통교'
		, ''
		, '7.jpg'
		, '8.jpg'
		, 0
		, '7.jpg'
		, '8.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'jbs880813@gmail.com'
		, '앞산노인복지센터'
		, '정보승'
		, ''
		, ''
		, '010-2552-2552'
		, ''
		, ''
		, 'jbs880813@gmail.com'
		, '대구광역시'
		, '사무원'
		, '총무'
		, ''
		, '9.jpg'
		, '23.jpg'
		, 1
		, '9.jpg'
		, '23.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'jhs910312@gmail.com'
		, 'SECOM'
		, '정현수'
		, ''
		, ''
		, '010-2551-2252'
		, '031-125-1282'
		, '031-125-1283'
		, 'jhs910312@gmail.com'
		, '대구광역시'
		, '사무원'
		, '총무'
		, ''
		, '10.jpg'
		, '11.jpg'
		, 0
		, '10.jpg'
		, '11.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'jhs910312@gmail.com'
		, 'KT'
		, '정현수'
		, ''
		, ''
		, '010-1281-2252'
		, ''
		, ''
		, 'jhs910312@gmail.com'
		, '부산광역시'
		, '과장'
		, '마케팅'
		, ''
		, '12.jpg'
		, '25.jpg'
		, 1
		, '12.jpg'
		, '25.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'tofha990@gmail.com'
		, 'SM'
		, '이현호'
		, ''
		, ''
		, '010-1221-2252'
		, ''
		, ''
		, 'tofha990@gmail.com'
		, '성남시 판교'
		, '사원'
		, '마케팅'
		, ''
		, '4.jpg'
		, '5.jpg'
		, 0
		, '4.jpg'
		, '5.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'tofha990@gmail.com'
		, '멜론'
		, '이현호'
		, ''
		, ''
		, '010-1221-2252'
		, '02-1552-1522'
		, ''
		, 'tofha990@gmail.com'
		, '서울특별시 삼성동'
		, '사원'
		, '마케팅'
		, ''
		, '6.jpg'
		, '21.jpg'
		, 1
		, '6.jpg'
		, '21.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'aseinj@gmail.com'
		, 'IBM'
		, '여지원'
		, ''
		, ''
		, '010-1241-2252'
		, ''
		, ''
		, 'aseinj@gmail.com'
		, '서울특별시 역삼동'
		, '사원'
		, 'R&D'
		, ''
		, '16.jpg'
		, '17.jpg'
		, 0
		, '16.jpg'
		, '17.jpg'
	
);

INSERT INTO
	tbl_mycardinfo (
		mycardnum
		, userid
		, company
		, name1
		, name2
		, name3
		, phone
		, tel
		, fax
		, email
		, address
		, job
		, department
		, otherinfo
		, frontimgsaved
		, backimgsaved		
		, cardorder			 
		, frontimgoriginal	
		, backimgoriginal	
	)
VALUES (
		CONCAT('mbc', TO_CHAR(seq_mycardnum.nextval))
		, 'aseinj@gmail.com'
		, 'IBM'
		, '여지원'
		, ''
		, ''
		, '010-1241-2252'
		, ''
		, ''
		, 'aseinj@gmail.com'
		, '서울특별시 역삼동'
		, '대리'
		, 'R&D'
		, ''
		, '18.jpg'
		, '29.jpg'
		, 1
		, '18.jpg'
		, '29.jpg'
	
);



-- 회원이 받은 명함 정보

INSERT INTO
	tbl_yourcardinfo (
		yourcardnum
		, userid			
		, yournum
		, mycardnum			
		, memo				
		, company			
		, name1
		, name2
		, name3				
		, phone				
		, tel
		, fax				
		, email
		, address			
		, job
		, department		
		, otherinfo			
		, frontimgsaved
		, backimgsaved
		, cardorder			
		, sex				
		, frontimgoriginal	
		, backimgoriginal
)
VALUES (
		CONCAT('ycn', TO_CHAR(seq_yourcardnum.nextval))
		, 'ik872000@gmail.com'
		, CONCAT('yn', TO_CHAR(seq_yournum.nextval))
		, 'mbc4'
		, ''
		, '대한민국 공군'
		, '정보승'
		, ''
		, ''
		, '010-1435-1552'
		, ''
		, ''
		, 'jbs880813@gmail.com'
		, '진주시'
		, '중위'
		, '정통교'
		, ''
		, '29.jpg'
		, ''
		, 0
		, 'M'
		, '29.jpg'
		, ''
);

INSERT INTO
	tbl_yourcardinfo (
		yourcardnum
		, userid			
		, yournum
		, mycardnum			
		, memo				
		, company			
		, name1
		, name2
		, name3				
		, phone				
		, tel
		, fax				
		, email
		, address			
		, job
		, department		
		, otherinfo			
		, frontimgsaved
		, backimgsaved
		, cardorder			
		, sex				
		, frontimgoriginal	
		, backimgoriginal
)
VALUES (
		CONCAT('ycn', TO_CHAR(seq_yourcardnum.nextval))
		, 'ik872000@gmail.com'
		, CONCAT('yn', TO_CHAR(seq_yournum.nextval))
		, 'mbc4'
		, ''
		, '앞산노인복지센터'
		, '정보승'
		, ''
		, ''
		, '010-1235-1552'
		, ''
		, ''
		, 'jbs880813@gmail.com'
		, '대구광역시'
		, '사무원'
		, ''
		, ''
		, '7.jpg'
		, ''
		, 1
		, 'M'
		, '7.jpg'
		, ''
);

INSERT INTO
	tbl_yourcardinfo (
		yourcardnum
		, userid			
		, yournum
		, mycardnum			
		, memo				
		, company			
		, name1
		, name2
		, name3				
		, phone				
		, tel
		, fax				
		, email
		, address			
		, job
		, department		
		, otherinfo			
		, frontimgsaved
		, backimgsaved
		, cardorder			
		, sex				
		, frontimgoriginal	
		, backimgoriginal
)
VALUES (
		CONCAT('ycn', TO_CHAR(seq_yourcardnum.nextval))
		, 'ik872000@gmail.com'
		, CONCAT('yn', TO_CHAR(seq_yournum.nextval))
		, 'mbc5'
		, ''
		, 'IBM'
		, '여지원'
		, ''
		, ''
		, '010-1235-1552'
		, ''
		, ''
		, 'aseinj@gmail.com'
		, '서울특별시 역삼동'
		, '사원'
		, 'R&D'
		, '머리카락이 가늘다'
		, '8.jpg'
		, '18.jpg'
		, 0
		, 'W'
		, '8.jpg'
		, '18.jpg'
);

INSERT INTO
	tbl_yourcardinfo (
		yourcardnum
		, userid			
		, yournum
		, mycardnum			
		, memo				
		, company			
		, name1
		, name2
		, name3				
		, phone				
		, tel
		, fax				
		, email
		, address			
		, job
		, department		
		, otherinfo			
		, frontimgsaved
		, backimgsaved
		, cardorder			
		, sex				
		, frontimgoriginal	
		, backimgoriginal
)
VALUES (
		CONCAT('ycn', TO_CHAR(seq_yourcardnum.nextval))
		, 'ik872000@gmail.com'
		, CONCAT('yn', TO_CHAR(seq_yournum.nextval))
		, 'mbc4'
		, ''
		, 'IBM'
		, '여지원'
		, ''
		, ''
		, '010-1235-1552'
		, ''
		, ''
		, 'aseinj@gmail.com'
		, '서울특별시 역삼동'
		, '대리'
		, 'R&D'
		, '머리카락이 가늘다'
		, '9.jpg'
		, ''
		, 1
		, 'W'
		, '9.jpg'
		, ''
);

INSERT INTO
	tbl_yourcardinfo (
		yourcardnum
		, userid			
		, yournum
		, mycardnum			
		, memo				
		, company			
		, name1
		, name2
		, name3				
		, phone				
		, tel
		, fax				
		, email
		, address			
		, job
		, department		
		, otherinfo			
		, frontimgsaved
		, backimgsaved
		, cardorder			
		, sex				
		, frontimgoriginal	
		, backimgoriginal
)
VALUES (
		CONCAT('ycn', TO_CHAR(seq_yourcardnum.nextval))
		, 'ik872000@gmail.com'
		, CONCAT('yn', TO_CHAR(seq_yournum.nextval))
		, 'mbc4'
		, ''
		, 'KT'
		, '정현수'
		, ''
		, ''
		, '010-1235-2141'
		, ''
		, ''
		, 'jhs910312@gmail.com'
		, '부산광역시'
		, '과장'
		, '마케팅'
		, ''
		, '14.jpg'
		, ''
		, 0
		, 'M'
		, '14.jpg'
		, ''
);

INSERT INTO
	tbl_yourcardinfo (
		yourcardnum
		, userid			
		, yournum
		, mycardnum			
		, memo				
		, company			
		, name1
		, name2
		, name3				
		, phone				
		, tel
		, fax				
		, email
		, address			
		, job
		, department		
		, otherinfo			
		, frontimgsaved
		, backimgsaved
		, cardorder			
		, sex				
		, frontimgoriginal	
		, backimgoriginal
)
VALUES (
		CONCAT('ycn', TO_CHAR(seq_yourcardnum.nextval))
		, 'ik872000@gmail.com'
		, CONCAT('yn', TO_CHAR(seq_yournum.nextval))
		, 'mbc5'
		, ''
		, '멜론'
		, '이현호'
		, ''
		, ''
		, '010-8985-2141'
		, ''
		, ''
		, 'soratoume@gmail.com'
		, '서울특별시 삼성동'
		, '사원'
		, '마케팅'
		, ''
		, '13.jpg'
		, ''
		, 0
		, 'M'
		, '13.jpg'
		, ''
);





