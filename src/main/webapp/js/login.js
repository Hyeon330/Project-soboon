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
<<<<<<< HEAD
=======

$(document).ready(function(){
	let codeURL = new URL(window.location.href);
	let code = codeURL.searchParams.get('code');
	
	if(code != null){
		console.log("codeURL: " + codeURL);
		console.log("code: " + code);
		
		/*토큰 가져오기 */
		function selectMyAccessToken(){
			let param = {"code: " : code};
			
			$.ajax({
				url:'/member/selectMyAccessToken',
				type:'get',
				data:param,
				contentType:"application/json;charset=UTF-8",
				success:function(res){
					location.href="/member/mypage/mypageView"; //연동 성공시 마이페이지로 이동
				}
			})
		}
		selectMyAccessToken();
	}else{
		console.log("코드 존재하지 않음");
	}
})
>>>>>>> index_seongeun
