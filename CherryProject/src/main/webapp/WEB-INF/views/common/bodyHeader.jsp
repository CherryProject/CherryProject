<%--
	Home.jsp의 메뉴 공통 내용
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header class="codrops-header">
		<h1 class="codrops-header__title">명함만들기프로젝트</h1>
	
		<!-- 메뉴 선택 바 열기 -->
		<button class="btn btn--menu"><i class="fas fa-bars"></i></button>
		<nav class="menu">
	
		<!-- 메뉴 선택 바 닫기 -->
		<button class="btn btn--close"><i class="fas fa-times"></i></button>
		
		
		<!-- 메뉴 선택 바 -->
			<ul class="menu__inner">
		
				<li class="menu__item"><a class="menu__link" href="/www">Home</a></li>
				<li class="menu__item"><a class="menu__link" href="/www/templateList">TemplateList</a></li>
		<!-- 정보승 : 로그인할 경우에만 메뉴바 보이도록 한다. -->
		<c:if test="${sessionScope.userid ne null}">
				<li class="menu__item"><a class="menu__link" href="/www/tool">Tool</a></li>
				<li class="menu__item"><a class="menu__link" href="/www/management">Management</a></li>
		</c:if>
		
				<li class="menu__item"><a class="menu__link" href="/www/contact">Contact</a></li>
	
			</ul>
		</nav>
	</header><!-- header end -->
