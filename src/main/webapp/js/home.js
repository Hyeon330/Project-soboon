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
