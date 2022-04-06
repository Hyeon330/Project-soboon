function memberCheck(){
	var reg = /^[a-zA-Z]{1}[a-zA-Z0-9_]{7,11}$/;
	if($("#userid").val()==""){
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false;
	}
		
	if(!reg.test($("#userid").val())){//정규표현식에 맞으면 true, 아니면 false
		alert("아이디를 잘못 입력하였습니다.\n아이디는 8~12 사이여야 합니다.\n첫번째 문자는 영어대문자, 영어, 숫자, _가 혀용됩니다.");
		$("#userid").focus();
		return false;
	}
	
	let userid = document.getElementById("userid");
	if(userid.value==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(document.getElementById("idChk").value=='N'){
		alert("아이디 중복 검사하세요.");
		return false; 
	}
	
	let userpwd = document.getElementById("userpwd");
	let userpwd2 = document.getElementById("userpwd2");
	if(userpwd.value=='' || userpwd2.value==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(userpwd2.value!=userpwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	let username = document.getElementById("username");
	if(username.value==""){
		alert("이름을 입력하세요.");
		return false;
	}
	
	let tel1 = document.getElementById("tel1");
	let tel2 = document.getElementById("tel2");
	let tel3 = document.getElementById("tel3");
	
}