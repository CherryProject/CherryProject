package com.cherryproject.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.cherryproject.www.vo.MyCardInfoVO;

/*
 * @comment	:	내 명함 관리를 위한 Mapper
 */
public interface MyCardInfoMapper {

	// 정현수 : 내 명함 등록
	public void insertMyCard (MyCardInfoVO mycard); 
	
	// 정보승	:	내 명함 추가 정보 등록
	public int updateAddMyCard(MyCardInfoVO mycard);
	
	// 정보승 : 등록한 내 명함 전체 조회
	public ArrayList<MyCardInfoVO> selectAllMyCard(String userid) throws DataAccessException;
	
	// 정보승 : 등록한 내 명함 하나 조회
	public MyCardInfoVO selectOneMyCard(HashMap<String, Object> myCard);
	
	// 정보승 : 내 명함 하나 삭제
	public int deleteMyCard (HashMap<String, Object> deleteMyCard);
}
