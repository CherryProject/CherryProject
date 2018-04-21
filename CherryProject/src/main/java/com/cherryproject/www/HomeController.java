package com.cherryproject.www;

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

import com.cherryproject.www.dao.MyCardInfoDAO;
import com.cherryproject.www.dao.YourCardInfoDAO;
import com.cherryproject.www.vo.MyCardInfoVO;
import com.cherryproject.www.vo.YourCardInfoVO;

import net.sf.json.JSONArray;

/**
 * @comment 	Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
		private YourCardInfoDAO yCardInfoDAO;
	
	@Inject
		private MyCardInfoDAO mCardInfoDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*
	 * @comment		: home.jsp로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("Move Home Page");
		
		return "home";
	}
	
	
	
	/*
	 * @comment		: myInfo.jsp로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value = "myInfo", method = RequestMethod.GET)
	public String myInfoPage(Model model) {
		
		logger.info("Move MyInfo Page");
		
		return "myInfo/myInfo";
	}
	
	
	
	/*
	 * @comment		: cardList.jsp로 이동(내 명함 관리페이지)
	 * @author		: 정보승
	 */
	@RequestMapping(value = "cardList", method = RequestMethod.GET)
	public String cardListPage(HttpSession session, Model model) {
		
		logger.info("Move cardList Page");
		
		String userid = (String) session.getAttribute("userid");
		
		ArrayList<MyCardInfoVO> myCardList = mCardInfoDAO.selectAllMyCard(userid);
//		int listLen = myCardList.size();
		
		if(myCardList != null && myCardList.size() != 0) {
			
			logger.info("myCardList Success");
			
			model.addAttribute("cardColor", new int[]{1, 2, 3});
			model.addAttribute("myCardList", myCardList);
		}
		else {
			
			logger.info("myCardList Fail");
			
		}
		
		return "myInfo/cardList";
	}
	
	
	
	/*
	 * @comment			: management.jsp로 이동
	 * @param	session : 로그인된 ID에 따라 다른 카드 정보를 출력하기 위함.
	 * 			model	: DB에서 가져온 카드 관리 목록을 management.jsp로 이동하기 위함.
	 * @author			: 정보승
	 */
	@RequestMapping(value = "management", method = RequestMethod.GET)
	public String managementPage(HttpSession session, Model model) {
		
		logger.info("Move Management Page");
		
		String userid = (String) session.getAttribute("userid");
		
		ArrayList<YourCardInfoVO> resultList = yCardInfoDAO.selectAllCard(userid);
		String yourCardList = "";
		
		if(resultList != null && resultList.size() != 0) {
			
			logger.info("YourCardInfo List Success");
			model.addAttribute("yourCardList", resultList);
			
//			Gson gson = new Gson();
//			yourCardList = gson.toJson(resultList);	// 리스트가 JSON형태로 변환
			
			JSONArray jarray = new JSONArray();    // JSON 배열  []
			model.addAttribute("jsonList", jarray.fromObject(resultList));	// JSON파일을 추가
			
		}
		else {
			
			logger.info("YourCardInfo List Fail");
		}
		
		return "management/management";
	}
	
	
	
	
	
	
	/*
	 * @comment		: templateList.jsp로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value = "templateList", method = RequestMethod.GET)
	public String templateListPage(Model model) {
		
		logger.info("templateList");
		
		return "templateList/templateList";
	}
	
	
	/*
	 * @comment		: tool.jsp로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value = "tool", method = RequestMethod.GET)
	public String toolPage(Model model) {
		
		logger.info("Move Tool Page");
		
		return "tool/tool";
	}
	
	
	/*
	 * @comment		: contact 메뉴로 이동
	 * @author		: 여지원
	 */
	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contactPage(Model model) {
		
		logger.info("Move Contact Page");
		
		
		/*contact 밑에 또 jsp가 들어가는건데 헷갈리기 쉬워 그냥 jsp 이름을 contactMain이라고했습니다.*/
		return "contact/contactMain";
	}
	
	
	/*
	 * @comment	:처음 정보를 가져올 때
	 * @author	:전병익
	 */
	@ResponseBody
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public ArrayList<YourCardInfoVO> search(HttpSession session) {
		
		logger.info("Move Management Page");
				
		String userid = (String) session.getAttribute("userid");
		
		ArrayList<YourCardInfoVO> search = yCardInfoDAO.selectAllCard(userid);
		// String jsonArray = "제이슨문자열을 변환";
		if(search != null && search.size() != 0) {
			
			logger.info("YourCardInfo searchlist Success");			
		}
		else {			
			logger.info("YourCardInfo searchlist Fail");
		}
		
		return search;
	}
	
	
	/*
	 * @author	: 전병익
	 * @comment	: 검색어에 맞춰 필요한 데이터만 다시 가져옴	
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(HttpSession session, Model model, String autocomplete) {
		
		logger.info("Move Management Page");
//		String keyword = (String) session.getAttribute("search");
		String userid = (String) session.getAttribute("userid");
		HashMap<String, String> autoComplete = new HashMap<>();
		autoComplete.put("userid", userid);
		autoComplete.put("search", autocomplete);
		logger.info(autocomplete);
		
		ArrayList<YourCardInfoVO> resultList = yCardInfoDAO.selectSearchCard(autoComplete);
		//검색어가 없을 경우 전체 데이터를 다시 가져옴
		if(autocomplete == ""){
			return managementPage(session, model);
		}
		
		
		if(resultList != null && resultList.size() != 0) {
			
			logger.info("YourCardInfo Selected List Success");
			model.addAttribute("yourCardList", resultList);
		}
		else {
			
			logger.info("YourCardInfo Selected List Fail");
		}
		
		return "management/management";
	}
	
	
	
	

}

