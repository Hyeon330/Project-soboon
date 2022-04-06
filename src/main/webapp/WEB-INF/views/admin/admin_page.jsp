<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tab example</title>
	<style>
		#container {
			width:1800px;
			margin:0 auto;
			text-align:center;
		}
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		/* Float the list items side by side */
		.tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.tab li a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
		/* Style the tab content */
		.tabcontent {
			display: none;
			background-color:rgb(0,154,200);
			padding: 6px 12px;
			color:#fff;
		}
		ul.tab li.current{
			background-color: rgb(0,154,200);
			color: #222;
		}
		.tabcontent.current {
			display: block;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<div id="container">
		
		<br/><h2><b>==어서오세요 관리자 페이지입니다.==</b></h2><hr/>
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">회원관리</a></li>
			<li data-tab="tab2"><a href="#">신고관리</a></li>
			<li data-tab="tab3"><a href="#">어쩌고</a></li>
			<li data-tab="tab4"><a href="#">저쩌고</a></li>

		</ul>
		<hr/>
		<div id="tab1" class="tabcontent current">
			<h3>회원관리</h3>
			회원관리가 들어갈 자리입니다.<br/>회원관리가 들어갈 자리입니다.<br/>회원관리가 들어갈 자리입니다.<br/>회원관리가 들어갈 자리입니다.<br/>
		</div>

		<div id="tab2" class="tabcontent">
			<h3>신고관리</h3>
			신고관리가 들어갈 자리입니다.<br/>신고관리가 들어갈 자리입니다.<br/>신고관리가 들어갈 자리입니다.<br/>신고관리가 들어갈 자리입니다.<br/>
		</div>

		<div id="tab3" class="tabcontent">
			<h3>어쩌고</h3>
			어쩌고의 자리입니다.<br/>어쩌고의 자리입니다.<br/>어쩌고의 자리입니다.<br/>어쩌고의 자리입니다.<br/>어쩌고의 자리입니다.<br/>
		</div>

		<div id="tab4" class="tabcontent">
			<h3>저쩌고</h3>
			저쩌고의 자리입니다.<br/>저쩌고의 자리입니다.<br/>저쩌고의 자리입니다.<br/>저쩌고의 자리입니다.<br/>저쩌고의 자리입니다.<br/>
		</div>
	</div>

	<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>
</body>
</html>
</body>
</html>