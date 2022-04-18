$(document).ready(function(){
	$(".functionImage").hover(function(){
		$(this).css('transform', 'translate(0px, -10px)');
	}, function(){
		$(this).css('transform', 'translate(0px, 10px)');
	});
});

let target = document.querySelector("#dynamic");
let cnt = 0;
function randomString(){
	let stringArr = ["혼자라서 부족했던", "많이 사서 남았던", "필요했는데 없었던"];
	let selectString = stringArr[cnt++];
	if(cnt==stringArr.length) cnt=0;
	let selectStringArr = selectString.split("");
	
	return selectStringArr;
}

//타이핑 리셋
function resetTyping(){
	target.textContent="";
	dynamic(randomString());
}

//한글자씩 출력하는 함수
function dynamic(randomArr){
	if(randomArr.length > 0){
		target.textContent += randomArr.shift();
		setTimeout(function(){ 
			dynamic(randomArr);
		}, 80)
	}else{
	setTimeout(resetTyping, 3000);
	}
}

dynamic(randomString());

$('.slide>ul>li').hide();
$('.slide>ul>li:first-child').show();
setInterval(function(){
	$('.slide>ul>li:first-child').fadeOut().next().fadeIn().end(1000).appendTo('.slide>ul');
}, 3720)


/*카카오톡 로그인!!!!!!!!------------------------------------------------------- */
/*토큰 가져오기 */
function selectMyAccessToken(){
	let param = {"code: " : code};
	
	$.ajax({
		url:'/member/selectMyAccessToken',
		type:'get',
		data:param,
		contentType:"application/json; charset=UTF-8",
		success:function(){
			location.href="/mypage/editForm"; //연동 성공시 마이페이지로 이동
		}
	})
}
let codeURL = null;
let code = null;
$(function(){
	codeURL = new URL(window.location.href);
	code = codeURL.searchParams.get('code');
	if(code != null){
		selectMyAccessToken();
		alert("처음 카카오톡 로그인시, 마이페이지에서 회원정보를 수정해주세요!\n기본 비밀번호는 '0000' 입니다.");
	}else{
		//console.log("코드 존재하지 않음");
	}
})
/*=========================================================================== */