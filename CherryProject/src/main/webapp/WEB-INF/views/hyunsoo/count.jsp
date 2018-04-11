<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ Count ]</title>

<script type="text/javascript" src=" <c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
<script type="text/javascript">
	
	$(function(){
	
		$("input").each(function(){
			
			 if ( $(this).is('#up')) {
				
			
				$(this).on("click",function(e){
				 
				 e.preventDefault();	
				 var result = $(this).attr('value');
				 var count = $('input.text');
				 var count_val = count.val();
				 
				$('input.text').attr('value', parseInt(count_val)+1);					
						
						
				});
			 
			 } else {
				 
				 $(this).on("click",function(e){
					 
					 e.preventDefault();	
					 var result = $(this).attr('value');
					 var count = $('input.text');
					 var count_val = count.val();
					 
					 if (parseInt(count_val) < 1) {
									 
						return;
					} else {
						
					$('input.text').attr('value', parseInt(count_val)-1);					
					}
					 
							
							
					});
				 
			 }
			
			
			
		})
			
			 
		});
			
</script>	
	
</head>
<body>
	<h1>[ Count ]</h1>
	
	
	<input class="text" value="1" readonly="readonly"> <input id="up" type="button" value="↑"> <input id="down" type="button" value="↓"> 
	 
	
	
</body>
</html>