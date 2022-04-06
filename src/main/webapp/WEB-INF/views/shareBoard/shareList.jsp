<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<link rel="stylesheet" href="/css/shareList.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js" crossorigin="anonymous"></script>
<script src="/js/shareList.js"></script>
<div class="container">
		<br/>
		<h1>나눔 게시판</h1>
		<br/>
		<div class="row">
			
			<div class="col-sm-4">
				<div class="card-deck" >
					<div class="card">
      				<div class="embed-responsive embed-responsive-4by3">
       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
      					<div class="card-img-overlay">
      							<span><i class="fa fa-heart"></i>pick</span>
      					</div>
      				</div>
					<div class="card-body">
							<ul>
									<li>닉네임</li>
									<li><a href="/shareBoard/shareView">제목</a></li>
									<li><i class="fa fa-user"></i> 참여인원</li>
									<li><i class="fa fa-location-arrow"></i> 주소</li>
									<li>등록시간<span>조회수</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="card">
					<div class="card-body">이미지</div>
					<div class="card-footer">내용</div>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="card">
					<div class="card-body">이미지</div>
					<div class="card-footer">내용</div>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="card">
					<div class="card-body">이미지</div>
					<div class="card-footer">내용</div>
				</div>
			</div>
			
		</div>
		<br/>
</div>