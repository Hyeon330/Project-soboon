<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>


	$(function() {

		var url = window.location.pathname,

		urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");

		$('a').each(function() {

			if (urlRegExp.test(this.href.replace(/\/$/, ''))) {

				$(this).addClass('active');
			}
		});
	});
</script>

<style>
	#sideMenu>li {
		background-color:rgb(250, 246, 243);
	}
	#sideMenuFrm>hr {
		height: 5px; background: #ddd; border-style: none;
	}
	.active {font-size:1.5em;}
</style>
<body>
<div id= "sideMenuFrm"style="width:30%; height:100%;">
		<h1>마이페이지</h1>
		<hr/>
		<ul id="sideMenu"  class="list-group list-group-flush">
			<li class="list-group-item"><a href="/mypageEdit" id="editInfo" class="sidebarMenu">개인정보수정</a></li>
			<li class="list-group-item"><a href="#" id="myNote" class="sidebarMenu">내가쓴글보기</a></li>
			<li class="list-group-item"><a href="#" id="withdrawal" class="sidebarMenu">회원탈퇴</a></li>
		</ul>
</div>
<div style="width:5%; height:100%"></div>
</body>


