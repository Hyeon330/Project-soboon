<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/shareBoardList.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js" crossorigin="anonymous"></script>
<script src="/js/shareBoardList.js"></script>
<div class="container">
	<br/>
		<h1 id="shareBrd">나눔 게시판</h1>
		<br/>
		<a href="/board/shareBoardWrite" class="btn" id="shareBoardWrite">글 작성하기</a>
		<div class="row">
			<c:forEach var="listVo" items="${list}">
			<div class="col-sm-4 sb">
				<div class="card">
	    			<div class="embed-responsive embed-responsive-4by3">
     					<a href="/board/shareBoardView?no=${listVo.no}">
     							<c:if test="${listVo.thumbnailImg==null}">
     								<img src="/img/share.jpg" class="embed-responsive-item">
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
							<li id="shareBoardTitle"><a href="/board/shareBoardView?no=${listVo.no}">${listVo.title}</a></li>
							<li><i class="fa fa-location-arrow fa-lg"></i><span class="iconValue">${listVo.address}</span></li>
							<li>${listVo.createdate}<span id="views"><i class="fa fa-eye fa-lg"></i><span class="iconValue">${listVo.views}</span></span></li>
						</ul>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="row">
			<ul class="pagination justify-content-center" id="paging">
				<c:if test="${pvo.currentPage==1}">
					<li class="page-item disabled"><a class="page-link" id="prevBtn">Prev</a></li>
				</c:if>
				<c:if test="${pvo.currentPage>1}">
					<li class="page-item"><a class="page-link" href="javascript:void(0);" id="prevBtn" 
							onclick="goPrev(${pvo.currentPage})">Prev</a></li>
				</c:if>
				<c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
					<c:if test="${p<=pvo.totalPage}">
						<c:choose>
							<c:when test="${p==pvo.currentPage}">
								<li class="page-item disabled"><a class="page-link">${p}</a></li>
							</c:when>
							<c:when test="${p!=pvo.currentPage}">
								<li class="page-item"><a class="page-link"href="javascript:void(0);"
										onclick="goPage(${p})">${p}</a></li>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${pvo.currentPage==pvo.totalPage}">
					<li class="page-item disabled"><a class="page-link" id="nextBtn">Next</a></li>
				</c:if>
				<c:if test="${pvo.currentPage<pvo.totalPage}">
					<li class="page-item"><a class="page-link" href="javascript:void(0);" id="nextBtn"
							onclick="goNext(${pvo.currentPage})">Next</a></li>
				</c:if>
			</ul>
		</div>	
	<br/>
</div>