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
	<div style="width:30%; height:100%;background: #ddd">
		<h1>마이페이지</h1>
		<hr/>
		<ul>
			<li>개인정보수정</li>
			<li>내가쓴글보기</li>
			<li>채팅</li>
			<li>회원탈퇴</li>
		</ul>
	</div>
	<div id="content" style="width:70%; background: blue; height:100%;">
		<h1>content</h1>
	</div>
</div>