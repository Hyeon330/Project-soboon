$(function(){
	$(".topTagBtn").on('click',function(){
		location.href="/board/"+$(this).attr("title")+"BoardList";
	})
});
	