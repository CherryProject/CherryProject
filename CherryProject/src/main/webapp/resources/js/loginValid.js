
/*
 * 로그인 폼 유효성 검사
 */
function loginValid() {
	
	var login_userid = $("#login_userid").val();		// ID 값
	var login_userpw = $("#login_userpw").val();		// 비밀번호 값
	
	if(login_userid.length == 0 || login_userid == null) {
		
		alert("ID를 입력해주십시오");
		
		return false;
	}
	else if(login_userpw.length == 0 || login_userpw == null) {
		
		alert("비밀번호를 입력해주십시오");
		
		return false;
	}
	else {
		
		return true;
	}
}

