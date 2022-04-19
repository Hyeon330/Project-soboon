function loginFrmCheck(){
	if ($("#userid").val() == "") {
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false;
	}
	if ($("#userpwd").val() == '') {
		alert("비밀번호를 입력하세요.");
		$("#userpwd").focus();
		return false;
	}
	return true;
}

$(document).ready(function(){
	//눈 아이콘 눌러서 비밀번호 확인하기
	$(".pwd_control i").on('click', function() {
		$("input").toggleClass('active');
		if ($("input").hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg").prev('input').attr('type', 'text');
		} else {
			$(this).attr('class', "fa fa-eye fa-lg").prev('input').attr('type', "password");
		}
	});
});