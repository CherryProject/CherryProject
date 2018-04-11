<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ practice ]</title>
	
	<style>
	.reverse {
	
		background : black;
		color : white;
	}
	
	</style>
	
	<script type="text/javascript" src=" <c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
	<script type="text/javascript">
	
	$(function(){
		
		
		$('button').click(function(){
			
			$('.page').toggle('slow');
			
		});
		
		
	});
	
	
	</script>
	
	
	
</head>
<body>
	<h1>[ practice ]</h1>
	
	<button>Toggle Show</button>
	<div class="page">
	<h2>Strat: </h2>
	<p>dqweasdqw</p>
	</div>
</body>
</html>