package com.cherryproject.www.controller.mobile;

import java.util.ArrayList;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryproject.www.dao.YourCardInfoDAO;
import com.cherryproject.www.vo.YourCardInfoVO;
import com.google.gson.Gson;

@Controller
@RequestMapping("mobile/yourcard")
public class MobileYourCardInfoController {

	@Inject 
		private YourCardInfoDAO yourCardInfoDAO;

	private static final Logger logger = LoggerFactory.getLogger(MobileYourCardInfoController.class);
	
	final String yourCarduploadPath = "/BusinessCardProject/management/yourCardInfo/";	// 받은 명함 파일 업로드 경로
	final String myCarduploadPath = "/BusinessCardProject/management/myCardInfo/";		// 내 명함 파일 업로드 경로
	final String detectFilePath = "BusinessCardProject\\management\\temp\\";			// OCR 처리할 파일이 있는 경로
	final String uploadPath = "/BusinessCardProject/management/temp/";					// OCR 처리할 파일을 만드는 경로
	
	
	/*
	 * @comment			: (모바일용) 내가 받은 명함의 목록을 보내주는 메소드
	 * @param	userid  : 로그인된 ID
	 * @author			: 정보승
	 */
	@RequestMapping(value = "management", method = RequestMethod.GET, produces="text/plain; charset=UTF-8")
	public String managementPage(String userid) {
		
		logger.info("Mobile Management Page");
		
		ArrayList<YourCardInfoVO> resultList = yourCardInfoDAO.mSelectAllCard(userid);
		String yourCardList = "";
		
		if(resultList != null && resultList.size() != 0) {
			
			logger.info("Mobile YourCardInfo List Success");
			
			Gson gson = new Gson();
			yourCardList = gson.toJson(resultList);	// 리스트가 JSON형태로 변환
		}
		else {
			
			logger.info("Mobile YourCardInfo List Fail");
		}
		
		logger.info("YourCardInfo List : " + yourCardList);
		
		return yourCardList;
	}
	
}
