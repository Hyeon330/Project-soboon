<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/shareView.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js" crossorigin="anonymous"></script>
<div class="container">
	<div class="row">

		<div class="col-6 sv">
			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				
				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/img/books.jpg" >
					</div>
					<div class="carousel-item">
						<img src="/img/book1.png">
					</div>
					<div class="carousel-item">
						<img src="/img/book2.jpg" >
					</div>
					<div class="carousel-item">
						<img src="/img/book3.jpg">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>
		</div>
		
		<div class="col-6 sv">
			<form class="productInfo">
					<div id="productTitle">
							<span id="category">vo.category</span><h2>[vo.category] 책 나눔합니다.</h2>
					</div>
					<hr/>
					<div id="productIcon">
							<div><i class="fa fa-heart fa-lg"></i> 30</div>
							<div><i class="fa fa-eye fa-lg"></i> 30 </div>
							<div><i class="fa fa-clock fa-lg"></i> 1분전</div>
							<div><i class="fa fa-bell fa-lg"></i> 신고하기</div>
					</div>
					<div id="userInfo">
							<div><i class="fa fa-user fa-5x"></i></div>
							<div id="userinfoInner">
									<div>닉네임</div>
									<div>서울 도봉구 창2동</div>
							</div>
					</div>
					<hr/>
					<div id="joinMember">
							<div><i class="fa fa-user fa-3x"></i></div>
							<div>나눔 인원</div>
							<div>5명/6명</div>
					</div>
					<hr/>
				<textarea name="content" id="content" class="shareContent" rows="5" cols="70" placeholder="내용을 입력하세요"></textarea>
				<div class="col-12 text-center">
						<input type="submit" class="btn" id="joinPlus" name="joinPlus" value="참여">
				</div>
				<div class="col-12 text-center">
						<input type="submit" class="btn" id="joinMinus" name="joinMinus" value="참여취소">
						<input type="submit" class="btn" id="joinChat" name="joinChat" value="채팅방 입장">
				</div>
				<div class="col-12 text-center">
						<input type="submit" class="btn" id="shareEdit" name="shareEdit" value="수정">
						<input type="submit" class="btn" id="shareDel" value="삭제">
				</div>
			</form>
		</div>
		
		<div class="col-12">
		<hr/>
			<div><i class="fa fa-comment fa-lg"></i>   댓글</div>
			<textarea name="coment" id="coment" class="shareComent" rows="4" cols="110" placeholder="내용을 입력하세요"></textarea>
			<div>
				<input type="submit" class="btn" id="replyInsert" name="replyInsert" value="댓글 등록">
			</div>
		</div>
	</div>
</div>
<br />