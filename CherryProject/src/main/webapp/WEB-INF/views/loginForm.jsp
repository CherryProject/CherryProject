<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/sign/css/Sign.css"/>">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/sign/js/Sign.js"/>"></script>


	<script type="text/javascript">
	
	<c:choose>
		<c:when test="${sessionScope.loginMsg eq 'emailFail' }">
			alert("E-mail 인증이 완료되지 않았습니다.");
		</c:when>
		<c:when test="${sessionScope.loginMsg eq 'passwordFail' }">
			alert("로그인 정보가 일치하지 않습니다.");
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	
	
	</script>
</head>
</head>
<body>
	<!-- 정현수가 넣음 - 아리소루 로고 -->
	<div class="logoBox"><img class="logo" src="<c:url value="/resources/img/ArisoruSketch(White).png" />"/></div>
	<!-- 수지 동영상 -->
	<div class="videoBox">
		<video autoplay loop="100" muted  id="videoBG">
			<source src="<c:url value="/resources/img/SUZY-BLOSSOM PINK.mp4"/>" type="video/mp4">
		</video>
	</div>
	
	<!-- 회원 로그인, 회원가입 부분 -->
	<div class="card-container">
	
		<!-- 로그인, 회원가입 화면 전환 -->
		<div class="toggle">
			<i class="fa fa-user fa-pencil fa-lg"></i>
			<div class="tooltip">Sign up</div>
		</div>
		
		<!-- 로그인 -->
		<div class="card login-register login-reset">
			<h1 class="title">Login</h1>
			<form method="post" action="users/login">
				<div class="input-container has-feedback">
					<input type="text" id="Username" name="userid" required
						
						title="Must contain from 3 to 20 characters such as any letter, number, an underscore, or a hyphen." />
					<label for="Username">UserID</label><i
						class="fa fa-user form-control-feedback"></i>
					<div class="check"></div>
					<div class="bar"></div>
				</div>
				<div class="input-container has-feedback">
					<input type="password" id="Password" name="userpw" required
						
						title="Must contain at least one number and one uppercase and lowercase letter, and from 8 to 20 characters." />
					<label for="Password">Password</label> <i
						class="fa fa-lock form-control-feedback"></i>
					<div class="check"></div>
					<div class="bar"></div>
				</div>
				
				<!-- 아이디 저장해놓기 -->
				<div class="checkbox">
					<label> <input type="checkbox" id="remember-me" checked>
						<span class="cr"><i class="cr-icon fa fa-rocket"></i></span>
						Remember me
					</label>
				</div><!-- 아이디 저장해놓기 end -->
				
				<!-- 로그인 버튼 -->
				<div class="button-container">
					<button class="rkmd-btn btn-lightBlue ripple-effect float-right" type="submit">
						<span>Sign in</span>
					</button>
				</div><!-- 로그인 버튼 end -->
				
				<!-- 비밀번호 찾기 -->
				<div class="footer">
					<a href="#">Forgot your password?</a>
				</div><!-- 비밀번호 찾기 end -->
			</form>
		</div><!-- 로그인 end -->
		
		<!-- 회원가입 -->
		<div class="card login-register">
			<h1 class="title">Create an account</h1>
			<form method="post" action="users/join">
				<!-- UserName -->
				<div class="input-container has-feedback">
					<input type="text" id="username" name="username" required
						autocomplete="off" pattern="[\w_-]{2,20}"
						title="Username must contain from 3 to 20 characters such as any letter, number, an underscore, or a hyphen." />
					<label for="Username">UserName</label> <i
						class="fa fa-user form-control-feedback"></i>
					<div class="check"></div>
					<div class="bar"></div>
				</div><!-- UserName end -->
				
				<!-- UserID -->
				<div class="input-container has-feedback">
					<input type="email" id="userid" name="userid" required
						pattern="[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+"
						title="Not an e-mail!" autocomplete="off" /> <label for="E-mail">E-mail</label>
					<i class="fa fa-envelope form-control-feedback"></i>
					<div class="check"></div>
					<div class="bar"></div>
				</div><!-- UserID end -->
				
				<!-- UserPW -->
				<div class="input-container has-feedback">
					<input type="password" id="userpw" name="userpw" 
						title="Password must contain at least one number and one uppercase and lowercase letter, and from 8 to 20 characters." />
					<label for="Password">Password</label> <i
						class="fa fa-lock form-control-feedback"></i>
					<div class="check"></div>
					<div class="bar"></div>
				</div><!-- UserPW end -->
				
				<!-- 체크박스
				<div class="checkbox">
					<label> <input type="checkbox" id="terms" required>
						<span class="cr"><i class="cr-icon fa fa-rocket"></i></span> 
						I accept something I never read
					</label>
				</div><!--  end -->
				
				<div class="button-container">
					<button>
						<span>Register</span>
					</button>
				</div>
			</form>
		</div><!-- 회원가입 end -->
		
		<!-- 비밀번호 찾기 -->
		<div class="card login-reset">
			<h1 class="title">Reset password</h1>
			<p class="reset-info">Password reset instruction will be send to
				your e-mail.</p>
			<form method="post" action="users/findPw">
			
				<div class="input-container has-feedback">
					<input type="email" id="E-mail" name="userid" required
						pattern="[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+"
						title="Not an e-mail!" autocomplete="off" /> <label for="E-mail">E-mail</label>
					<i class="fa fa-envelope form-control-feedback"></i>
				<div class="check"></div>
				<div class="bar"></div>
				</div>
				<!-- pattern="[\w_-]{1,20}" -->
				<div class="input-container has-feedback">
					<input type="text" id="Username" name="username" required
						autocomplete="off" 
						title="Username must contain from 3 to 20 characters such as any letter, number, an underscore, or a hyphen." />
					<label for="Username">UserName</label>
					<i class="fa fa-envelope form-control-feedback"></i>
					<div class="check"></div>
					<div class="bar"></div>
				</div>
				
				<div class="button-container">
					<button type="submit">
						<span>Reset</span>
					</button>
				</div>
				<div class="footer">
					<a href="#">Back to Login</a>
				</div>
			</form>
		</div><!-- 비밀번호 찾기 end -->
	</div><!-- 회원 로그인, 회원가입 부분 end -->
</body>
</html>