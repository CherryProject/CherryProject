package com.cherryproject.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cherryproject.www.vo.YourCardInfoVO;

/*
 * @comment	받은 명함 관리 처리 mapper
 */

public interface YourCardInfoMapper {

	// 정보승 : 받은 명함 전체 가져오기
	public ArrayList<YourCardInfoVO> selectAllCard(String userid);
	
	// 정보승 : (모바일용) 받은 명함 전체 가져오기
	public ArrayList<YourCardInfoVO> mSelectAllCard (String userid);
	
	// 정보승 : 받은 명함 등록 갯수 조회
	public int cntYourCard(String userid);

	// 정보승 : 받은 명함 등록
	public int yourCardInsert(YourCardInfoVO insertYourCardInfo);
	
	// 정보승 : 하나의 명함 정보 선택
	public YourCardInfoVO selectYourCardOne(HashMap<String, String> selectYourCard);
	
	// 정보승 : 명함 삭제(1개)
	public int deleteYourCardOne(HashMap<String, String> deleteYourCard);
	
	// 전병익 : 검색한 명함 리스트를 가져옴
	public ArrayList<YourCardInfoVO> selectSearchCard(HashMap<String, String> autoComplete);
}
