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
	reg = /^[a-zA-Z가-힣]{2,7}$/;
	if($("#username").val()==''){
		alert("이름을 입력하세요.");
		$("#username").focus();
		return false;
	}
	if (!reg.test($("#username").val())) {
		alert("이름을 잘못 입력하였습니다. 이름은 2~7글자내로 입력하셔야 합니다.");
		$("#username").focus();
		return false;
	}  	
	reg = /^[가-힣]{2,7}$/;
	if($("#nickname").val()==''){
		alert("닉네임을 입력하세요.");
		$("#nickname").focus();
		return false;
	}
	if (!reg.test($("#nickname").val())) {
		alert("닉네임을 잘못 입력하였습니다. 닉네임은 2~7글자내로 입력하셔야 합니다. 한글만 가능합니다.");
		$("#nickname").focus();
		return false;
	}  
	
	var tel = $("#tel1").val() + "-";
		tel += $("#tel2").val() + "-";
		tel += $("#tel3").val();
	reg = /^(010|02|031|032|041|043|051|061)[-][0-9]{3,4}[-][0-9]{4}$/;
	if (!reg.test(tel)) {
		alert("전화번호를 잘못 입력하였습니다.");
		$("#tel1").focus();
		return false;
	}
	
	reg=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;	
	if($("#email").val()==''){
		alert('이메일을 입력하세요.');
		$("#email").focus();
		return false;
	}
	if (!reg.test($("#email").val())) {
		alert("이메일을 잘못 입력하였습니다. \n예시)example@naver.com");
		$("#email").focus();
		return false;
	}
	
	if($("#address").val()==''){
		alert("주소를 입력하세요.");
		$("#address").focus();
		return false;
	}
}
$(function(){
		$("#userid").keyup(function(){
			var userid = $("#userid").val();
			if(userid!='' && userid.length>=6){
				var url = "/member/memberIdCheck";
				$.ajax({
					url:url,
					data:"userid="+userid,
					type:"post",
					success:function(res){
						if(res>0){
							$("#chk").html("사용불가합니다.");
							$("#idChk").val('N');
							$("#chk").css("color","red");
						} else{
							$("#chk").html("사용가능합니다.");
							$("#idChk").val('Y');
							$("#chk").css("color","green");
						}
					}
				});
			} else{
				$("#chk").html("사용불가합니다.");
				$("#idChk").val('N');
				$("#chk").css("color","red");
			}
		});
		$("#nickname").keyup(function(){
			var nickname = $("#nickname").val();
			if(nickname!=''){
				var url = "/member/memberNicknameCheck";
				$.ajax({
					url:url,
					data:"nickname="+nickname,
					type:"post",
					success:function(res){
						if(res>0){
							$("#nchk").html("사용불가합니다.");
							$("#nickChk").val('N');
							$("#nchk").css("color","red");
						} else{
							$("#nchk").html("사용가능합니다.");
							$("#nickChk").val('Y');
							$("#nchk").css("color","green");
						}
					}
				});
			} else{
				$("#nchk").html("사용불가합니다.");
				$("#nickChk").val('N');
				$("#nchk").css("color","red");
			}
		});
	});
