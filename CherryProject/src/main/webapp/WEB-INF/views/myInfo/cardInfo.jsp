<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 정보승 : CSS 및 JS 공통부분 -->

<html lang="ko">
<head>

	<title>Templates</title>
	
	<!-- 템플릿 리스트 CSS -->
	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Poppins:700" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/sign/css/Sign.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/normalize.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/menu.css "/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/icons.css "/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/menustyle.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/mycardtextlist/css/my_card_text_list.css" />">
	
	<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/> "> </script>
	<!-- 
	
	<script type="text/javascript" src="<c:url value="/resources/sign/js/Sign.js"/>"></script>
	 -->
	<script src="<c:url value="/resources/js/newMain_js/menu/modernizr.custom.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/mycardtextlist/js/my_card_text_list.js" />"></script>
	<script type="text/javascript">
	  $(function(){
		  var count = 0;
	    $('.bt-menu-trigger').click(function(){
	      if (count == 0) {
			$('#bt-menu').css('z-index','10');
		}else if (count == 1) {
			$('#bt-menu').css('z-index','0');
		}
	    });
	  });
	</script>
</head>
<body>

	<!-- 정보승 : <header>부분 -->
	<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
	
	<article>
			<ul>
				<li>
					<div class="img_box">
						<img class="stack__img" src="download?mycardnum=${selectMyCard.mycardnum }" />
					</div>
				</li>
				<li>
					<div class="card-container" >
						
						<div class="toggle"><i class="fa fa-user fa-pencil fa-lg"></i>
							<div class="tooltip">수정하기</div>
						</div>
						
						<div class="card login-register login-reset">
							<h1 class="title">Card info</h1>
							
							<div class = "input-container has-feedback">
							<input type="text" id="name1" name="name1" value="${selectMyCard.name1}" readonly="readonly" />
								<div class="check"></div>
								<div class="bar"></div>
							</div>
							
							<c:if test="${selectMyCard.name2 ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="name2" name="name2" value="${selectMyCard.name2}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.name3 ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="name3" name="name3" value="${selectMyCard.name3}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.company ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="company" name="company" value="${selectMyCard.company}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.department ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="department" name="department" value="${selectMyCard.department}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.job ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="job" name="job" value="${selectMyCard.job}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.tel ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="tel" name="tel" value="${selectMyCard.tel}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.phone ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="phone" name="phone" value="${selectMyCard.phone}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.email ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="email" name="email" value="${selectMyCard.email}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.address ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="address" name="address" value="${selectMyCard.address}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<c:if test="${selectMyCard.otherinfo2 ne null}">
								<div class = "input-container has-feedback">
								<input type="text" id="otherinfo2" name="otherinfo2" value="${selectMyCard.otherinfo2}" readonly="readonly" />
									<div class="check"></div>
									<div class="bar"></div>
								</div>
							</c:if>
							
							<div class="button-container">
							<button class="rkmd-btn btn-lightBlue ripple-effect float-right" onclick="insertProfileImage('${selectMyCard.mycardnum}')"><span>profile</span></button> 
								<button class="rkmd-btn btn-lightBlue ripple-effect float-right"><span>delete</span></button>
							</div>
						</div>
						
						
						<!-- 명함 정보 수정하기 -->
						<div class="card login-register" >
							<h1 class="title">수정하기</h1>
							<form method="post" action="updateMyCard">
								<!-- 내 명함 번호 -->
								<input type="hidden" name="mycardnum" value="${selectMyCard.mycardnum }" />
								
								<!-- 대표이름 -->
								<div class = "input-container has-feedback">
									<input type="text" id="name1" name="name1" value="${selectMyCard.name1}" required />
									<label for="">Name</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 추가 이름 -->
								<div class = "input-container has-feedback">
									<input type="text" id="name2" name="name2" value="${selectMyCard.name2}" />
									<label for="">Name2</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 추가 이름2 -->
								<div class = "input-container has-feedback">
									<input type="text" id="name3" name="name3" value="${selectMyCard.name3}"  />
									<label for="">Name3</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 회사명 -->
								<div class = "input-container has-feedback">
									<input type="text" id="company" name="company" value="${selectMyCard.company}" required />
									<label for="">Company</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 부서명 -->
								<div class = "input-container has-feedback">
									<input type="text" id="department" name="department" value="${selectMyCard.department}"  />
									<label for="">Department</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 직책명 -->
								<div class = "input-container has-feedback">
									<input type="text" id="job" name="job" value="${selectMyCard.job}" />
									<label for="">Job</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 전화번호 -->
								<div class = "input-container has-feedback">
									<input type="text" id="tel" name="tel" value="${selectMyCard.tel}"  />
									<label for="">Tel</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 휴대폰 번호 -->
								<div class = "input-container has-feedback">
									<input type="type" id="phone" name="phone" value="${selectMyCard.phone}" required />
									<label for="">Phone</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- E-Mail 주소 -->
								<div class = "input-container has-feedback">
									<input type="email" id="email" name="email" value="${selectMyCard.email}"  />
									<label for="">E-mail</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 회사 주소 -->
								<div class = "input-container has-feedback">
									<input type="type" id="address" name="address" value="${selectMyCard.address}"  />
									<label for="">Address</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 메모(otherinfo2) -->
								<div class = "input-container has-feedback">
									<input type="type" id="otherinfo2" name="otherinfo2" value="${selectMyCard.otherinfo2}"  />
									<label for="">Memo</label>
									<div class="check"></div>
									<div class="bar"></div>
								</div>
								
								<!-- 수정버튼 -->
								<div class="button-container">
									<button>
										<span>Update</span>
									</button>
								</div>
								
							</form>
						</div><!-- 명함 수정 end -->
						
					</div>
				</li>
			</ul>
		</article>
	<footer></footer><!-- footer end -->
	<!-- 
	<script src="resources/js/commonmain.js"></script>
	 -->
	<script src="<c:url value="/resources/js/newMain_js/menu/classie.js" />"></script>
	<script src="<c:url value="/resources/js/newMain_js/menu/borderMenu.js" />"></script>
	
</body>
</html>
