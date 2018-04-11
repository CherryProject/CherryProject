
/**
 * 회원 가입 폼 유효성 검사
 */

function joinValid() {
	
	var join_userid = $("#join_userid").val();		// ID 값
	var join_userpw = $("#join_userpw").val();		// 비밀번호 값
	var join_username = $("#join_username").val();	// 이름 값
	
	if(join_userid.length == 0 || join_userid == null) {
		
		alert("ID를 입력해주십시오");
		
		return false;
	}
	else if(join_userpw.length == 0 || join_userpw == null) {
		
		alert("비밀번호를 입력해주십시오");
		
		return false;
	}
	else if(join_username.length == 0 || join_username == null) {
		
		alert("이름을 입력해주십시오");
		
		return false;
	}
	else {
		
		return true;
	}
}