<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 정보승 : CSS 및 JS 공통부분 -->

<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
	<title>ContactMain</title>
	
	<link rel="stylesheet" type="text/css" href="resources/contact/contact.css" />
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
	<script type="text/javascript">
	
	
	//2018-03-28-1923 : 정현수 작성, Ajax contact 게시글 전부 출력
	$(function(){
		
		var page = 1;                       //페이지 변수를 1로 초기화
		var findList = '';					//검색분류를 위해 변수 초기화
		var findText = '';                 //검색기능을 위해 검색 변수 초기화
		
		init();
		
		
	});//레디 함수
	
	
	
	//글쓰기 폼으로 이동
	function contactForm(){ 
		

		location.href = "board/contactForm";
		
	}
	
	function init(page2, findList2, findText2 ){
		
		//====================================== Ajax 반복 구간 =================== 
		
			var page = page2;
			var findList = findList2;
			var findText = findText2;	
			
		$.ajax({
			
		url : "board/list"
		,type : "POST"
		,data : {
				 'page' : page
			     ,'findList' : findList
			     ,'findText' : findText
			}
		,success : function (map) {
				
				
				var list = map.list; //서버단에서 받은 데이터를 list변수에 넣음
				var now = map.now; //서버단에서 받은 now 값을 넣음
				var inputDate = ''; //게시글의 날짜
			    var navi = map.navi; //페이지 함수
				var total = map.total //게시글 갯수
				var findList = map.findList; // 게시글 키워드
				var findText = map.findText; // 게시글 입력값
				$("#findList").val(findList); 
				$("#findText").val(findText);
				
				$(".board").empty();	//초기화
				$(".page_output").empty();  //초기화
				 
				var str = ''; //출력용 sysout
				
				str += ''
				str += '<input type="button" class="write" value="글쓰기" onclick="contactForm()">';	
				str += '<table class="board">';
					 str += '<tr>';
					 	str += '<th class="boardnum"> 글번호 </th>';
					 	str += '<th class="boardtitle"> 제목 </th>';
					 	str += '<th class="userid"> 작성자 </th>';
					 	str += '<th class="boarddate"> 작성일 </th>';
					 	str += '<th class="hits"> 조회수 </th>';
				 	 str += '</tr>';
				
			 	 $.each(list,function(index,item){
			 		
			 		 inputDate = item.board_inputdate;
			 		 
			 		 str += '<tr>';
						str += '<td>' + item.boardnum + "</td>";
						//td데이터 안에 data-num이란 변수를 임의로 생성해서 그 안에 boardnum을 넣어둔다.
						str += '<td class="board_title" data-num="'+item.boardnum+'">' + item.board_title;
							if (inputDate == now) {
								str += '<span> <img src="/www/resources/img/new.png"/> </span>'
							}
						str += '</td>';
						str += '<td>' + item.board_writer  + '</td>';
						str += '<td>' + item.board_inputdate  + '</td>';
						str += '<td>' + item.board_hits  + '</td>';
					str += '</tr>';					 
				 });
				str +=	'</table>';
			 	 
					$('.div_board').html(str).trigger("create"); //div_board클래스에 html 출력
					
					
					
					//출력용 sysout
					var str2 = '';
					
					//페이지 생성 (1,2,3,4,5.....)  
					for (var i = map.navi.startPageGroup; i <= map.navi.endPageGroup; i++) {
							str2 += '<span class="pagenum" data-num="'+ i +'">';
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '<span class="current_page">'
				    		}
							
									str2 += i; 
										
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '</span>'
					    	}
							str2 += '</span>';
							
						}
					
					//출력 공간
					$(".page_output").html(str2).trigger("create");
					
					
					//선택한 페이지로 이동
					$(".pagenum").mouseenter().css('cursor', 'pointer').on('click',function (){
						
						page = $(this).attr('data-num');
						findList = '';
						findText = '';
					//	$("#search").attr('paging', page.val());
						for (var i = map.navi.startPageGroup; i <= map.navi.endPageGroup; i++) {
							str2 += '<span class="pagenum" data-num="'+ i +'">';
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '<b>'
				    		}
							
									str2 += i; 
										
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '</b>'
					    	}
							str2 += '</span>';
							
						}
						
						init(page, findList, findText);
						
					})//선택한 페이지로 이동
						
						
				
					//뒷 페이지로 이동
					$(".goBack").mouseenter().css('cursor', 'pointer').on('click', function(){
						
						page = (map.navi.currentPage) -1; 
						findList = '';
						findText = '';
						for (var i = map.navi.startPageGroup; i <= map.navi.endPageGroup; i++) {
							str2 += '<span class="pagenum" data-num="'+ i +'">';
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '<b>'
				    		}
							
									str2 += i; 
										
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '</b>'
					    	}
							str2 += '</span>';
							
						}
						
						init(page,  findList, findText);
						
					});//뒷 페이지로 이동
					
					//다음 페이지로 이동
					$(".goFront").mouseenter().css('cursor', 'pointer').on('click', function(){
						
						page = (map.navi.currentPage) +1; 
						findList = '';
						findText = '';
						for (var i = map.navi.startPageGroup; i <= map.navi.endPageGroup; i++) {
							str2 += '<span class="pagenum" data-num="'+ i +'">';
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '<b>'
				    		}
							
									str2 += i; 
										
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '</b>'
					    	}
							str2 += '</span>';
							
						}
						
						init(page, findList, findText);
						
					});//다음 페이지로 이동
					
					//시작 페이지로 이동
					$(".goFirst").mouseenter().css('cursor', 'pointer').on('click', function(){
						
						page = 1; 
						findList = '';
						findText = '';
						for (var i = map.navi.startPageGroup; i <= map.navi.endPageGroup; i++) {
							str2 += '<span class="pagenum" data-num="'+ i +'">';
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '<b>'
				    		}
							
									str2 += i; 
										
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '</b>'
					    	}
							str2 += '</span>';
							
						}
						
						
						init(page, findList, findText);
	
					});//시작 페이지로 이동
					
					
					//마지막 페이지로 이동
					$(".goLast").mouseenter().css('cursor', 'pointer').on('click', function(){
						
						page = map.navi.totalPageCount; 
						findList = '';
						findText = '';
						for (var i = map.navi.startPageGroup; i <= map.navi.endPageGroup; i++) {
							str2 += '<span class="pagenum" data-num="'+ i +'">';
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '<span class="current_page">'
				    		}
							
									str2 += i; 
										
							if(navi.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
								str2 += '</span>'
					    	}
							str2 += '</span>';
							
						}
	
						init(page, findList, findText);
						
					});//마지막 페이지로 이동
					
				       
					//검색을 할 시 
					$("#search").mouseenter().css('cursor', 'pointer').on('click',function (){
						
						var paging = $("#search").attr("paging");
						var findList = $("#findList option:selected").val();
						var findText = $("#findText").val();
						
						init(paging, findList, findText);
					});
					
					
					//클릭 이벤트 발생시 데이터를 넘기기 위한 함수
					 $(".board_title").mouseenter().css('cursor', 'pointer').on('click',function (){
							
						 //데이터를 가져옴
						 var boardnum =	$(this).attr('data-num');
						 
						 //서버에 요청하면서 boardnum을 넘긴다.
						 location.href = "board/contactRead?boardnum="+boardnum;	 
								//location.href="delete?boardnum="+boardnum; 수정
								//location.href="deleteReply?replynum="+replynum+"&boardnum="+boardnum; 삭제
					 });
					
					
					/*
					if(map.navi.currentPage > map.navi.countPerPage) {
						
						if (map.navi.currentPage > map.navi.countPerPage) {
							
				
						$(".goLast").remove();
						}
						$(".goFront").remove();
					}
					
					//현재 페이지가 마지막페이지와 같다면
					if(map.navi.currentPage < map.navi.totalPageCount){
						
						//마지막으로 가기 표시 삭제
							$(".goBack").remove();
						if (map.navi.currentPage < map.navi.countPerPage + 1) {
							$(".goFirst").remove();
						}
					}
					*/
				
					
			}//success
			,error : function (e) {
				alert("실패: "+e);
			}
			
		});//Ajax
							
						
		
		
		
		//=====================================================================
	}
	
	
	</script>
	
</head>
<body class="background">
		
			<!-- 정현수 : <header>부분 -->
		<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
		
		<article>
			
		
			<div class="div_outline"> <!-- contactMain 작업 영역 -->
				
				<div class="div_header"> <!-- hearder 영역 -->
					<h2>Arisoru_Sketch</h2>
				</div>
				
				<div class="div_inform">
				</div>
					
				<div class="div_board">	<!-- 게시글 영역 -->
					
					
				</div>
				
				
					<br><br>
				<div class="div_page">	
					<span class="goFirst">◁◁</span>
					<span class="goBack">◀</span>
					<span class="page_output">
					
					</span>
					<span class="goFront">▶</span>
					<span class="goLast">▷▷</span>
				</div>
					<div class="div_search">
						<select id="findList" name ="findList">
							<!--   <c:if test="${searchList == 'title' }">selected</c:if> -->
							<option value="default" selected="selected">전체</option>
							<option value="all" <c:if test="${findList == 'all' }">selected</c:if> > 제목+내용+작성자 </option>
							<option value="board_title" <c:if test="${findList == 'board_title' }" >selected</c:if> > 제목</option>
							<option value="board_content" <c:if test="${findList == 'board_content' }" >selected</c:if> >내용</option>
							<option value="board_writer" <c:if test="${findList == 'board_writer' }" >selected</c:if> >작성자</option>
						</select>			
										
						<input type="hidden" name="boardnum" value="${board.boardnum }">
						<input  type="text" id="findText" name="findText" value="${findText }">
						<input  id="search" type="button" paging="${1}"  value="검색">  <!-- 페이징 처리를 위해서 submit이 아니라 button으로 만든다 -->
					<!-- 검색은 항상 첫페이지로 와야하므로, 1페이지 가된다 -->
					</div>
			</div>
		


<!-- d여기가 작업 공간 -->



		</article><!-- article end -->
		<footer></footer><!-- footer end -->
		
		 <!-- 
	<script type="text/javascript" src="<c:url value="/resources/js/anime.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
	 -->
	<script src="<c:url value="/resources/js/newMain_js/menu/classie.js" />"> </script>
	<script src="<c:url value="/resources/js/newMain_js/menu/borderMenu.js" />"></script>
	</body>
	</html>
