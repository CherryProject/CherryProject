<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<title>Responsive Horizontal Layout</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
	<meta name="description" content="Responsive Horizontal Layout with jQuery and custom Scrollbars" />
	<meta name="keywords" content="horizontal, scrolling, panels, layout, template, jquery, responsive, custom scrollbar, html5" />
	<meta name="author" content="Codrops" />
	      
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/myinfo/css/jquery.jscrollpane.custom.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/myinfo/css/style.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/myinfo/css/calendar/calendar.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/myinfo/css/calendar/custom_2.css"/>" />
	
	<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery-3.3.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/myinfo/js/head.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/myinfo/js/count.js"/>"></script>
	<script src="<c:url value="/resources/myinfo/js/calendar/modernizr.custom.63321.js"/>"></script>
</head>
<body>
     <div id="hs-container" class="hs-container">
<aside class="hs-menu" id="hs-menu">
	<div class="hs-headline">
		<h1>Arisol</h1>
		<small>My info</small>
	</div>
	<nav>
		<a href="#introduction"><span>My Card</span></a>
		<a href="#chapter1"><span>statistics</span></a>
		<a href="#chapter2"><span>schedule</span></a>
		<a href="#chapter3"><span>Other_card</span></a>
	</nav>
</aside>
<a href="#hs-menu" class="hs-totop-link">Go to the top</a>
<div class="hs-content-scroller">
	<div class="hs-content-wrapper">
		<article class="hs-content" id="introduction">
			<div class="hs-inner my_card_text">
				<h2>My Card</h2>
				<img src="<c:url value="/resources/myinfo/img/3.jpg"/>">
		<ul>
			<li><a href="#" onclick="location.href='/www/cardList'">MyCard</a></li>
			<li>######</li>
		</ul>
	</div>
</article>
<article class="hs-content" id="chapter1">
	<div class="hs-inner">
		<h2>statistics</h2>
		<div class="counter col_fourth">
			<h2 class="timer count-title count-number" data-to="${yourCardCnt}" data-speed="1500"></h2>
			<p class="count-text ">Total Card</p>
		</div>
	</div>
</article>
<article class="hs-content" id="chapter2">
	<div class="hs-inner">
		<h2>schedule</h2>
		<section class="main">
			<div class="custom-calendar-wrap">
				<div id="custom-inner" class="custom-inner">
					<div class="custom-header clearfix">
						<nav>
							<span id="custom-prev" class="custom-prev"></span>
							<span id="custom-next" class="custom-next"></span>
						</nav>
						<h2 id="custom-month" class="custom-month"></h2>
						<h3 id="custom-year" class="custom-year"></h3>
					</div>
					<div id="calendar" class="fc-calendar-container"></div>
				</div>
			</div>
		</section>
	</div>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/calendar/jquery.calendario.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/calendar/data.js"/>"></script>
<script type="text/javascript">	
$(function() {

	var transEndEventNames = {
			'WebkitTransition' : 'webkitTransitionEnd',
			'MozTransition' : 'transitionend',
			'OTransition' : 'oTransitionEnd',
			'msTransition' : 'MSTransitionEnd',
			'transition' : 'transitionend'
		},
		transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
		$wrapper = $( '#custom-inner' ),
		$calendar = $( '#calendar' ),
		cal = $calendar.calendario( {
			onDayClick : function( $el, $contentEl, dateProperties ) {

				if( $contentEl.length > 0 ) {
					showEvents( $contentEl, dateProperties );
				}

			},
			caldata : codropsEvents,
			displayWeekAbbr : true
		} ),
		$month = $( '#custom-month' ).html( cal.getMonthName() ),
		$year = $( '#custom-year' ).html( cal.getYear() );

	$( '#custom-next' ).on( 'click', function() {
		cal.gotoNextMonth( updateMonthYear );
	} );
	$( '#custom-prev' ).on( 'click', function() {
		cal.gotoPreviousMonth( updateMonthYear );
	} );

	function updateMonthYear() {				
		$month.html( cal.getMonthName() );
		$year.html( cal.getYear() );
	}

	// just an example..
	function showEvents( $contentEl, dateProperties ) {

		hideEvents();
		
		var $events = $( '<div id="custom-content-reveal" class="custom-content-reveal"><h4>Events for ' + dateProperties.monthname + ' ' + dateProperties.day + ', ' + dateProperties.year + '</h4></div>' ),
			$close = $( '<span class="custom-content-close"></span>' ).on( 'click', hideEvents );

		$events.append( $contentEl.html() , $close ).insertAfter( $wrapper );
		
		setTimeout( function() {
			$events.css( 'top', '0%' );
		}, 25 );

	}
	function hideEvents() {

		var $events = $( '#custom-content-reveal' );
		if( $events.length > 0 ) {
			
			$events.css( 'top', '100%' );
			Modernizr.csstransitions ? $events.on( transEndEventName, function() { $( this ).remove(); } ) : $events.remove();

		}

	}

});
</script>
</article>
<article class="hs-content" id="chapter3">
	<div class="hs-inner">
		<h2>OtherCard</h2>
		<a href="#" onclick="location.href='/www/management'">Management BusinessCard</a>
	</div>
</article>
</div><!-- hs-content-wrapper -->
</div><!-- hs-content-scroller -->
</div>

<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery.mousewheel.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/mwheelIntent.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery.jscrollpane.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery.history.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/core.string.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery.easing.1.3.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery.smartresize.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/myinfo/js/jquery.page.js"/>"></script>
        <!-- 
		<script>
			head.js(
				{ jquery : "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" },
				{ mousewheel : "js/jquery.mousewheel.js" },
				{ mwheelIntent : "js/mwheelIntent.js" },
				{ jScrollPane : "js/jquery.jscrollpane.min.js" },
				{ history : "js/jquery.history.js" },
				{ stringLib : "js/core.string.js" },
				{ easing : "js/jquery.easing.1.3.js" },
				{ smartresize : "js/jquery.smartresize.js" },
				{ page : "js/jquery.page.js" }
			);
			
		</script>
		 -->
</body>
</html>