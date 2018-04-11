(function() {
	var formEl = document.querySelector('section.form'),
	revealer = new RevealFx(formEl),
	joinCtrl = formEl.querySelector('.join__user');		// Join us 버튼
	closeCtrl = formEl.querySelector('.form__close');	// Close this 버튼
	
	// 회원 가입 폼 출력
	document.querySelector('.btn--form-open').addEventListener('click', function() {
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
				joinCtrl.addEventListener('click', joinUser);
				console.log("4");
				
			}
/*			onComplete: function() {
				closeCtrl.addEventListener('click', closeForm);
			}*/
		});
	});
	
	
	/*
	 * Join us 버튼 이벤트
	 */ 
	function joinUser() {
		console.log("5");
		joinCtrl.addEventListener('submit', function() {
			console.log("6");
		});
	}

	
	/*
	 * Close this 버튼 이벤트
	 */
	function closeForm() {
		console.log("7");
		closeCtrl.removeEventListener('click', closeForm);
		console.log("8");
		formEl.classList.remove('form--open');
		console.log("9");
		revealer.reveal({
			bgcolor: '#8f40f1',
			direction: 'tb',
			duration: 600, 
			onCover: function(contentEl, revealerEl) {
				formEl.classList.remove('form--open');
				contentEl.style.opacity = 0;
				console.log("10");
			}
		});
		
		return false;
	}
	
	/*formEl.addEventListener('submit', function(ev) {ev.preventDefault();});*/
})();