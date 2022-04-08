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
	<a href="/shareBoard/shareWrite" class="btn" id="shareWrite">글 작성하기</a>
	<br/>
	<div class="row">
	<c:forEach var="vo" items="${list}">
		<div class="col-sm-4 sl">
			<div class="card-deck" >
				<div class="card">
     				<div class="embed-responsive embed-responsive-4by3">
      						<div id="uploadResult">
      							<a href="/shareBoard/shareView">
	      							<c:if test="${vo.thumbnailImg==null}">
	      								<img src="/img/books.jpg" name="thumbnailImg" id="thumbnailImg" class="embed-responsive-item">
	      							</c:if>
	      							<!--<c:if test="${vo.thumbnailImg!=null}">
	      								${vo.thumbnailImg}
	      							</c:if>-->
      							</a>
      						</div>
     					<div class="card-img-overlay">
     						<span id="heart"><i class="fa fa-heart fa-lg"></i><span class="iconValue">${vo.pick}</span></span>
     					</div>
     				</div>
				<div class="card-body cb">
						<ul>
							<li>닉네임</li>
							<li id="shareTitle"><a href="/shareBoard/shareView?no=${vo.no}">${vo.title}</a></li>
							<li><i class="fa fa-user fa-lg"></i><span class="iconValue">${vo.joinno}</span></li>
							<li><i class="fa fa-location-arrow fa-lg"></i><span class="iconValue">주소</span></li>
							<li>${vo.createdate}<span id="views"><i class="fa fa-eye fa-lg"></i><span class="iconValue">${vo.views}</span></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>	
	</div>
	<br/>
</div>