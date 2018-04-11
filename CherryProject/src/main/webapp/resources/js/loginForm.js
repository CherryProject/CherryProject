(function() {
	var formEl = document.querySelector('section.login'),
	revealer = new RevealFx(formEl),
	loginCtrl = formEl.querySelector('.login__user');		// Login 버튼
	closeCtrl = formEl.querySelector('.login__close');		// Close this 버튼
	
	// 로그인 폼 출력
	document.querySelector('.btn--login-open').addEventListener('click', function() {
		console.log("1");
		revealer.reveal({
			bgcolor: '#8f40f1',
			direction: 'bt',
			duration: 600,
			onCover: function(contentEl, revealerEl) {
				formEl.classList.add('form--open');
				contentEl.style.opacity = 1;
				console.log("2");
			},
			onComplete: function() {
				console.log("3");
				closeCtrl.addEventListener('click', closeForm);
				console.log("4");
			}
		});
	});

	
	/*
	 * Login 버튼 이벤트
	 */
	function userLogin() {
		
		loginCtrl.addEventListener('submit', function() {
			
			alert("Login Success");	// 작동안됨

		});
	}
	
	/*
	 * 로그인 유효성 검사 (작동안됨)
	 */
	function loginValid() {
		
		var userid = $('login_userid').val();
		alert(userid);
		var userpw = $('login_userpw').val();
		alert(userpw);
		
		if(userid == null || userpw == null) {
			alert('Login Fail');
			
			return false;
		}

		return true;
	}
	
	
	/*
	 * Close this 버튼 이벤트
	 */
	function closeForm() {
		
		closeCtrl.removeEventListener('click', closeForm);
		formEl.classList.remove
		('login--open');
		revealer.reveal({
			bgcolor: '#8f40f1',
			direction: 'tb',
			duration: 600, 
			onCover: function(contentEl, revealerEl) {
				formEl.classList.remove('login--open');
				contentEl.style.opacity = 0;
			}
		});
		
		return false;
	}
//	 formEl.addEventListener('click', function(ev) {ev.preventDefault();});
	
})();