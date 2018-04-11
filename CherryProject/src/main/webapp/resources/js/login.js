(function() {
	var formEl = document.querySelector('section.login'),
	revealer = new RevealFx(formEl),
	closeCtrl = formEl.querySelector('.login__close');

	document.querySelector('.btn--login-open').addEventListener('click', function() {
		revealer.reveal({
			bgcolor: '#8f40f1',
			direction: 'bt',
			duration: 600,
			onCover: function(contentEl, revealerEl) {
				formEl.classList.add('form--open');
				contentEl.style.opacity = 1;
			},
			onComplete: function() {
				closeCtrl.addEventListener('click', closeForm);
			}
		});
	});

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
	}
	 formEl.addEventListener('submit', function(ev) {ev.preventDefault();});
})();