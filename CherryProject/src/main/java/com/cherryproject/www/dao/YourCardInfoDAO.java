package com.cherryproject.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.cherryproject.www.vo.YourCardInfoVO;

/*
 * @comment	받은 명함 관리 처리 DAO
 */

@Repository
public class YourCardInfoDAO {
	
	@Inject
		private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(YourCardInfoDAO.class);
	
	/*
	 * @comment		:	회원이 받은 모든 명함을 가져오는 메소드.
	 * @param		:	회원의 ID
	 * @return		:	회원이 받아서 등록, 관리하는 모든 명함 	정보.
	 * @author		:	정보승
	 */
	public ArrayList<YourCardInfoVO> selectAllCard(String userid) {
		
		logger.info("YourCardInfo List");
		
		YourCardInfoMapper mapper = sqlSession.getMapper(YourCardInfoMapper.class);
		ArrayList<YourCardInfoVO> resultList = null;
		
		try {
			
			resultList = mapper.selectAllCard(userid);
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		if(resultList != null && resultList.size() != 0) {
			
			logger.info("YourCardInfo List Success");
		}
		else {
			
			logger.info("YourCardInfo List Fail");
		}
		
		return resultList;
	}
	
	
	/*
	 * @comment		:	회원이 받은 명함을 등록하는 메소드.
	 * @param		:	받은 명함의 정보.
	 * @return		:	받은 명함의 등록 여부
	 * @author		:	정보승
	 */
	public boolean yourCardInsert(YourCardInfoVO insertYourCardInfo) {
		
		logger.info("YourCardInfo Insert");
		
		YourCardInfoMapper mapper = sqlSession.getMapper(YourCardInfoMapper.class);
		int insertIs = 0;
		
		try {
			
			insertIs = mapper.yourCardInsert(insertYourCardInfo);
			logger.debug("Insert Your Card Num : {}", insertIs);
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		if(insertIs == 1) {
			
			logger.info("Insert Your Card Success");
			return true;
		}
		else {
			
			logger.info("Insert Your Card Fail");
			return false;
		}
		
	}
	
	
	/*
	 * @comment		: 하나의 명함 정보 선택
	 */
	public YourCardInfoVO selectYourCardOne(HashMap<String, String> selectYourCard) {
		
		logger.info("Select One YourCardInfo");
		
		YourCardInfoMapper mapper = sqlSession.getMapper(YourCardInfoMapper.class);
		YourCardInfoVO resultYourCard = null;
		
		try {
			
			resultYourCard = mapper.selectYourCardOne(selectYourCard);
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		if(resultYourCard != null) {
			
			logger.info("Select One YourCardInfo Success");
		}
		else {
			
			logger.info("Select One YourCardInfo Fail");
		}
		
		return resultYourCard;
		
	}
	
	
	/*
	 * @comment		: 명함 삭제 (1개)
	 * @author		: 정보승
	 */
	public boolean deleteYourCardOne(HashMap<String, String> deleteYourCard) {
		
		logger.info("Delete One YourCardInfo");
		YourCardInfoMapper mapper = sqlSession.getMapper(YourCardInfoMapper.class);
		int deleteCnt = 0;
		
		try {
			
			deleteCnt = mapper.deleteYourCardOne(deleteYourCard);
		}
		catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(deleteCnt == 1) {
			
			logger.info("Delete One YourCardInfo Success");
			return true;
		}
		else {
			
			logger.info("Delete One YourCardInfo Fail");
			return false;
		}
		
	}
}
