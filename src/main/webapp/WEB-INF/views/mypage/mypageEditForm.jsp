<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#mypageContainer { height: 500px;}
	#mypageContainer>div {
		float: left;
	}
	#mypageContainer>div>ul>li {
		border-bottom: 1px solid white;
		margin-top: 10px;
	}
</style>
<div class="container" id="mypageContainer">
<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp" %>
<!--  view -->
	<div id="content" style="width:70%; background: blue; height:100%;">
		<h1>개인정보수정</h1>
		<hr/>
		<form>
		<ul>
			<li>아이디 : <input type="text" id="userid" name="userid"/></li>
			<li>비밃번호 : <input type="password" id="userpwd" name="userpwd"/></li>
			<li>비밀번호 확인 : <input type="password" id="userpwd2"/></li>
			<li>이름 : <input type="text" id="username" name="username"/></li>
			<li>닉네임 : <input type="text" id="nickname" name="nickname"/></li>
			<li>이메일 : <input type="email" id="email" name="email"/></li> 
		</ul>
		</form>
	</div>
</div>