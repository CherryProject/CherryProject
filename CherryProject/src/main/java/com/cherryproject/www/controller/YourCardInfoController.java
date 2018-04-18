package com.cherryproject.www.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryproject.www.common.util.FileService;
import com.cherryproject.www.common.util.GoogleVisionApi;
import com.cherryproject.www.dao.MyCardInfoDAO;
import com.cherryproject.www.dao.YourCardInfoDAO;
import com.cherryproject.www.vo.MyCardInfoVO;
import com.cherryproject.www.vo.YourCardInfoVO;

/*
 * @comment	받은 명함 관리 처리 Controller
 */

@Controller
@RequestMapping("yourcard")
public class YourCardInfoController {

	@Inject 
		private YourCardInfoDAO yourCardInfoDAO;
	@Inject
		private MyCardInfoDAO myCardInfoDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(YourCardInfoController.class);

	final String yourCarduploadPath = "/BusinessCardProject/management/yourCardInfo/";	// 받은 명함 파일 업로드 경로
	final String myCarduploadPath = "/BusinessCardProject/management/myCardInfo/";		// 내 명함 파일 업로드 경로
	final String detectFilePath = "BusinessCardProject\\management\\temp\\";			// OCR 처리할 파일이 있는 경로
	final String uploadPath = "/BusinessCardProject/management/temp/";					// OCR 처리할 파일을 만드는 경로
	
	
	/*
	 * @comment		: 다른 사람 명함 등록 페이지로 이동
	 * @author		: 정보승
	 */
	@RequestMapping(value="insertYourCard", method=RequestMethod.GET)
	public String insertCardPage() {
		
		logger.info("Move Insert Your Card Page");
		
		return "myInfo/insertCard";
		
	}
	
	
	/*
	 * @comment		: 다른 사람 명함 등록 
	 * @author		: 정보승
	 */
	@RequestMapping(value = "insertYourCard", method = RequestMethod.POST)
	public String yourCardInsert(YourCardInfoVO yourCard
								, MultipartFile upload
								, HttpSession session
								,  Model model) {
		
		logger.info("yourCardInsert");
		
		// 세션을 통해 회원 ID를 가져와서 저장.
		String userid = (String) session.getAttribute("userid");
		yourCard.setUserid(userid);
		yourCard.setFrontimgsaved("img");
//		yourCard.setMycardnum("mbc14");
		logger.info("MEMO : " + yourCard.toString());
		//logger.info(upload.getOriginalFilename());
		
		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 YourCardInfoVO객체에 세팅
//		if (!upload.isEmpty()) {
//			
//			String filepath = new StringBuffer().append(yourCarduploadPath).append(yourCard.getUserid()).append("/").toString() ;
//			String savedfile = FileService.saveFile(upload, filepath);
//			yourCard.setFrontimgoriginal(upload.getOriginalFilename());
//			yourCard.setFrontimgsaved(savedfile);
//		}
		
//		yourCardInfoDAO
		boolean insertIs = yourCardInfoDAO.yourCardInsert(yourCard);
		
		if(insertIs) {
			
			logger.info("Insert Your Card Success");
//			model.addAttribute("resultMsg", "정상 등록 되었습니다.");
			return "redirect:../management";
		}
		else {
			
			logger.info("Insert Your Card Fail");
//			model.addAttribute("failMsg", "등록 실패하였습니다.");
			return "redirect:../management";
		}
		
	}
	
	
	
	/*
	 * @comment		:	업로드한 이미지를 분석하기 위한 메소드
	 * @param		:	OCR 분석을 위해 업로드한 이미지의 파일명
	 * @return		:	OCR 분석 결과
	 * @author		:	정보승
	 */
	@ResponseBody
	@RequestMapping(value="detectTextFromImage", method=RequestMethod.GET, produces="text/plain; charset=UTF-8")
	public String detectTextFromImage(String ocrImage) {
		
		logger.info("detectTextFromImage Start");
		
		String detectResult = "";	// OCR 분석 결과를 담을 변수
		
		// OCR 분석을 위한 이미지를 불러올 경로
		String filepath = new StringBuffer().append("c:\\").append(detectFilePath).append(ocrImage).toString();

		try {
			
			// OCR분석 결과
			detectResult = GoogleVisionApi.detectText(filepath);
			logger.info("분석 결과 : " + detectResult);
		}
		catch (Exception e) {
			
			logger.info("detectTextFromImage Fail");
		}
		
		// OCR 분석 후 삭제할 이미지 경로
//		String deleteFile = new StringBuffer().append(uploadPath).append(ocrImage).toString();
		String deleteFile = new StringBuffer().append(uploadPath).toString();
		
		// OCR 분석 후 이미지 삭제
		File files[] = new File(deleteFile).listFiles();
		
		for(int i=0; i<files.length; i++) {

			files[i].delete();
			logger.info("Image Delete Success");
		}
//		if(new File(deleteFile).delete()) {
//			logger.info("Image Delete Success" + deleteFile);
//		}
		
		return detectResult;
		
	}
	
	
	
	/*
	 * @comment		:	분석하기 위한 이미지를 임시로 업로드하는 메소드
	 * @param		:	AJAX로 미리보기 이미지를 받는 인터페이스
	 * @author		:	정보승
	 */
	@ResponseBody
	@RequestMapping(value="tempUpload", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String tempUpload(MultipartHttpServletRequest multi) {

		
		logger.info("tempUpload Start");

		// fileObj라는 key를 가진 파일을 가져오기
		MultipartFile testSample = multi.getFile("fileObj");
		String ocrImage = "";
		
		logger.info(testSample.getOriginalFilename());
		
		// fileObj의 파일명 생성
		if (!testSample.isEmpty()) {
			
			ocrImage = FileService.saveFile(testSample, uploadPath);
		}
		
		return ocrImage;
		
	}
	
	
	
	/*
	 * @comment		: 명함 삭제
	 * @author		: 여지원
	 */
	@ResponseBody
	@RequestMapping(value="yourCardDel", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String yourCardInfoDel(String yourcardnum, HttpSession session) {
		
		logger.info("Delete One YourCardInfo");
		
		String userid = (String) session.getAttribute("userid");
		
		// 회원 ID와 받은 명함 번호를 이용해 삭제
		HashMap<String, String> deleteYourCard = new HashMap<>();
		deleteYourCard.put("userid", userid);
		deleteYourCard.put("yourcardnum", yourcardnum);
		
		boolean deleteIs = yourCardInfoDAO.deleteYourCardOne(deleteYourCard);
		
		if(deleteIs) {
			
			logger.info("Delete One YourCardInfo Success");
			return "정상 삭제 되었습니다.";

		}
		else {
			
			logger.info("Delete One YourCardInfo Fail");
			return "삭제 실패하였습니다.";
		}
		
	
	}
	
	
	
	/*
	 * @comment				:	수정하고자 하는 받은 명함의 정보를 수정하기 전에 세션에 등록하는 메소드.
	 * @param	yourcardnum	:	받은 명함의 등록번호
	 * 			session		:	회원의 ID를 받기 위함.
	 * @author				:	정보승
	 */
	@RequestMapping(value="registerSession", method = RequestMethod.GET)
	public String registerSession (String yourcardnum, HttpSession session) {
		
		logger.info("Update Original CardInfo Session Register Start");
		
		String userid = (String) session.getAttribute("userid");
		
		HashMap<String, String> updateYourCardInfo = new HashMap<>();
		updateYourCardInfo.put("userid", userid);
		updateYourCardInfo.put("yourcardnum", yourcardnum);
		
		// 수정하고자 하는 명함 정보를 세션에 등록하기 위해 DB에서 가져온다.
		YourCardInfoVO originalYourCardInfo = yourCardInfoDAO.selectYourCardOne(updateYourCardInfo);
		
		// Session에 수정하고자 하는 명함의 정보를 등록한다.
		session.setAttribute("originalYourCardInfo", originalYourCardInfo);
		
		logger.info("세션에 등록된 기존 명함 정보 : " + session.getAttribute("originalYourCardInfo").toString());
		
//		mod
		
		return "";
	}
	
	
	
	/*
	 * @comment		: 명함 정보수정
	 * @author		: 여지원
	 */
	@ResponseBody
	@RequestMapping(value="yourCardUpdate", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String yourCardUpdate(String yourcardnum, HttpSession session) {
		
		logger.info("Delete One YourCardInfo");
		
		// 회원의 ID와 기존의 수정되기 전의 받은 명함정보를 세션에서 가져온다.
		String userid = (String) session.getAttribute("userid");
		YourCardInfoVO originalYourCardInfo = (YourCardInfoVO) session.getAttribute("originalYourCardInfo");
		
		
		// 회원 ID와 받은 명함 번호를 이용해 삭제
		HashMap<String, String> deleteYourCard = new HashMap<>();
		deleteYourCard.put("userid", userid);
		deleteYourCard.put("yourcardnum", yourcardnum);
		
		boolean deleteIs = yourCardInfoDAO.deleteYourCardOne(deleteYourCard);
		
		if(deleteIs) {
			
			logger.info("Delete One YourCardInfo Success");
			return "정상 삭제 되었습니다.";

		}
		else {
			
			logger.info("Delete One YourCardInfo Fail");
			return "삭제 실패하였습니다.";
		}
		
	
	}
	
	
	
	/**
	 * 파일 다운로드
	 * @param boardnum 파일이 첨부된 글 번호
	 */
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(String yourcardnum, Model model,
								HttpServletResponse response, HttpSession session) {
		
		String userid = (String) session.getAttribute("userid");
		HashMap<String, String> temp = new HashMap<>();
		temp.put("yourcardnum", yourcardnum);
		temp.put("userid", userid);
		
		YourCardInfoVO oneYourCard = yourCardInfoDAO.selectYourCardOne(temp);
		
		//원래의 파일명
		String originalfile = new String(oneYourCard.getFrontimgoriginal());
		try {
			
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String filepath = new StringBuffer().append(yourCarduploadPath).append(oneYourCard.getUserid()).append("/").toString();
		String fullPath = filepath + oneYourCard.getFrontimgsaved();
		
		
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
/*	
	
	 * @comment	:	나의 카드정보를 담은 리스트
	 * @author	:	여지원
	 
	@ResponseBody
	@RequestMapping(value="getMyCards", method=RequestMethod.GET)
	public ArrayList<MyCardInfoVO> getMyCards(HttpSession session) {
		
		//produces="text/plain; charset=UTF-8"
		
		
		logger.info("getMyCards Success 성공");
		
		String userid = (String) session.getAttribute("userid");
		System.out.println("유저아이디");
		System.out.println(userid);
		ArrayList<MyCardInfoVO> list = null;
		list = myCardInfoDAO.selectAllMyCard("ik872000@gmail.com");
		System.out.println(list);
		
		return list;
		
	}*/
	
	
	
}
