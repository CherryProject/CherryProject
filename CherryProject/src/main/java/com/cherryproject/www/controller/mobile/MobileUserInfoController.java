package com.cherryproject.www.controller.mobile;

import java.io.File;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cherryproject.www.dao.UserInfoDAO;
import com.cherryproject.www.vo.MyCardInfoVO;
import com.cherryproject.www.vo.UserInfoVO;

@Controller
@RequestMapping("mobile/users")
@SessionAttributes("user")
public class MobileUserInfoController {

	@Inject
		private UserInfoDAO userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MobileUserInfoController.class);
	
	final String uploadPath = "/BusinessCardProject/management/temp/";
	
	/* 
	 * @comment				: 회원 로그인 처리
	 * @param	loginInfo	: View에서 입력받은 User ID와 User Pw를 저장하고 있는 객체
	 * 			session		: 로그인 성공 시 User ID를 저장
	 * 			model		: 로그인 실패 시 실패 메시지를 User에게 알리기 위한 메시지 저장
	 * @author				: 정보승
	 */
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String userLogin(UserInfoVO loginInfo) {
		
		logger.info("User Loing Start");
		
		String loginResult = "";
		
		// View에서 입력받은 ID와 PW를 각각 HashMap에 저장
		HashMap<String, Object> userAccount = new HashMap<>();
		userAccount.put("userid", loginInfo.getUserid());
		userAccount.put("userpw", loginInfo.getUserpw());
		
		// DAO를 통해 받은 User의 정보를 user 객체에 저장
		UserInfoVO user = userDao.selectUser(userAccount);
		char userVerified = (user != null) ? user.getEmailverify() : 'N';	// E-mail 인증 여부
		
		// E-mail 인증까지 모두 마친 로그인
		if(user != null && userVerified == 'Y') {
			
			logger.info("User Login Success");
			
			loginResult = "true";
			
		}
		
		// E-mail 인증이 되지 않은 로그인
		else if(user != null && userVerified == 'N') {
			
			logger.info("User Login Fail - Email Verify Fail");

			loginResult = "false";
		}
		else {
			
			logger.info("User Login Fail");
			
			loginResult = "false";
		}
		
		return loginResult;
	}
	
	
	
	/*
	 * @comment		: 내 명함 등록 
	 * @author		: 정보승
	 */
	@ResponseBody
	@RequestMapping(value = "myCardInsert", method = RequestMethod.POST)
	public String myCardInsert(MyCardInfoVO myCard, String division, Model model) {
		
		logger.info("myCardInsert");
		
		
		
		return "redirect:../management";
	}
	
	
	
	/*
	 * @comment		: 회원 로그아웃
	 * @author		: 정보승
	 */
	@ResponseBody
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String myCardInsert(HttpSession session) {
		
		logger.info("Logout Start");
		
		String userid = (String) session.getAttribute("userid");
		
		String deleteFile = new StringBuffer().append(uploadPath).append(userid).toString();
		
		// temp 폴더의 회원 ID 폴더의 모든 이미지를 삭제
		File files[] = new File(deleteFile).listFiles();
		
		if(files != null ) {
			for(int i=0; i<files.length; i++) {
	
				files[i].delete();
				logger.info("Image Delete Success");
			}
		}
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
}
