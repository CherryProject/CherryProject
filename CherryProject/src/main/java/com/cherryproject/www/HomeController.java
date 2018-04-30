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
import org.springframework.web.bind.annotation.RequestParam;

import com.cherryproject.www.dao.MyCardInfoDAO;
import com.cherryproject.www.dao.UserInfoDAO;
import com.cherryproject.www.dao.YourCardInfoDAO;
import com.cherryproject.www.vo.MyCardInfoVO;
import com.cherryproject.www.vo.UserInfoVO;
import com.cherryproject.www.vo.YourCardInfoVO;
import com.google.gson.Gson;

/**
 * @comment    Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   @Inject
      private YourCardInfoDAO yCardInfoDAO;
   
   @Inject
      private MyCardInfoDAO mCardInfoDAO;
   @Inject
      private UserInfoDAO userInfoDAO;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   
   /*
    * @comment      : home.jsp로 이동
    * @author      : 정보승
    */
   @RequestMapping(value = "/home", method = RequestMethod.GET)
   public String home2(Model model) {
      
      logger.info("Move Home Page");
      
      
      
      return "home";
   }
   
   /*
    * @comment      : loginForm.jsp로 이동
    * @author      : 정보승
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Model model) {
      
      logger.info("Move Home Page");
      
      model.addAttribute("msg", null);
      
      return "loginForm";
   }
   
   
   
   /*
    * @comment      : myInfo.jsp로 이동
    * @author      : 정보승
    */
   @RequestMapping(value = "myInfo", method = RequestMethod.GET)
   public String myInfoPage(HttpSession session, Model model) {
      
      logger.info("Move MyInfo Page");
      
      String userid = (String) session.getAttribute("userid");
      
      int yourCardCnt = yCardInfoDAO.cntYourCard(userid);
      ArrayList<YourCardInfoVO> recentResult = yCardInfoDAO.recent5YourCard(userid);
      
      /*여지원 대표이미지표시를 위해 mycardnum이 필요*/
      String profileCardNum = userInfoDAO.getProfile(userid);
      System.out.println(yourCardCnt);
      System.out.println("-------------------------");
      System.out.println(profileCardNum);
      model.addAttribute("profileCardNum", profileCardNum);
      model.addAttribute("yourCardCnt", yourCardCnt);
      model.addAttribute("recentResult", recentResult);
      
      return "myInfo/myInfo";
   }
   
   
   
   /*
    * @comment      : cardList.jsp로 이동(내 명함 관리페이지)
    * @author      : 정보승
    */
   @RequestMapping(value = "cardList", method = RequestMethod.GET)
   public String cardListPage(HttpSession session, Model model) {
      
      logger.info("Move cardList Page");
      
      String userid = (String) session.getAttribute("userid");
      
      ArrayList<MyCardInfoVO> myCardList = mCardInfoDAO.selectAllMyCard(userid);
      int listLen = myCardList.size();
      
      if(myCardList != null && listLen != 0) {
         
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
    * @comment         : management.jsp로 이동
    * @param   session : 로그인된 ID에 따라 다른 카드 정보를 출력하기 위함.
    *          model   : DB에서 가져온 카드 관리 목록을 management.jsp로 이동하기 위함.
    * @author         : 정보승
    */
   @RequestMapping(value = "management", method = RequestMethod.GET)
   public String managementPage(HttpSession session, Model model) {
      
      logger.info("Move Management Page");
      
      String userid = (String) session.getAttribute("userid");
      ArrayList<YourCardInfoVO> resultList = null;
      Gson gson = new Gson();
      String yourCardList = "";
         
      resultList = yCardInfoDAO.selectAllCard(userid);
      
      int resultSize = resultList.size();
      if(resultList != null && resultSize != 0) {
         
         logger.info("YourCardInfo List Success");
         model.addAttribute("yourCardList", resultList);      // 화면에 사진을 보이기 위한 리스트
         
         yourCardList = gson.toJson(resultList);   // 리스트가 JSON형태로 변환
         model.addAttribute("jsonList", yourCardList);   // 검색을 위한 JSON 리스트
      }
      else {
            
         logger.info("YourCardInfo List Fail");
      }
      
      return "management/management";
   }

   
   
   /*
    * @comment      : templateList.jsp로 이동
    * @author      : 정보승
    */
   @RequestMapping(value = "templateList", method = RequestMethod.GET)
   public String templateListPage(Model model) {
      
      logger.info("templateList");
      
      return "templateList/templateList";
   }
   
   
   /*
    * @comment      : tool.jsp로 이동
    * @author      : 정보승
    */
   @RequestMapping(value = "tool", method = RequestMethod.GET)
   public String toolPage(Model model, @RequestParam(value="src", defaultValue="") String src) {
                     //정현수 parameter값이 있을 경우 src로 받고 없을 경우 default "" 값이 들어온다.
      logger.info("Move Tool Page");
      
      model.addAttribute("src",src);
      
      return "tool/tool";
   }
   
   
   /*
    * @comment      : contact 메뉴로 이동
    * @author      : 여지원
    */
   @RequestMapping(value = "contact", method = RequestMethod.GET)
   public String contactPage(Model model) {
      
      logger.info("Move Contact Page");
      
      
      /*contact 밑에 또 jsp가 들어가는건데 헷갈리기 쉬워 그냥 jsp 이름을 contactMain이라고했습니다.*/
      return "contact/contactMain";
   }
   
   
   
   /*
    * @author   : 전병익
    * @comment   : 검색어에 맞춰 필요한 데이터만 다시 가져옴   
    */
   @RequestMapping(value = "search", method = RequestMethod.POST)
   public String search(HttpSession session, Model model, String q) {
      
      logger.info("Move Management Search Page");
//      String keyword = (String) session.getAttribute("search");
      String userid = (String) session.getAttribute("userid");
      
      HashMap<String, String> autoComplete = new HashMap<>();
      autoComplete.put("userid", userid);
      autoComplete.put("search", q);
      
      logger.info("검색어 : " + q);
      
      ArrayList<YourCardInfoVO> resultList = null;
      Gson gson = new Gson();
      
      String yourCardList = "";
      resultList = yCardInfoDAO.selectAllCard(userid);
      yourCardList = gson.toJson(resultList);   // 리스트가 JSON형태로 변환
      
      //검색어가 없을 경우 전체 데이터를 다시 가져옴
      if(q.equals("") || q.length() == 0 || q == null){
         
         logger.info("Search YourCardInfo Selected All List Success");
         model.addAttribute("yourCardList", resultList);   // 화면에 추가할 객체 추가
      }
      else {
         
         resultList = yCardInfoDAO.selectSearchCard(autoComplete);
         
         if(resultList != null && resultList.size() != 0) {
            
            logger.info("Search YourCardInfo Selected List Success");
            model.addAttribute("yourCardList", resultList);
         }
         else {
            
            logger.info("Search YourCardInfo Selected List Fail");
         }
      }
      
      model.addAttribute("jsonList", yourCardList);   // JSON파일을 추가
      
      return "management/management";
   }
   
   
   
   

}
