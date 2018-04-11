<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[timer]</title>
	<script type="text/javascript" src=" <c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
	<script type="text/javascript">
	
	$(function () {
		
		setTimeout(function (){
			
			var color = $('input:checked').val();
				
			if (color == '빨간색') {
				alert(color);
				$('#div').children('#s1').css('background', 'red').css('color', 'white');
			}
			
			if (color == '파란색') {
				alert(color);
				$('#div').children('#s1').next().next().next().css('background', 'blue').css('color','white');
										
			}
			
			
			if (color == '녹색') {
				alert(color);
				$('#div').children('#s1').next().next().next().next().next().next().css('background', 'green').css('color', 'white');
			}
			
			console.log(color);
			
		}, 3000);
		
	});			
	
	
	</script>
	
	
</head>
<body>
	<h1>
		[Timer]
	</h1>
	<br><br>
	
	<div id="div">
		<span id="s1">빨간색</span>
		<input type="radio" name="color" value="빨간색" >
		<br>
		<span>파란색</span>
		<input type="radio" name="color" value="파란색">
		<br> 
		<span>녹색</span>
		<input type="radio" name="color" value="녹색">
		<br>
	</div>
	
</body>
</html>