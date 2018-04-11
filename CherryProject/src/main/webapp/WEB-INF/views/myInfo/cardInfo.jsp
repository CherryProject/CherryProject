<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>Card Info</title>
	<link rel="stylesheet" type="text/css" href="css/cardinfo.css">
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="resources/management/js/cardinfo.js"></script>
</head>
<body>
	<!-- 정보승 : <header>부분 -->
	<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
	
	<article>
		<section class="wrapper">
			<div class="app-wrapper">
				<!--Wallet-->
				<aside class="wallet">
					<h2>My Name-card</h2>
					<div class="modal-control">+</div>
					<div class="cards"></div>
				</aside>

				<content class="transactions-wrapper">
					<h2>INFORMATION</h2>
					<div class="transactions"></div>
				</content>

			</div>
		</section>
		<div class="modal">
			<div class="modal-body">
				<h3>Add New Card</h3>
				<div class="modal-close">+</div>
				<div class="card-list">
					<div class="card-image visa"></div>
					<div class="card-image amex"></div>
					<div class="card-image mc"></div>
				</div>
			</div>
		</div>
	</article><!-- article end -->
	<footer>

	</footer><!-- footer end -->
</body>
</html>