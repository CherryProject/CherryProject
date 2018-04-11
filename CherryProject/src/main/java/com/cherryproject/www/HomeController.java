package com.cherryproject.www;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryproject.www.dao.YourCardInfoDAO;
import com.cherryproject.www.vo.YourCardInfoVO;

import net.sf.json.JSONArray;

/**
 * @comment 	Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
		private YourCardInfoDAO yCardInfoDAO;
	
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
	
//	@ResponseBody
//	@RequestMapping(value = "jsonList", method = RequestMethod.GET, produces="text/plain; charset=UTF-8")
//	public String jsonList(HttpSession session, Model model) {
//		
//		logger.info("Move Management Page");
//		
//		String userid = (String) session.getAttribute("userid");
//		
//		ArrayList<YourCardInfoVO> resultList = yCardInfoDAO.selectAllCard(userid);
//		String yourCardList = "";
//		
//		if(resultList != null && resultList.size() != 0) {
//			
//			logger.info("YourCardInfo List Success");
//			
//			Gson gson = new Gson();
//			yourCardList = gson.toJson(resultList);	// 리스트가 JSON형태로 변환
//			
//			JSONArray jarray = new JSONArray();    // JSON 배열  []
//	        JSONObject item = null;     // JSON 배열 내의 객체.   {}
//		}
//		else {
//			
//			logger.info("YourCardInfo List Fail");
//		}
//		
//		return yourCardList;	// JSON이 Management.jsp로 반환.
//	}
	
	
	/*
	 * @comment		: management.jsp로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value = "myInfo", method = RequestMethod.GET)
	public String myInfoPage(Model model) {
		
		logger.info("Move MyInfo Page");
		
		return "myInfo/myInfo";
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
	

}

