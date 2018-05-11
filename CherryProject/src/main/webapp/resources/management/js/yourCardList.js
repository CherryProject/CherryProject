

/**
 * @comment : 	명함 삭제 스크립트
 * @author	:	여지원
 */
function cardRemove(yourcardnum) {
	
	var bool = confirm('名刺を削除しますか');
	
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
		
		
		if(confirm("名刺を修正しますか")) {
			
			location.href="yourcard/yourCardUpdatePage?yourcardnum="+yourcardnum;
			
//			$.ajax({
//				
//				url : 'yourcard/yourCardUpdate' 
//				, type : 'post'
//				, data : {'yourcardnum' : yourcardnum}
//				, success : function(str){
//				
//					window.location.reload();
//				}
//			});
		}
	}
	
	/**
	 * @comment : 	건네 중 명함 보러가기 스크립트
	 * @author	:	정보승
	 */
	function cardInfo(mycardnum) {

		location.href="mycard/myCardOneInfo?mycardnum="+mycardnum;
	}
	
	
