function memberCheck(){
	var reg = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
	if($("#userid").val()==""){
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false;
	}
	if(!reg.test($("#userid").val())){
		alert("아이디를 잘못 입력하였습니다.\n아이디는 6~12 사이여야 합니다.\n아이디는 영문자로 시작해야합니다.");
		$("#userid").focus();
		return false;
	}
	
	reg = /^[a-zA-Z0-9~!@#^*_]{7,15}$/;
	if($("#userpwd").val()==''){
		alert("비밀번호를 입력하세요.");
		$("#userpwd").focus();
		return false;
	}
	if (!reg.test($("#userpwd").val())) {
		alert("비밀번호를 잘못 입력하였습니다.\n비밀번호는 8~20자의 영문 소대문자, 숫자와 특수기호 '~!@#^*_'만 사용 가능합니다.");
		$("#userpwd").focus();
		return false;
	}
	if ($("#userpwd").val() != $("#userpwd2").val()) {
		alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
		$("#userpwd2").focus();
		return false;
	}
	
	/*reg = /^[가-힣]{2,7}$/;
	if (!reg.test($("#username").val())) {
		alert("이름을 잘못 입력하였습니다. 이름은 2~7글자내로 입력하셔야 합니다.");
		$("#username").focus();
		return false;
	}*/
	
	let tel1 = document.getElementById("tel1");
	let tel2 = document.getElementById("tel2");
	let tel3 = document.getElementById("tel3");
	
}