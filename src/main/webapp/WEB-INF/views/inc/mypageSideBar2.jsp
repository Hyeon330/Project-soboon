<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	var pageSubmitFn = function(menu) {
		if(menu === 'editForm') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		if(menu === 'showView') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		if(menu === 'delMember') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
	}
	
	$(function(){
		$(".list-group-item").removeClass('active');
		
		var pageName = "<c:out value='${param.pageName}'/>";
		
		$('#'+pageName).addClass('active');
		
		$('.list-group-item').click(function(){
			console.log(this);
			
			var menu = $(this).attr('id');
			
			console.log(menu);
			
			pageSubmitFn(menu);
		});
		
		$.ajax 
		
		
	});

</script>


<style>
	#sideMenu>li {
		background-color:RGB(252, 249, 248);
	}
	#sideMenuFrm>hr {
		height: 5px; background: #ddd; border-style: none;
	}
	.active {font-size:1.5em; background-color:orange !important; border-style: none !important;}
	button {
		border-style: none; background-color: red; height:100%;
	}
	.list-group-item {
		
	}
	
	
</style>


<div id= "sideMenuFrm"style="width:30%; height:100%;">
		<h1>마이페이지</h1>
		<hr/>
		<ul id="sideMenu"  class="list-group list-group-flush">
			<li class="list-group-item" id="showView"><button>내가 쓴 글보기</button></li>
			<li class="list-group-item" id="editForm"><a href="#"  class="sidebarMenu">개인정보수정</a></li>
			<li class="list-group-item" id="delMember"><a href="#" class="sidebarMenu">회원탈퇴</a></li>
		</ul>
</div>
<div style="width:5%; height:100%"></div>
</body>


