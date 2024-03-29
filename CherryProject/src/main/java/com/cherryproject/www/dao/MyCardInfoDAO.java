	package com.cherryproject.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.cherryproject.www.vo.MyCardInfoVO;

/*
 * @comment	:	내 명함을 관리하는 DAO
 */

@Repository
public class MyCardInfoDAO {
	
	@Inject
		private SqlSession	sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MyCardInfoDAO.class);

	
	/*
	 * @comment	:	전체 내 명함 가져오기	
	 * @param	:	회원 ID
	 * @return	:	회원이 보유하고 있는 자신의 명함 전체 리스트
	 * @author	:	정보승	
	 */
	public ArrayList<MyCardInfoVO> selectAllMyCard(String userid) {
		
		logger.info("Select All My Card");
		
		ArrayList<MyCardInfoVO> allMyCard = null;
		MyCardInfoMapper mapper = sqlSession.getMapper(MyCardInfoMapper.class);
		
		try {
			
			allMyCard = mapper.selectAllMyCard(userid);
			logger.info("Select All My Card Result");
		}
		catch (Exception e) {
			
			logger.info(e.toString());
		}
		
		
		if(allMyCard != null) {
			
			logger.info("Select All My Card Success");
		}
		else {
			
			logger.info("Select All My Card Fail");
		}
		
		return allMyCard;
		
	}

	
	
	/*
	 * @comment	:	내 명함 1개 가져오기
	 * @param	:	회원 ID와 원하는 카드 번호
	 * @author	:	정보승
	 */
	public MyCardInfoVO selectOneMyCard(HashMap<String, Object> myCard) {
		
		logger.info("Select One My Card");
		
		MyCardInfoVO oneMyCard = null;
		MyCardInfoMapper mapper = sqlSession.getMapper(MyCardInfoMapper.class);
		
		try {
			
			oneMyCard = mapper.selectOneMyCard(myCard);
			logger.info("Select One My Card Result : ");
		}
		catch (Exception e) {
			
			logger.info(e.toString());
		}
		
		
		if(oneMyCard != null) {
			
			logger.info("Select One My Card Success");
		}
		else {
			
			logger.info("Select One My Card Fail");
		}
		
		return oneMyCard;
		
	}
	
	
	
	/*
	 * @comment	:	명함 등록하기	
	 * @param	:	MyCardInfoVO
	 * @author	:	정현수	
	 */
	
	public void insertMyCard (MyCardInfoVO mycard) {
		
		logger.info("Insert My Card Start");
		
		MyCardInfoMapper mapper = sqlSession.getMapper(MyCardInfoMapper.class);
		
		try {
			
			mapper.insertMyCard(mycard);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		logger.info("Insert My Card End");
	}
	
	
	/*
	 * @comment	:	내 명함 추가 정보 등록
	 * @author	:	정보승
	 */
	public boolean updateAddMyCard(MyCardInfoVO mycard) {
		
		logger.info("Update My Card Start");
		
		MyCardInfoMapper mapper = sqlSession.getMapper(MyCardInfoMapper.class);
		int updateCnt = 0;
		
		try {
			
			updateCnt = mapper.updateAddMyCard(mycard);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(updateCnt == 1) {
			
			logger.info("Update My Card Success");
			return true;
		}
		else {
			
			logger.info("Update My Card Fail");
			return false;
		}
		
	}
	
	
	
	
	/*
	 * @comment	:	회원 명함 1개 삭제
	 * @author	:	정보승
	 */
	public boolean deleteMyCard (HashMap<String, Object> deleteMyCard) {
		
		logger.info("Delete My Card Start");
		
		MyCardInfoMapper mapper = sqlSession.getMapper(MyCardInfoMapper.class);
		int deleteCnt = 0;
		
		try {
			
			deleteCnt = mapper.deleteMyCard(deleteMyCard);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(deleteCnt == 1) {
			
			logger.info("Delete My Card Success");
			return true;
		}
		else {
			
			logger.info("Delete My Card Fail");
			return false;
		}
	}
}
