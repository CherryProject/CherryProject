package com.cherryproject.www.dao;

import java.util.ArrayList;

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
			logger.info("Select All My Card Result : " + allMyCard.size());
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

}