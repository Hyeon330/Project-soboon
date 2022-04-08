<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<link rel="stylesheet" href="/css/shareList.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js" crossorigin="anonymous"></script>
<script src="/js/shareList.js"></script>
<div class="container">
	<br/>
	<h1 id="nanum">나눔 게시판</h1>
	<br/>
	<a href="/shareBoard/shareWrite" class="btn" id="shareWrite">글작성하기</a>
	<br/>
	<div class="row">
		<div class="col-sm-4 sl">
			<div class="card-deck" >
				<div class="card">
     				<div class="embed-responsive embed-responsive-4by3">
      						<div id="uploadResult">
      							<a href="/shareBoard/shareView">
      							<img src="/img/books.jpg" class="embed-responsive-item">
      							</a>
      						</div>
     					<div class="card-img-overlay">
     						<span id="heart"><i class="fa fa-heart fa-lg"></i> 30</span>
     					</div>
     				</div>
				<div class="card-body cb">
						<ul>
							<li>닉네임</li>
							<li id="title"><a href="/shareBoard/shareView">제목</a></li>
							<li><i class="fa fa-user fa-lg"></i> 참여인원</li>
							<li><i class="fa fa-location-arrow fa-lg"></i> 주소</li>
							<li>등록시간<span id="views"><i class="fa fa-eye fa-lg"></i>  30</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-sm-4 sl">
			<div class="card">
				<div class="card-body">이미지</div>
				<div class="card-footer">내용</div>
			</div>
		</div>
		
		<div class="col-sm-4 sl">
			<div class="card">
				<div class="card-body">이미지</div>
				<div class="card-footer">내용</div>
			</div>
		</div>
		
		<div class="col-sm-4 sl">
			<div class="card">
				<div class="card-body">이미지</div>
				<div class="card-footer">내용</div>
			</div>
		</div>
		
	</div>
	<br/>
</div>