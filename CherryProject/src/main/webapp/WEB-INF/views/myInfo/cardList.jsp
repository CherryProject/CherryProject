<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Animated Border Menus | Demo 5</title>
	<meta name="description" content="Responsive Animated Border Menus with CSS Transitions" />
	<meta name="keywords" content="navigation, menu, responsive, border, overlay, css transition" />
	<meta name="author" content="Codrops" />
	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Poppins:700" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/common.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/normalize.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/menu.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/icons.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newMain_css/menu/menustyle.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/myinfo/css/cardlist.css"/>" />
	
	<script src="<c:url value="/resources/js/newMain_js/menu/modernizr.custom.js"/> "> </script>
	<script>document.documentElement.className = 'js';</script>
</head>
<div class="container">
	<header>
		<nav id="bt-menu" class="bt-menu">
			<a href="#" class="bt-menu-trigger"><i class="fas fa-bars"></i></a>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">TemplateList</a></li>
				<li><a href="#">Tools</a></li>
				<li><a href="#">Myinfo</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<ul>
				<li>Twitter</li>
				<li>Google+</li>
				<li>Facebook</li>
			</ul>
		</nav>
	</header>
	<article>
		<section class="content">
			<div class="grid grid--effect-vega">
				<a href="#" class="grid__item grid__item--c1">
					<div class="stack">
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__figure">
							<img class="stack__img" src="img/1.png" alt="Image"/>
						</div>
					</div>
					<div class="grid__item-caption">
						<h3 class="grid__item-title">anaerobic</h3>
						<div class="column column--left">
							<span class="column__text">Period</span>
							<span class="column__text">Subjects</span>
							<span class="column__text">Result</span>
						</div>
						<div class="column column--right">
							<span class="column__text">2045</span>
							<span class="column__text">133456</span>
							<span class="column__text">Positive</span>
						</div>
					</div>
				</a>
				<a href="#" class="grid__item grid__item--c2">
					<div class="stack">
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__figure">
							<img class="stack__img" src="img/2.png" alt="Image"/>
						</div>
					</div>
					<div class="grid__item-caption">
						<h3 class="grid__item-title">exothermic</h3>
						<div class="column column--left">
							<span class="column__text">Period</span>
							<span class="column__text">Subjects</span>
							<span class="column__text">Result</span>
						</div>
						<div class="column column--right">
							<span class="column__text">2045</span>
							<span class="column__text">133456</span>
							<span class="column__text">Positive</span>
						</div>
					</div>
				</a>
				<a href="#" class="grid__item grid__item--c3">
					<div class="stack">
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__deco"></div>
						<div class="stack__figure">
							<img class="stack__img" src="img/3.png" alt="Image"/>
						</div>
					</div>
					<div class="grid__item-caption">
						<h3 class="grid__item-title">diatomic</h3>
						<div class="column column--left">
							<span class="column__text">Period</span>
							<span class="column__text">Subjects</span>
							<span class="column__text">Result</span>
						</div>
						<div class="column column--right">
							<span class="column__text">2045</span>
							<span class="column__text">133456</span>
							<span class="column__text">Positive</span>
						</div>
					</div>
				</a>
			</div>
		</section>

		<script src="<c:url value="/resources/myinfo/js/anime.min.js" />">
		<script src="<c:url value="/resources/myinfo/js/main.js" />">
		<script>
			(function() {
				[].slice.call(document.querySelectorAll('.grid--effect-vega > .grid__item')).forEach(function(stackEl) {
					new VegaFx(stackEl);
				});
			})();
		</script>
	</article><!-- article end -->
</div><!-- /container -->
<script src="<c:url value="/resources/js/newMain_js/menu/classie.js" />"></script>
<script src="<c:url value="/resources/js/newMain_js/menu/borderMenu.js"/>"></script>
</body>
</html>
