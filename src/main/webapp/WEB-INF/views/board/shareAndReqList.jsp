<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/shareAndReqList.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js" crossorigin="anonymous"></script>
<div class="container">
	<br/>
	<c:if test="${vo.category=='share'}">
		<h1 id="shareBrd">나눔 게시판</h1>
		<br/>
		<a href="/board/shareAndReqWrite?category=share" class="btn" id="shareReqWrite">글 작성하기</a>
		<div class="row">
			<c:forEach var="listVo" items="${list}">
				<div class="col-sm-4 sr">
						<div class="card">
			    			<div class="embed-responsive embed-responsive-4by3">
		     					<a href="/board/shareAndReqView?no=${listVo.no}&category=${listVo.category}">
	      							<c:if test="${listVo.thumbnailImg==null}">
	      								<img src="/img/1.jpg" class="embed-responsive-item">
	      							</c:if>
	      							<c:if test="${listVo.thumbnailImg!=null}">
	      								<img src="/upload/${listVo.thumbnailImg}" class="embed-responsive-item">
	      							</c:if>
		    						<span id="heart" class="card-img-overlay"><i class="fa fa-heart fa-lg"></i><span class="iconValue">${listVo.pick}</span></span>
		    					</a>
			    			</div>
							<div class="card-body cb">
								<ul>
									<li>${listVo.nickname}</li>
									<li id="shareAndReqTitle"><a href="/board/shareAndReqView?no=${listVo.no}&category=${listVo.category}">${listVo.title}</a></li>
									<li><i class="fa fa-user fa-lg"></i><span class="iconValue">${listVo.joinno}</span></li>
									<li><i class="fa fa-location-arrow fa-lg"></i><span class="iconValue">${listVo.address}</span></li>
									<li>${listVo.createdate}<span id="views"><i class="fa fa-eye fa-lg"></i><span class="iconValue">${listVo.views}</span></span></li>
								</ul>
							</div>
						</div>
				</div>
		</c:forEach>	
		</div>
	</c:if>
	<c:if test="${vo.category=='request'}">
		<h1 id="requestBrd">요청 게시판</h1>
		<a href="/board/shareAndreqWrite?category=request" class="btn" id="shareReqWrite">글 작성하기</a>
	</c:if>
	<br/>
	
	<br/>
</div>