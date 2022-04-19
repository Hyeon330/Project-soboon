$(() => {
	//닉네임 중복검사 (클릭시)
	$('#button_overlapCheck').click((event) => {
		event.preventDefault();
		var nickname = $('#nickname').val();
		var exNickname = $('#VO_nickname_hidden').text();
		if (nickname === exNickname) {
			$('#nicknameCheck').val("Y");
			alert('기존 닉네임과 일치합니다.');
		} else {
			if (nickname !== '' && nickname.length >= 2) {
				var url = "/mypage/nicknameCheck";
				$.ajax({
					url: url,
					data: "nickname=" + nickname,
					type: "post",
					success: function(result) {  
						if (result > 0) {//사용불가
							if (nickname === exNickname) {
								$('#nicknameCheck').val("Y");
								alert('기존 닉네임과 일치합니다.');
							} else {
								$('#nicknameCheck').val("N");
								alert('해당 닉네임은 사용할 수 없습니다.');
								$('#nickname').val('');
								$('#nickname').focus();
							}
						} else {//사용가능
							$('#nicknameCheck').val("Y");
							alert('해당 닉네임은 사용할 수 있습니다.');
							$('#nickname').focus();
						}
					}, error: function(e) {//사용불가
						console.log(e);
						$('#nicknameCheck').val("N");
						alert('중복체크 오류가 발생했습니다.');
						$('#nickname').val('');
						$('#nickname').focus();
					}
				});
			} else if ($('#nickname').val() === '') {//사용불가
				$('#nicknameCheck').val("N");
				alert('닉네임을 입력하고 중복확인을 해주세요.');
				$('#nickname').focus();
			} else {//사용불가
				$('#nickanmeCheck').val("N");
				alert('해당 닉네임은 사용할 수 없습니다.');
				$('#nickname').val('');
				$('#nickname').focus();
			}
		}
	});

	$('#editFrm').submit(() => {
		//선언부
		var reg1 = /^[0-9]{2,3}$/;
		var reg2 = /^[0-9]{3,4}$/;
		var reg3 = /^[0-9]{4}$/;
		var pwdReg = /^[a-zA-Z0-9~!@#^*_]{7,15}$/;

		// 이름
		if ($('#username').val() === '') {
			alert('이름을 입력하세요.');
			$('#username').focus();
			return false;
		}

		// 비밀번호(userpwd1)
		if ($('#userpwd1').val() === '') {
			alert('비밀번호를 입력하세요..');
			$('#userpwd1').focus();
			return false;
		}
		if (!pwdReg.test($('#userpwd1').val())) {
			alert("비밀번호를 잘못 입력하였습니다.\n비밀번호는 8~20자의 영문 소대문자, 숫자와 특수기호 '~!@#^*_'만 사용 가능합니다.");
			$("#userpwd1").focus();
			return false;
		}
		// 비밀번호 일치(userpwd2)	
		if ($('#userpwd1').val() !== $('#userpwd2').val()) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#userpwd2').focus();
			return false;
		}

		// nickname
		if ($('#nicknameCheck').val() === 'N') {
			alert('닉네임 중복체크 확인 후에 회원수정을 해주세요.');
			$('#nickname').focus();
			return false;
		}

		//전화번호
		if (!reg1.test($('#tel1').val()) || !reg2.test($('#tel2').val()) || !reg3.test($('#tel3').val())) {
			alert('전화번호를 잘못입력했습니다.');
			return false;
		}

		//이메일
		if ($('#email').val() === '') {
			alert('이메일 주소를 입력해주세요.');
			$('#email').focus();
			return false;
		}

		//주소
		/*if ($('#address').val() === '') {
			alert('주소를 입력해주세요.');
			$('#address').focus();
			return false;
		}*/

		return true;
	});
});
