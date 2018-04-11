

/**
 * @comment : 	명함 삭제 스크립트
 * @author	:	여지원
 */
function cardRemove(yourcardnum) {
	
	var bool = confirm('삭제하시겠습니까?');
	
	if(!bool){
		
		return false;
	}
	
	$.ajax({
		
		url : 'yourcard/yourCardDel'
		, type : 'post'
		, data : {'yourcardnum' : yourcardnum}
		, success : function(str){
		
			alert(str);
			window.location.reload();
		}
	});
}



/**
 * @comment : 	명함 수정 스크립트
 * @author	:	정보승
 */
function cardUpdate(yourcardnum) {
	
	// 수정하고자 하는 명함의 정보를 세션에 등록
	location.href="yourcard/registerSession?yourcardnum="+yourcardnum;
	alert("수정하는 거야?");
	
	
	
	// 수정을 위한 메소드
	$.ajax({
		
		url : 'yourcard/yourCardUpdate' 	//session
		, type : 'post'
		, data : {'yourcardnum' : yourcardnum}
		, success : function(str){
		
			alert(str);
			window.location.reload();
		}
	});
}
