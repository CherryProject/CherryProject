package com.cherryproject.www.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryproject.www.common.util.FileService;
import com.cherryproject.www.dao.MyCardInfoDAO;
import com.cherryproject.www.vo.MyCardInfoVO;

import net.sf.json.JSON;

/*
 * @comment	:	내가 만든 명함과 보유하고 있는 명함을 조회
 */

@Controller
@RequestMapping("mycard")
public class MyCardInfoController {

	@Inject
		private MyCardInfoDAO myCardInfoDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MyCardInfoController.class);
	
	
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
	public HashMap<String, Object> getMyCards(HttpSession session) {
		//produces="text/plain; charset=UTF-8"
		
		
		logger.info("getMyCards Success 시작");
		
		String userid = (String) session.getAttribute("userid");
		System.out.println("유저아이디");
		System.out.println(userid);
		
		ArrayList<MyCardInfoVO> list = null;
		list = myCardInfoDAO.selectAllMyCard(userid);
		
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("list", list);
		System.out.println(list);

		logger.info("getMyCards Success 종료");
		
		
		return hashmap;
		
	}
}
