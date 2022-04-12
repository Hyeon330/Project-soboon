$(function(){
	
	let currentPg = $("#currentPg").text();
	let nextBtn = Number(currentPg) + 1;
	let prevBtn = Number(currentPg) - 1;
	
	let pageBd = $("#pageBody").text();
	let pageBody = parseInt(pageBd); 
	
	let category = $("#cvoCate").text();
	
	$("#prevBtn").click(function(){
		location.href="/board/shareAndReqList?currentPage="+prevBtn+"&category="+category+"";
	})
	
	$("#pageBody").click(function(){
		location.href="/board/shareAndReqList?currentPage="+pageBody+"&category="+category+"";
	});
	
	$("#nextBtn").click(function(){
		location.href="/board/shareAndReqList?currentPage="+nextBtn+"&category="+category+"";
	})
});