<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	var pageSubmitFn = function(menu) {
		alert("menu :" + menu);
	}	

</script>


<style>
	#sideMenu>li {
		background-color:RGB(252, 249, 248);
	}
	#sideMenuFrm>hr {
		height: 5px; background: #ddd; border-style: none;
	}
	.active {font-size:1.5em;}
</style>


<div id= "sideMenuFrm"style="width:30%; height:100%;">
		<h1>마이페이지</h1>
		<hr/>
		<ul id="sideMenu"  class="list-group list-group-flush">
			<li class="list-group-item"><a href="/mypageEdit" id="editInfo" class="sidebarMenu" onclick="pageSubmitFn('개인정보수정')">개인정보수정</a></li>
			<li class="list-group-item"><a href="#" id="myNote" class="sidebarMenu" onclick="pageSubmitFn('내가쓴글보기')">내가쓴글보기</a></li>
			<li class="list-group-item"><a href="#" id="withdrawal" class="sidebarMenu" onclick="pageSubmitFn('회원탈퇴')">회원탈퇴</a></li>
		</ul>
</div>
<div style="width:5%; height:100%"></div>
</body>


