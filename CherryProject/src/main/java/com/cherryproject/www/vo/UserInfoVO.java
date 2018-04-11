package com.cherryproject.www.vo;

/*
 * @comment 회원VO 객체
 * @author	정보승
 */

/*
CREATE TABLE tbl_userinfo (

    userid          VARCHAR2(50)    PRIMARY KEY     -- 회원 ID
    , userpw        VARCHAR2(100)   NOT NULL        -- 회원 비밀번호
    , username      VARCHAR2(100)   NOT NULL        -- 회원 이름
    , emailverify	CHAR(1)			DEFAULT	'N'		-- E-mail 인증 여부
    
);
 */


public class UserInfoVO {
	
	/*
	 * Field
	 */
	private String userid;			// 회원 ID
	private String userpw;			// 회원 비밀번호
	private String username;		// 회원 이름
	private char emailverify;		// E-mail 인증 여부
	
	
	/*
	 * Constructor
	 */
	public UserInfoVO() {
		super();
	}
	
	
	/*
	 * Getter and Setter
	 */
	public String getUserid() 				{	return userid;			}
	public void   setUserid(String userid) 	{	this.userid = userid;	}

	public String getUserpw() 				{	return userpw;			}
	public void   setUserpw(String userpw) 	{	this.userpw = userpw;	}
	
	public String getUsername() 				{	return username;			}
	public void   setUsername(String username) 	{	this.username = username;	}

	public char getEmailverify() 					{	return emailverify;				}
	public void setEmailverify(char emailverify) 	{	this.emailverify = emailverify;	}


	/*
	 * toString()
	 */
	@Override
	public String toString() {
		
		String voInfo = new StringBuffer().append("USER ID : ").append(userid)
			.append(" || USERPW : ").append(userpw).append(" || USERNAME : ").append(username).toString();
		
		return voInfo;
	}
	
}
