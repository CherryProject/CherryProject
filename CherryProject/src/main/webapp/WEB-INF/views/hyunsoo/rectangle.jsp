<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
      canvas { border: 1px solid black; 
      		   overflow : hidden;	
      		}
    </style>

<script type="text/javascript" src=" <c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
<script type="text/javascript">

	$(document).ready(function () {
      var canvas = document.getElementById('tutorial');
      var ctx = canvas.getContext('2d');
      
      $(canvas).on({
    	  
    	  
      });
      ctx.fillStyle = "rgb(200,0,0)";
      ctx.fillRect (10, 10, 50, 50);

      ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
      ctx.fillRect (30, 30, 50, 50);
      
    
  });
  
	
/*
	    ctx.fillRect(25, 25, 100, 100);
	    ctx.clearRect(45, 45, 60, 60);
	    ctx.strokeRect(50, 50, 50, 50);
*/


</script>



<title>rectangle</title>
</head>
<body onload="draw();">
    <h1>캔버스 그리기</h1>
    <canvas id="tutorial" width="600" height="400"></canvas>
  </body>
</html>