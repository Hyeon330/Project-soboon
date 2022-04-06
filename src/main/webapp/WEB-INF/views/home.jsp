<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('.bxslider').bxSlider({ 
			auto: true,	//자동실행
			speed: 500,	//변하는 시간
			pause: 4000, 	//사진 멈춘시간
			mode:'fade',	//변하는 모드
			autoControls: true,	//버튼노출여부
			pager:true, 	//현재 위치 페이징 표시 여부
		}); 
	});
</script>
<div class="container">
	<!--bx로 할건지 캐러샐로할건지 다시고민좀.. -->
	<ul class="bxslider">
		<li><img src="/img/1.jpg"/></li>
		<li><img src="/img/2.jpg"/></li>
		<li><img src="/img/3.jpg"/></li>
	</ul>
</div>
<div id="functionIntroduce">
	기능 소개 칸
</div>