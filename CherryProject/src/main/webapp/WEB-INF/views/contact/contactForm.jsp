<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
<html>
<head>

<title>ContactWritingForm</title>
 
<script type="text/javascript">

 	<c:if test="${errorMsg != null }">
		alert('${errorMsg }');
	</c:if>
	 
	function formCheck(){
		var title = document.getElementById("board_title");
		var content = document.getElementById("board_content");
	
		if(title.value==''){
			alert("제목을 입력하세요");
			return false;
		}
		if(content.value==''){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
}
</script>
</head>

<body>
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
				<li class="menu__item"><a class="menu__link" href="/www/tool">Tool</a></li>
				<li class="menu__item"><a class="menu__link" href="/www/management">Management</a></li>
				<li class="menu__item"><a class="menu__link" href="/www/contact">Contact</a></li>
			</ul>
		</nav>
	</header><!-- header end -->
	<!-- d여기가 작업 공간 -->
	<article>
	
	<div class="outline">
		<div class="header">
			<h2 style="text-align: center; color: #0059b3;">Arisoru_Sketch</h2>
		</div>
		
		
		 
		<!-- 글쓰기 폼 -->
		<form action="writeBoard"  method="post" onsubmit="return formCheck()">
		<input type="hidden" name="board_writer" value="${sessionScope.username }">
		<table style="border:1px solid black; margin: 0 auto;">
			<tr>
				<td><h3 style="text-align: center; width: 100%;" type="text">작성자 </h3></td>
				<td> &nbsp&nbsp ${sessionScope.username }</td>
			</tr>
			<tr>
				<td><h3>제목</h3></td>
				<td><input type="text" name="board_title" id="board_title" value="${board.board_title}"></td>
			</tr>
			<tr>
				<td><h3>내용</h3></td>
				<td><textarea  rows="15" cols="60" name="board_content" id="board_content" >${board.board_content }</textarea></td>
			</tr>
			</table>
		
		
		<div class="board2" style="text-align: center; width: 100%;">
			<input type="submit" value="작성 완료">
		</div>
		
		</form> 
	
	</div>	
	
		</article><!-- article end -->
		<footer></footer><!-- footer end -->
		
		<script type="text/javascript" src="<c:url value="/resources/js/anime.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/main.js "/>"></script>

	
</body>
</html>