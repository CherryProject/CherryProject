<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ ShowHidden ]</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
	#div1 {
		width: 100px;
		height : 100px;
		background-color : orange;
		position: relative;
		
	}
	
	#img1 {
		height : 332px;
		width : 472px;
	}
	
	#img2 {
		height : 332px;
		width : 472px;
	}
	
	.active{
		height : 332px;
		width : 472px;
	}
	
	#display {
        border : 5px solid gray;
        display : inline-block;
        height : 1000px;
        margin : 5px;
        width : 1000px;
        border-radius : 7px;
        overflow : hidden;
    }
    
	
	#custom-handle {
    width: 3em;
    height: 1.6em;
    top: 50%;
    margin-top: -.8em;
    text-align: center;
    line-height: 1.6em;
  }
	
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	
	$(function () {
		
		var handle = $( "#custom-handle" );
		var angle = 0;	 //각도 값
		var imgRotate;	// ??
		var imgWidth; //이미지 가로
		var imgHeight; //이미지 높이
		var offset; //이미지 좌표
		var offsetLeft; //이미지 왼쪽좌표
		var offsetTop; //이미지 위쪽좌표
		
		$('textarea.content').keyup(function(){
			bytesHandler(this);
			});


		
		
		
		
		//이미지를 전체 영역
		$("img").each(function(){
				
				//이미지를 더블클릭 할 경우
				$(this).on('dblclick',function(){
					
					//활성화 된 상태라면 (더블클릭)
					if ($(this).is(".active")) {
						
						$(this).css('border','').removeClass("active").addClass("disActive"); // 클래스 삭제
						/*
						offset = 0;
						offsetLeft = 0;
						offsetTop = 0;
						imgWidth = 0;
						imgHeight = 0;
						*/
					} else {
							
						$(this).css('border','2px solid red').addClass("active"); // 이미지 선택시 외곽에 빨간선 표시, 클래스 추가
							
						offset = $(this).offset();
						offsetLeft = parseInt(offset.left);
						offsetTop = parseInt(offset.top);
						imgWidth = $(this).width();
						imgHeight = $(this).height();
						
						//asdf로 이미지 이동
						$(document).keydown(function(event) {
							if (event.keyCode == '65') {
								  //  alert('좌측 이동 a 누르셨습니다.');
								  offsetLeft -= 10;
									  $(".active").animate({left: offsetLeft});
								  } else if (event.keyCode == '68') {
								  //  alert('우측 이동 d 누르셨습니다.');
								  offsetLeft += 10;
									  $(".active").animate({left: offsetLeft});
								  } else if (event.keyCode == '87') {
									  //  alert('위쪽 이동 w 누르셨습니다.');
									  offsetTop -= 10;
									  $(".active").animate({top: offsetTop});
								  } else if (event.keyCode == '83') {
									  //  alert('아래쪽 이동 s 누르셨습니다.');
									  offsetTop += 10;
									  $(".active").animate({top: offsetTop});
								  }
							});
						
					
						//버튼클릭으로 이미지 이동
						$('.left').on('click',function (event) {
							offsetLeft -= 1;
							$(".active").animate({left: offsetLeft});
							
						});
									
							
						$('.up').on('click',function (event) {
							offsetTop -= 1;
							$(".active").animate({top: offsetTop});
							
						});	
						
						$('.down').on('click',function (event) {
							offsetTop += 1;
							$(".active").animate({top: offsetTop});
							
						});	
						
						$('.right').on('click',function (event) {
							offsetLeft += 1;
							$(".active").animate({left: offsetLeft});
							
						});
						
						//이미지 드래그
						$("img").draggable({
							
							stop:function(event,ui){
							offsetLeft = parseInt($(this).offset().left);
							offsetTop = parseInt($(this).offset().top);
							}
						    
							
						});	
						
						
					}
					
					
				}); // img1을 더블클릭할 경우 이벤트 처리
				
				
				
		});//img1을 전부 선택
		
	
		//클릭시 이미지 너비 조절
		$(".widthDown").on('click',function(){
			
			imgWidth -= 1;
			$(".active").css('width', imgWidth);
			
		});
		
		$(".widthUp").on('click',function(){
			
			imgWidth += 1;
			$(".active").css('width', imgWidth);
			
		});
		
		
		//클릭시 지정된 사이즈로 변경
		$(".imgSize").on('click',function(){
			
			imgWidth = 396;
			imgHeight = 279;
			$(".active").css('width', imgWidth).css('height', imgHeight);
		});
		
		$(".imgSize2").on('click',function(){
			
			imgWidth = 323;
			imgHeight = 204;
			$(".active").css('width', imgWidth).css('height', imgHeight);
		});
		
		$(".imgSize3").on('click',function(){
			
			imgWidth = 472;
			imgHeight = 332;
			$(".active").css('width', imgWidth).css('height', imgHeight);
		});	
		
		
		//클릭시 이미지 회전
		$(".rotate").on('click',function(){
			
			angle += 30;
			var rotate = "";
			rotate = "rotate(" + angle + "deg)";
			$(".active").css('transform-origin', "50% 50%").css('transform', rotate);
			
			
		});
		
		
		//현재 이미지의 좌표, 각도, 사이즈를 출력
		$('.data').on('click',function (){
			
			if($(".active")){
			
				if(angle == 360){
					angle = 0;
				}
				$(".p").html("left: " + offsetLeft + ", top: " + offsetTop + ", angle: " + angle + "\n" 
							+", width: " + imgWidth + "height: " + imgHeight 
							);
			} else {
				$(".p").html("");
			}
		});
		
			
			/*
			$("#img1").resizable({
				stop : function(event,ui){
				imgWidth = parseInt($(this).width());
				imgHeight = parseInt($(this).height());
				}
			});	 
			*/
			/*
			$( "#slider" ).slider({
			      create: function() {
			        handle.text( $( this ).slider( "value" ) );
			      },
			      slide: function( event, ui ) {
			        handle.text( ui.value );
			      }
		    });
			*/
		
			
	});
    
	

	function getTextLength(str) {
		var len = 0;

		for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
		len++;
		}
		len++;
		}
		return len;
		}

		function bytesHandler(obj){
		var text = $(obj).val();
		$('p.bytes').text(getTextLength(text));
		}


	
	

	
	</script>	

</head>
<body>
	<h1>[ ShowHidden ]</h1>
	
	<!-- Frame -->
	<div id="display">
	
		<img id="img1"  draggable="true"  src="<c:url value="/resources/image/sample.png"/>">
		<img id="img2"  draggable="true"  src="<c:url value="/resources/image/sample1.png"/>">
		
	</div>
	
	<p class="p"></p> <!-- image position -->

	<div id="slider">
  	<div id="custom-handle" class="ui-slider-handle"></div>
	</div>
	<pre>
	    <input class="up" type="button" value="↑">
	<input class="left" type="button" value="←"><input class="down" type="button" value="↓"><input class="right" type="button" value="→"><br>
	</pre>
	<input class="data" type="button" value="data">
	<input class="widthUp" type="button" value="widthUp"> 
	<input class="widthDown" type="button" value="widthDown"> 
	<input class="imgSize" type="button" value="74 x 105">
	<input class="imgSize2" type="button" value="53.98 x 85.60">
	<input class="imgSize3" type="button" value="88 x 125">
	<input class="rotate" type="button" value="rotate">
	
	<ul class="handler-ul">

<li><p class="bytes">0</p></li>

<li><textarea class="content"></textarea></li>

</ul>



		
</body>
</html>