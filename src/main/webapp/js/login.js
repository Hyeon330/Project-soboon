function loginFrmCheck(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		if($("#userpwd").val()==''){
			alert("비밀번호를 입력하세요.");
			$("#userpwd").focus();
			return false;
		}
		return true;
}
