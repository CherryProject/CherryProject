package com.cherryproject.www.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryproject.www.dao.MyCardInfoDAO;
import com.cherryproject.www.vo.MyCardInfoVO;
import com.google.gson.Gson;

/*
 * @comment	:	내가 만든 명함과 보유하고 있는 명함을 조회
 */

@Controller
@RequestMapping("mycard")
public class MyCardInfoController {

	@Inject
		private MyCardInfoDAO myCardInfoDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MyCardInfoController.class);
	
	final String myCarduploadPath = "/BusinessCardProject/management/myCardInfo/";		// 내 명함 파일 업로드 경로
	
	/*
	 * @comment		: 내 명함 등록 페이지로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value="insertMyCard", method=RequestMethod.GET)
	public String insertCardPage() {
		
		logger.info("Move Insert My Card Page");
		
		return "myInfo/insertCard";
		
	}
	
	/*
	 * @comment	:	내 명함을 볼 수 있는 페이지로 이동
	 * @author	:	정보승
	 */
	@RequestMapping(value="myCardInfo", method=RequestMethod.GET)
	public String myCardInfo(HttpSession session, Model model) {
		
		logger.info("Move My Card Info Page");
		
		String userid = (String) session.getAttribute("userid");
		
		ArrayList<MyCardInfoVO> allMyCardList = myCardInfoDAO.selectAllMyCard(userid);
		
		if(allMyCardList != null) {
			
			logger.info("Move My Card Info Page Success");
			model.addAttribute("allMyCardList", allMyCardList);
			
			return "myInfo/cardList";
		}
		else {
			
			logger.info("Move My Card Info Page Fail");
			
			return "redirect:../";
		}
		
	}
	
	/*
	 * @comment	:	나의 카드정보를 담은 리스트
	 * @author	:	여지원
	 */
	@ResponseBody
	@RequestMapping(value="getMyCards", method=RequestMethod.GET, produces="text/plain; charset=UTF-8")
	public String getMyCards(HttpSession session) {
		
		logger.info("getMyCards Success 시작");
		
		String userid = (String) session.getAttribute("userid");
		String result = "";
		
		ArrayList<MyCardInfoVO> list = null;
		list = myCardInfoDAO.selectAllMyCard(userid);
		Gson gson = new Gson();
		
		result = gson.toJson(list);
		
		logger.info("getMyCards Success 종료!");
		return result;
		
	}


	/**
	 * @comment				:	파일 다운로드
	 * @param mycardnum 	:	내 명함 번호
	 * @author 				:	정보승
	 */
	@ResponseBody
	@RequestMapping(value = "download", method = RequestMethod.GET, produces="text/plain; charset=UTF-8")
	public String fileDownload(String mycardnum, Model model,
								HttpServletResponse response, HttpSession session) {
		
		logger.info("Download Start");
		
		String userid = (String) session.getAttribute("userid");
		HashMap<String, Object> myCard = new HashMap<>();
		myCard.put("userid", userid);
		myCard.put("mycardnum", mycardnum);
		
		
		MyCardInfoVO myOneCard = myCardInfoDAO.selectOneMyCard(myCard);
		
		//원래의 파일명
		String originalfile = myOneCard.getFrontimgoriginal();
		try {
			
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String filepath = new StringBuffer().append(myCarduploadPath).append(userid).append("/").toString();
		String fullPath = new StringBuffer().append(filepath).append(myOneCard.getFrontimgsaved()).toString();
		
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}

		return null;
	}
}
