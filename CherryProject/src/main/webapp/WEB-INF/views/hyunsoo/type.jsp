<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ Text ]</title>

	<script type="text/javascript" src=" <c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
	<script type="text/javascript">
	
	
		$(function() {
			
			$("div#parent").children("input").last().on('click',function() {
				
				
				var result = $("div#parent").children("input").first().attr("type");
				alert(result.length-1);
				
				$('#result').html('<h1>' +(result.length-1) + '글자 입니다.<h1>');				
				
				
			});
			
				
				
		
			
			
			
			
			
		});
		
	
	</script>

</head>
<body>
	<h1>[ Text ]</h1>
	<br><br><br>
	<div id="parent">
	
	<input type="text" > <input type="button" value="글자수리턴">
	<div id="result"></div>
	</div>	
</body>
</html>