<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 
	정보승 : management.jsp의 테스트 페이지
 -->
 
<!DOCTYPE html>

<html lang="ko">
<head>
<!-- 정보승 : CSS 및 JS 공통부분 -->
<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
   	<title>Swiper demo</title>
	  	
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
 	
 	<!-- Live Search를 위한 소스 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 
 	<!-- Management CSS -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/management/css/normalize.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/management/css/demo.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/management/css/style2.css" />" />
  	
  	<style>
		#result {
			position: absolute;
			width: 100%;
			max-width:870px;
			cursor: pointer;
			overflow-y: auto;
			max-height: 400px;
			box-sizing: border-box;
			z-index: 1001;
		}
		.link-class:hover{
		 	background-color:#f1f1f1;
		}
  	</style>
  	
  	<!-- Management JS--> 
	<script src="<c:url value="/resources/management/js/modernizr-custom.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
  	<!-- 여지원 : 명함 삭제 및 수정, 메시지 스크립트 -->
  	<script src="<c:url value="/resources/management/js/yourCardList.js" />"></script>
  	
  	<script type="text/javascript">
  	
	  	$(function() {
	  		yourCardInfoList();
	  	});
  		
  	/**
  	 * @comment : 	명함 전체 리스트 출력
  	 * @author	:	여지원
  	 */
  	 
  	var resultObj;
  	var ajaxRun = true;
  	function yourCardInfoList() {
  		
  		$.ajaxSetup({
  			
  			cache: false 
  		});
  		
  		$('#search').keyup(function(){	// 뭐라도 키보드가 눌릴때 실행.

  			$('#result').html('');
  			$('#state').val('');
  			
  			var searchField = $('#search').val();
  			var expression = new RegExp(searchField, "i");
  		
  			if(ajaxRun)
		  		$.ajax({
		  			
		  			url: 'management'
		  			, type : 'get'
		  			, data : {}
		  			, dataTYpe : "json"
		  			, success : function(yourCardList){
						
		  			//$.each($.parseJSON(resultObj), function(key, value){
		  				resultObj = ${jsonList};
		  				ajaxRun = false;
		  			}
		  		});
	  			
	  		// 검색부분(리스트출력)		
	  		$.each(resultObj, function(key, value){
					
				if(expression.length == 0 || expression == "") {
				
					$('#search').keydown();
					alert("KEYDOWN");
				}
				
				if ( value.name1.search(expression) != -1
					|| value.company.search(expression) != -1
					|| value.job.search(expression) != -1
					|| value.phone.search(expression) != -1	
					) {
					
					$('#result').append('<li class="list-group-item link-class" style="color:black;">'
								+ value.name1 
								+ ' | <span class="text-muted">'
								+ value.company 
								+ '</span>'
								+ ' | <span class="text-muted">'
								+ value.job 
								+ '</span>'
								+ ' | <span class="text-muted">'
								+ value.phone 
								+ '</span></li>'
								);
				}
			});   
  		});
  		
  		$('#result').on('click', 'li', function() {
  			
  			var click_text = $(this).text().split('|');
  			
  			$('#search').val($.trim(click_text[0]));
  			$("#result").html('');
  		});
  		
  	}
  	
  	
  	
  	
  	/* 
  	 * @comment	:	db에서 저장된 명함을 검색
  	 * @author	:	전병익 
  	 */
  	 /*
	$(document).ready(function(){
		
		var searchArray = [];
		$.ajax({
			url:"search",
			dataType: "json",
			success:function(result){
				console.log(result);
				$.each(result,function(index,item){
					searchArray.push(item.name1);
					searchArray.push(item.phone);
					searchArray.push(item.company);
				});
			}
		});
		console.log(searchArray);
		$("#autocomplete").autocomplete({
			source : searchArray,
			minLength:1,
			select:function(event,ui){}
			
		});
	});
  	*/
  	</script>
</head>
<body>
	
	<!-- 정보승 : <header>부분 -->
	<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
	
	<!-- 정보승 : 카드 등록 -->
	<a href="yourcard/insertYourCard">
		<img src="<c:url value="/resources/management/img/icon/yourCardPlus.png"/>" />
	</a>
	
	
	 <!--  전병익 : 명함을 검색하는 검색창 
	<form action="search" method="post">
		<div class="ui-widget">
			<label for="autocomplete">검색어를 입력:</label>
			<input id="autocomplete" name="autocomplete" value = "${autocomplete}" type="text">
			<input type="submit" value ="검색">
		</div>
	</form>
	-->
	
	<!-- 정보승 : 라이브검색 -->
	<div class="container1" align="center" style="width:900px;">
	<br /><br />
	<form action="search" method="post">
		<div align="center">
			<input type="text" id="search" name="search" class="form-control" />
		</div>
		<ul class="list-group" id="result"></ul>
	</form>
	<br />
  	</div>
	
	
	<article class="container">
	    <section class="content">
	    
		<%-- 정보승 : 회원이 관리하는 카드 이미지 리스트 --%>
		<c:if test="${sessionScope.userid ne null}">
	
		<div class="grid">
		
		<c:forEach var="yourCardList" items="${yourCardList }">
		
		<div class="grid__item" data-size="700x800">
		
			<%-- 정보승 : 명함 이미지 --%>
			<a href="<c:url value="yourcard/download?yourcardnum=${yourCardList.yourcardnum}" />" class="img-wrap">
	
			<%-- 정보승 : 썸네일 이미지 (Resourcese) --%>
			<c:choose>
				<c:when test="${yourCardList.sex eq 'M'.charAt(0)}">
					<%-- 정보승 : 남자에게 받은 명함 썸네일 --%>
					<img src="<c:url value="/resources/management/img/collage/man_bg.jpg" />" alt="man_bg" />
				</c:when>
				
				<c:otherwise>
					<%-- 정보승 : 여자에게 받은 명함 썸네일 --%>
					<img src="<c:url value="/resources/management/img/collage/woman_bg.jpg" />" alt="woman_bg" />
				</c:otherwise>	
			</c:choose>
	
			<%-- 정보승 : DB에서 불러온 명함의 상세 정보 --%>
			<div class="description description--grid">
				<input type="hidden" value="${yourCardList.yourcardnum}" />
	   			<h3>${yourCardList.name1}</h3>
				<p>${yourCardList.memo}</p>
					<div class="details">
	  					<ul>
	    					<li><i class="icon icon-camera"></i><span>${yourCardList.company}</span></li>
							<li><i class="icon icon-focal_length"></i><span>${yourCardList.phone}</span></li>
							<li><i class="icon icon-aperture"></i><span>${yourCardList.email}</span></li>
							<li><i class="icon icon-exposure_time"></i><span>${yourCardList.address}</span></li>
							<li><i class="icon icon-iso"></i><span>${yourCardList.department}</span></li>
	         			</ul>
	       			</div>
	       			<div>
       					<button type="button" onclick="cardRemove('${yourCardList.yourcardnum}')"> 삭제 </button>
       					<button type="button" onclick="cardUpdate('${yourCardList.yourcardnum}')"> 수정 </button>
	       			</div>
	       			
	     	</div>
	  		</a>
		</div>
		</c:forEach>
		</div>	   
		<!-- /grid -->
	
		<%-- 정보승 : 명함 상세정보(라이트박스)의 [닫기] 버튼 --%>
		<div class="preview">
			<button class="action action--close">
				<i class="fa fa-times"></i>
				<span class="text-hidden">Close</span>
			</button>
			<div class="description description--preview"></div>
		</div>
		<!-- /preview --> 	
	
		</c:if>
		</section>
		<!-- /content -->
		
	</article>
	<!-- /container -->
	
	 
	<script src="<c:url value="/resources/management/js/imagesloaded.pkgd.min.js" />"></script>
	<script src="<c:url value="/resources/management/js/masonry.pkgd.min.js" />"></script>
	<script src="<c:url value="/resources/management/js/classie.js" />"></script>
	<script src="<c:url value="/resources/management/js/main.js" />"></script>
    
	<script>
		(function() {
			var support = { transitions: Modernizr.csstransitions },
			// transition end event name
			transEndEventNames = { 'WebkitTransition': 'webkitTransitionEnd', 'MozTransition': 'transitionend', 'OTransition': 'oTransitionEnd', 'msTransition': 'MSTransitionEnd', 'transition': 'transitionend' },
			transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
			onEndTransition = function( el, callback ) {
			var onEndCallbackFn = function( ev ) {
				if( support.transitions ) {
					if( ev.target != this ) return;
						this.removeEventListener( transEndEventName, onEndCallbackFn );
				}
				if( callback && typeof callback === 'function' ) { callback.call(this); }
			};
				if( support.transitions ) {
					el.addEventListener( transEndEventName, onEndCallbackFn );
				}
				else {
					onEndCallbackFn();
				}
			};
		
		    new GridFx(document.querySelector('.grid'), {
				imgPosition : {
				x : -0.5,
				y : 1
				},
				onOpenItem : function(instance, item) {
					instance.items.forEach(function(el) {
						if(item != el) {
							var delay = Math.floor(Math.random() * 50);
							el.style.WebkitTransition = 'opacity .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1), -webkit-transform .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1)';
							el.style.transition = 'opacity .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1), transform .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1)';
							el.style.WebkitTransform = 'scale3d(0.1,0.1,1)';
							el.style.transform = 'scale3d(0.1,0.1,1)';
							el.style.opacity = 0;
						}
					});
				},
				onCloseItem : function(instance, item) {
					instance.items.forEach(function(el) {
						if(item != el) {
							el.style.WebkitTransition = 'opacity .4s, -webkit-transform .4s';
							el.style.transition = 'opacity .4s, transform .4s';
							el.style.WebkitTransform = 'scale3d(1,1,1)';
							el.style.transform = 'scale3d(1,1,1)';
							el.style.opacity = 1;
		
							onEndTransition(el, function() {
								el.style.transition = 'none';
								el.style.WebkitTransform = 'none';
							});
						}
					});
				}
			});
		})();
	</script>
	
	<footer></footer><!-- footer end -->
	
	 <!-- 
	<script type="text/javascript" src="<c:url value="/resources/js/anime.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
	 -->
	<script src="<c:url value="/resources/js/newMain_js/menu/classie.js" />"> </script>
	<script src="<c:url value="/resources/js/newMain_js/menu/borderMenu.js" />"></script>
	<!-- 
    <script src="<c:url value="/resources/management/js/liveSearch.js" />"></script>
	 -->
</body>
</html>
