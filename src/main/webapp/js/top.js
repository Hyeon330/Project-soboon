$(function(){
	$(".topTagBtn").on('click',function(){
		location.href="/board/"+$(this).attr("title")+"BoardList";
	})
	
	$('#searchFrm').submit(function(e) {
		e.preventDefault();
		var data = $('#searchFrm').serialize();
		var category = data.split('&')[0].split('=')[1]
		if(category == 'share'){
			location.href="/board/shareBoardList?"+data;
		}else if(category == 'rent'){
			location.href="/board/rentBoardList?"+data;
		}else if(category == 'sale'){
			location.href="/board/saleBoardList?"+data;
		}else {
			location.href="/board/reqBoardList?"+data;
		}
	});
});
	