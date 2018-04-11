<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 정보승 : CSS 및 JS 공통부분 -->
<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
<html lang="ko">
<head>

	<title>Templates</title>
	
	<!-- 템플릿 리스트 CSS -->
	<link rel="stylesheet" type="text/css" href=" <c:url value="/resources/templateList/css/base.css" />">
	<link rel="stylesheet" type="text/css" href=" <c:url value="/resources/templateList/css/uncover.css" />">
	
	<script>
		var supportsCssVars = function() { var e, t = document.createElement("style"); return t.innerHTML = "root: { --tmp-var: bold; }", document.head.appendChild(t), e = !!(window.CSS && window.CSS.supports && window.CSS.supports("font-weight", "var(--tmp-var)")), t.parentNode.removeChild(t), e };
		supportsCssVars() || alert("Please view this demo in a modern browser that supports CSS Variables.");
	</script>
</head>
<body>

	<!-- 정보승 : <header>부분 -->
	<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
	
	<article>
		<div class="content grid">
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample_B.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template1</h2>
					<p class="grid__item-description">Find me tomorrow or never</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample_F.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template2</h2>
					<p class="grid__item-description">Never end it like that</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample2_B.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template3</h2>
					<p class="grid__item-description">Why make noise like that?</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample2_F.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template4</h2>
					<p class="grid__item-description">No point in running</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample3_B.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template5</h2>
					<p class="grid__item-description">When you get there</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample3_F.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template6</h2>
					<p class="grid__item-description">Timeless manners count</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample4_B.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template7</h2>
					<p class="grid__item-description">Together we can sit</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample4_F.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template8</h2>
					<p class="grid__item-description">The new kid on the block</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample5_B.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template9</h2>
					<p class="grid__item-description">The new kid on the block</p>
				</div>
			</div>
			<div class="grid__item">
				<div class="scroll-img" style="background-image: url(resources/templateList/img/sample5_F.png);"></div>
				<div class="grid__item-titlewrap">
					<h2 class="grid__item-title">#Template10</h2>
					<p class="grid__item-description">Find me tomorrow or never</p>
				</div>
			</div>
		</div>
		
		<script src="resources/js/anime.min.js"></script>
		
		<script src="resources/templateList/js/imagesloaded.pkgd.min.js"></script>
		<script src="resources/templateList/js/uncover.js"></script>
		<script src="resources/templateList/js/demo3.js"></script>
		
	</article><!-- article end -->
	<footer></footer><!-- footer end -->
	
	<script src="resources/js/commonmain.js"></script>
	
</body>
</html>
