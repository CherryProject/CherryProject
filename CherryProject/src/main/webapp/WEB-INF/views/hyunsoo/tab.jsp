<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ tab ]</title>

	
	<style type="text/css">
    .tabs { margin: 0; padding: 0; }
    .tabs li { list-style-type: none; display: inline-block; background: #c7c7c7; padding: 3px 10px; color: #fff; cursor: pointer; }
    .tabs li:hover { color: #fff; background: #5294de; }
    .tabs li.active { color: #fff; background: #5294de; }
    .panel { display:none; background: #fff; border: 1px solid #c7c7c7; padding: 30px; }
    .panel.active { display:block; }
	</style>
	
	<script type="text/javascript" src=" <c:url value="/resources/js/jquery-3.2.1.js" />" > </script>
	<script type="text/javascript">
	
    $(document).ready(function() {

        $(".tabs li").on("click", function(e) {

            var $contents = $(this).closest("#contents");

            $contents.find(".tabs li.active").removeClass("active");

            $(this).addClass("active");

            $contents.find(".panel.active").hide();
            $contents.find(".panel.active").removeClass("active");

            var panelToShow = $(this).data("panel");

            $("#" + panelToShow).show();
            $("#" + panelToShow).addClass("active");
        });
    });
	
	</script>

</head>
<body>
	<h1>[ tab ]</h1>
		<div id="contents">
		    <ul class="tabs">
		        <li class="active" data-panel="panel1">탭 01</li>
		        <li data-panel="panel2">탭 02</li>
		        <li data-panel="panel3">탭 03</li>
		        <li data-panel="panel4">탭 04</li>
		        <li data-panel="panel5">탭 05</li>
		    </ul>
		    <div id="panel1" class="panel active">컨텐츠 01</div>
		    <div id="panel2" class="panel">컨텐츠 02</div>
		    <div id="panel3" class="panel">컨텐츠 03</div>
		    <div id="panel4" class="panel">컨텐츠 04</div>
		    <div id="panel5" class="panel">컨텐츠 05</div>
		</div>
</body>
</html>