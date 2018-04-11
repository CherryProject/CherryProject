<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

	<title>Block Reveal Effects | Menu | Codrops</title>
	
	<!-- 정보승 : CSS 및 JS 공통부분 -->
	<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
	
	<!-- 정보승: E-mail 인증이 안된 사용자에게 보내는 경고메시지 -->
	<script>
		<c:if test="${notVerify eq 'true'}">
		alert("이메일 인증이 되지 않았습니다! 이메일을 확인하시고 인증해주시기 바랍니다!");
		</c:if>
	</script>
	
	<!-- 정보승 : 로그인과 회원가입에서 유효성 검사가 되지 않는다 -->
	<!-- 
		<script type="text/javascript" src="resources/js/loginValid.js"></script>
		<script type="text/javascript" src="resources/js/joinValid.js"></script>
	 -->
</head>
<body>

	<div class="videoBox">
		<video autoplay loop="100" muted  id="videoBG">
			<source src="resources/img/aaaa.mp4" type="video/mp4">
		</video>
	</div>
	
	<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
	
	<article>
		<section class="content content--related flexy">
			<div class="box box--border box--small">
				<h2>Do you want to express yourself?</h2>
				<h2>Make it your own.</h2>
				<div class="login_button">
					<ul>
						<li>
							<!-- 회원가입 버튼 -->
							<button class="btn btn--default btn--form-open">joinUS</button>	
						</li>
						<li>
							<!-- 로그인 버튼 -->
							<button class="btn btn--default btn--login-open">Login</button>	
						</li>
					</ul>
				</div>
			</div>
		</section>
		
		<!-- 회원 가입 폼 -->
		<section class="form">
			<form class="form__inner flexy flexy--center" action="users/join" method="post">
				<h3 class="form__section form__section--title">joinUS</h3>
				
				<!-- userid(E-mail형식) 입력 폼 -->
				<div class="form__section">
					<label class="form__label">Email</label>
					<input class="form__input" type="email" name="userid" id="join_userid">
				</div>
				
				<!-- userpw 입력 폼 -->
				<div class="form__section">
					<label class="form__label">Password</label>
					<input class="form__input" type="password" name="userpw" id="join_userpw">
				</div>
				
				<!-- username 입력 폼 -->
				<div class="form__section">
					<label class="form__label">Full Name</label>
					<input class="form__input" type="text" name="username" id="join_username">
				</div>
				
				<!-- 버튼 -->
				<div class="form__section form__section--right">
					<button class="form__close btn btn--default">Close this</button>
					<button class="join__user btn btn--default">Join us</button>
				</div>
			</form>
		</section>
		
		<!-- 로그인 폼 -->
		<section class="login form">
			<form class="form__inner flexy flexy--center" action="users/login" method="post">
				<h3 class="form__section form__section--title">Login</h3>
				
				<!-- userid(E-mail형식) 입력 폼 -->
				<div class="form__section">
					<label class="form__label">Email</label>
					<input class="form__input" type="email" name="userid" id="login_userid">
				</div>
				
				<!-- userpw 입력 폼 -->
				<div class="form__section">
					<label class="form__label">Password</label>
					<input class="form__input" type="password" name="userpw" id="login_userpw">
				</div>
				
				<!-- 버튼 -->
				<div class="form__section form__section--right">
					<button class="login__close btn btn--default" >Close this</button>
					<button class="login__user btn btn--default" >Login</button>
				</div>
			</form>
		</section>
		
	</article><!-- article end -->
	
	<footer></footer><!-- footer end -->
	
	<script type="text/javascript" src="resources/js/anime.min.js"></script>
	<script type="text/javascript" src="resources/js/main.js"></script>
	<script type="text/javascript" src="resources/js/joinForm.js"></script>
 	<script type="text/javascript" src="resources/js/loginForm.js"></script>
	
</body>
</html>
