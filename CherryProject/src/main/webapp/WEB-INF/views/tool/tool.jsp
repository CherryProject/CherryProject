<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%-- 
<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
--%>
	<title>Make BusinessCard</title>
    <link rel="stylesheet" type="text/css" href="<c:url value=" resources/tool/css/common.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value=" resources/tool/css/b.css" />">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
    <link href="https://code.jquery.com/ui/jquery-ui-git.css" rel="stylesheet"/>
   
   	<script type="text/javascript" src="<c:url value=" resources/tool/js/html2canvas.js" />"></script>
   
    <script type="text/javascript" src="<c:url value=" resources/tool/js/jquery-3.3.1.min.js" />"></script>
    <script src ="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<c:url value=" resources/tool/js/tab.js" />"></script>
    <script type="text/javascript" src="<c:url value=" resources/tool/js/dragAndDropv4.js" />"></script>
	<script>
    
   $(function(){
		
	   var mycardnum = 0; // 명함 번호
	   
	   //$(".download")영역 안에 마우스가 들어올 경우
	   $(document).on("mouseenter", ".download", function() {
		   
		   $(this).on("click", function(){
			   //$('.canvas') 는 이미지로 만들 태그 (영역)
			/* $('.canvas').css({
				   'width' : '',
			   		'height' : '',
			   		'top' : '',
			   		'left' : ''
			   });*/
			   html2canvas($(".canvas"), {
	                onrendered: function(canvas) {
	                    if (typeof FlashCanvas != "undefined") {
	                        FlashCanvas.initElement(canvas);
	                    }
	                   // canvas 로 변환 (Base64 encoding)
	                	mycardnum++;
	                    var image = canvas.toDataURL("image/png"); 
							
	                    var link = document.createElement('a');
	      	        	  link.href = image;  // use realtive url 
	                
	                   // hidden 태그에 변환된 값 대입
	                    $("#imgData").attr("value", link.href);
	                   alert($("#imgData").attr("value"));
	                    
	                   var html  = $("#canvas").html();
	                   $("#html").attr("value", html);
	                   alert(html);
	                   
	                    // post 방식으로 submit
	                    $("#imgForm").submit();
	                   //$('.canvas').css("height", 412.5).css("width", 1536);
	                }
	            });
			   
		   });
		   
        });

   });//레디 함수

   function myTool() {
	 
	   location.href = "tool/myTool"; 
   }
   
    </script>
</head>
<body>
<%-- 
	<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>
 --%>
    <div id="wrap">
        <header>
            <h1 id="title" class="title">tool</h1>
            <div class="main_menu" id="main_menu">
                <ul class="tool_default_button_group">
                    <li><a href="#"><i class="fas fa-file-alt"></i>project</a></li>
                    <li><i class="fas fa-file"></i>page</li>
                    <li class="download"><i class="fas fa-edit"></i>edit</li>
                    <li class="myTool" onclick="myTool()"><i class="fas fa-exchange-alt"></i>array</li>
                    <li><i class="fas fa-tag"></i>effect</li>
                    <li><i class="fas fa-table"></i>table</li>
                    <li><i class="fas fa-edit"></i>memo</li>
                    <li><i class="fas fa-expand"></i>example</li>
                    <li><i class="fas fa-hands-helping"></i>help</li>
                </ul>
                
                 <form name="imgForm" id="imgForm" action="tool/download" method="post">
			        <input type="hidden" id="imgData" name="imgData" value="">
			        <input type="hidden" id="html" name="html">
			    </form>
                
                <div class="tool_text_button_group">
                    <button id="bold" class="tool_text_button" title="Bold (Ctrl+B)"><i class="fa fa-bold"></i></button>
                    <button id="italic" class="tool_text_button" title="Italic (Ctrl+I)"><i class="fa fa-italic"></i></button>
                    <button id="underline" class="tool_text_button" title="Underline (Ctrl+U)"><i class="fa fa-underline"></i></button>
                    <select name="fonts" class="tool_text_button" id="fonts">
                        <option class="tool_text_button" value="Arial" selected>Arial</option>
                        <option class="tool_text_button" value="Georgia">Georgia</option>
                        <option class="tool_text_button" value="Tahoma">Tahoma</option>
                        <option class="tool_text_button" value="Times New Roman">Times New Roman</option>
                        <option class="tool_text_button" value="Verdana">Verdana</option>
                        <option class="tool_text_button" value="Impact">Impact</option>
                        <option class="tool_text_button" value="Courier New">Courier New</option>
                    </select>
                    <select name="size" class="tool_text_button" id="size">
                        <option class="tool_text_button" value="8">8</option>
                        <option class="tool_text_button" value="10">10</option>
                        <option class="tool_text_button" value="12">12</option>
                        <option class="tool_text_button" value="14">14</option>
                        <option class="tool_text_button" value="16" selected>16</option>
                        <option class="tool_text_button" value="18">18</option>
                        <option class="tool_text_button" value="20">20</option>
                        <option class="tool_text_button" value="22">22</option>
                        <option class="tool_text_button" value="24">24</option>
                        <option class="tool_text_button" value="26">26</option>
                    </select>
                    <input type="text" class="tool_text_button" id="color" />
                    <button id="align-left" class="tool_text_button" title="Left"><i class="fa fa-align-left"></i></button>
                    <button id="align-center" class="tool_text_button" title="Center"><i class="fa fa-align-center"></i></button>
                    <button id="align-right" class="tool_text_button" title="Right"><i class="fa fa-align-right"></i></button>
                    <button id="list-ul" class="tool_text_button" title="Unordered List"><i class="fa fa-list-ul"></i></button>
                    <button id="list-ol" class="tool_text_button" title="Ordered List"><i class="fa fa-list-ol"></i></button>
                </div>
            </div>
            <!-- main menu end -->
            <div class="sub_menu">
                <ul>
                    <li><i class="fas fa-undo-alt"></i></li><!-- go to back -->
                    <li><i class="fas fa-redo-alt"></i></li><!-- go to front -->
                    <li><i class="fas fa-save"></i></li><!-- save -->
                </ul>
            </div>
            <!-- sub menu end -->
        </header>
        <!-- header end -->
        <article>
            <ul>
                <li>
                    <section>
                        <div class="output" id="output">
                        
                        	<div class="canvas" id="canvas"></div>                                  	
                        	
                        	
                        	<!--  <div class="canvas" id="back">
                        	
                        	back
                        	
                        	</div>-->
                        </div>
                    </section>
                    <!-- canvas end -->
                </li>
                <li>
                    <section class="tool_tab">
                        <div id="menubox">
                            <ul class="tab-menu">
                                <li class="active"><a href="#">Template</a></li>
                                <li><a href="#">Element</a></li>
                                <li><a href="#">File</a></li>
                            </ul>
                            <div id="contentbox">
                                <div class="content">
                                    <ul id="accordion2" class="accordion">
                                        <li class="text">
                                            <div class="link">
                                                <i class="fa fa-database"></i>SampleTemplate<i class="fa fa-chevron-down"></i>
                                            </div>
                                            <div class="submenu tools" id="div_list_tools"><!-- 여기가 아이콘 목록 -->
                                                <div class="tool Template">
                                                    <div><img src="<c:url value=" resources/tool/sample/bg1_1.png " />"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg1_2.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg2_1.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg2_2.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg3_1.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg3_2.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg4_1.png"/>"></div>
                                                </div>                                          
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg4_2.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                     
                                                    <div><img src="<c:url value=" resources/tool/sample/bg5_1.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg5_2.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg6_1.png"/>"></div>
                                                </div>                                           
                                                <div class="tool Template">                      
                                                    <div><img src="<c:url value=" resources/tool/sample/bg6_2.png"/>"></div>
                                                </div>                                           
                                                 <div class="tool Template">                     
                                                    <div><img src="<c:url value=" resources/tool/sample/bg7_1.png"/>"></div>
                                                </div>                                           
                                                 <div class="tool Template">                     
                                                    <div><img src="<c:url value=" resources/tool/sample/bg7_2.png"/>"></div>
                                                </div>                                           
                                                 <div class="tool Template">                     
                                                    <div><img src="<c:url value=" resources/tool/sample/bg8-1_1.png"/>"></div>
                                                </div>
                                                 <div class="tool Template">
                                                    <div><img src="<c:url value=" resources/tool/sample/bg8-2_1.png"/>"></div>
                                                </div>	
                                                 <div class="tool Template">
                                                    <div><img src="<c:url value=" resources/tool/sample/bg9_1.png"/>"></div>
                                                </div>
                                                 <div class="tool Template">
                                                    <div><img src="<c:url value=" resources/tool/sample/bg9_2.png"/>"></div>
                                                </div>
                                                 <div class="tool Template">
                                                    <div><img src="<c:url value=" resources/tool/sample/bg10_1.png"/>"></div>
                                                </div>
                                                 <div class="tool Template">
                                                    <div><img src="<c:url value=" resources/tool/sample/bg10_2.png"/>"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="icon">
                                            <div class="link"><i class="fa fa-code"></i>BasicTemplate<i class="fa fa-chevron-down"></i></div>
                                            <div class="submenu tools" id="div_list_tools"><!-- 여기가 아이콘 목록 -->
                                                <div class="tool text">
                                                    <span class="fa fa-code"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="link"><i class="fa fa-mobile"></i>Icon<i class="fa fa-chevron-down"></i></div>
                                            <div class="submenu tools" id="div_list_tools"><!-- 여기가 아이콘 목록 -->
                                                <div class="tool icon">
                                                    <span class="fa fa-code"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="link"><i class="fa fa-globe"></i>Date Time<i class="fa fa-chevron-down"></i></div>
                                            <div class="submenu tools" id="div_list_tools"><!-- 여기가 아이콘 목록 -->
                                                <div class="tool icon">
                                                    <span class="fa fa-code"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="content">
                                    <ul id="accordion" class="accordion">
                                        <li class="text">
                                            <div class="link">
                                                <i class="fa fa-database"></i>Text<i class="fa fa-chevron-down"></i>
                                            </div>
                                            <div class="submenu tools" id="div_list_tools"><!-- 여기가 아이콘 목록 -->
                                                <div class="tool text"><span>Heading 1</span></div>
                                            </div>
                                        </li>
                                        <li class="icon">
                                            <div class="link"><i class="fa fa-code"></i>Icon<i class="fa fa-chevron-down"></i></div>
                                            <div class="submenu tools" id="div_list_tools"><!-- 여기가 아이콘 목록 -->
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/a1.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/a2.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/a3.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/a4.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/a5.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/a6.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/b1.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/b2.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/b3.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/b5.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/b6.svg" />"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/s1.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/s2.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/s3.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/s4.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/s5.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/s6.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/p1.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/p2.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/p3.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/p4.svg"/>"></div>
                                                </div>
                                                <div class="tool icon">
                                                    <div><img src="<c:url value=" resources/tool/img/p5.svg"/>"></div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="link"><i class="fa fa-mobile"></i>Icon<i class="fa fa-chevron-down"></i></div>
                                            <ul class="submenu">
                                                <div class="tool icon textbox"><i class="fas fa-bell tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-calendar tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-calendar-alt tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-calendar-check tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-calendar-minus tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-calendar-plus tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-calendar-times tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-clock tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-hourglass tool"></i></div>
                                                <div class="tool icon textbox"><i class="fas fa-stopwatch tool"></i></div>
                                            </ul>
                                        </li>
                                        <li>
                                            <div class="link"><i class="fa fa-globe"></i>Date Time<i class="fa fa-chevron-down"></i></div>
                                            <ul class="submenu">
                                                <div class="tool tool-1 textbox" id="outputCompany"><i class="fas fa-bell tool"></i></div>
                                                <div class="tool tool-2 textbox" id="outputCompany"><i class="fas fa-calendar tool"></i></div>
                                                <div class="tool tool-3 textbox" id="outputCompany"><i class="fas fa-calendar-alt tool"></i></div>
                                                <div class="tool tool-4 textbox" id="outputCompany"><i class="fas fa-calendar-check tool"></i></div>
                                                <div class="tool tool-5 textbox" id="outputCompany"><i class="fas fa-calendar-minus tool"></i></div>
                                                <div class="tool tool-6 textbox" id="outputCompany"><i class="fas fa-calendar-plus tool"></i></div>
                                                <div class="tool tool-7 textbox" id="outputCompany"><i class="fas fa-calendar-times tool"></i></div>
                                                <div class="tool tool-8 textbox" id="outputCompany"><i class="fas fa-clock tool"></i></div>
                                                <div class="tool tool-9 textbox" id="outputCompany"><i class="fas fa-hourglass tool"></i></div>
                                                <div class="tool tool-10 textbox" id="outputCompany"><i class="fas fa-stopwatch tool"></i></div>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                 <div class="content file"> 
                                        <input type='file' id="images" onchange="readURL(this);"  multiple name="images" />
                                                                                
                                </div>
                           </div>
                       </div>
                   </section>
                   <!-- tool_tab end -->
               </li>
           </ul>
       </article>
       <!-- article end -->
       <footer>

       </footer>
       <!-- footer end -->
   </div>
</body>
</html>
