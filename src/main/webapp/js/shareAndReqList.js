$(function(){
	
	let currentPg = $("#currentPg").val();
	let nextBtn = Number(currentPg) + 1;
	let prevBtn = Number(currentPg) - 1;

	let category = $("#cvoCategory").val();
	
	$("#prevBtn").click(function(){
		location.href="/board/shareAndReqList?currentPage="+prevBtn+"&category="+category+"";
	})
	
	
	$("#nextBtn").click(function(){
		location.href="/board/shareAndReqList?currentPage="+nextBtn+"&category="+category+"";
	})
	
	
});

	function goPage(p, category){
			location.href="/board/shareAndReqList?currentPage="+p+"&category="+category+"";
	}