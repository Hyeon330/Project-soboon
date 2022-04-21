<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/saleBoardList.css" type="text/css"/>
<script src="/js/board/saleBoardList.js"></script>
<div class="container">
	<br/>
		<h1 id="saleBrd">판매 게시판</h1>
		<br/>
		<a href="/board/saleBoardWrite" class="btn" id="saleBoardWrite">글 작성하기</a>
		<span id="addressInfo">${addrSmall}</span>
		<div class="row">
			<c:forEach var="listVo" items="${list}">
			<div class="col-sm-4 sab">
				<div class="card">
	    			<div class="embed-responsive embed-responsive-4by3">
     					<a href="/board/saleBoardView?no=${listVo.no}">
     							<c:if test="${listVo.thumbnailImg==null}">
     								<img src="/img/thumbnail_sale.jpg" class="embed-responsive-item">
     							</c:if>
     							<c:if test="${listVo.img1!=null}">
     								<img src="/upload/${listVo.img1}" class="embed-responsive-item">
     							</c:if>
    						<span id="heart" class="card-img-overlay"><i class="fa fa-heart fa-lg icon"></i><span class="iconValue">${listVo.pick}</span></span>
    					</a>
	    			</div>
					<div class="card-body cb">
						<ul>
							<li>${listVo.nickname}</li>
							<li id="saleBoardTitle"><a href="/board/saleBoardView?no=${listVo.no}">${listVo.title}</a></li>
							<li><i class="fa fa-location-arrow fa-lg"></i><span class="iconValue">${listVo.small}</span></li>
							<li><span>${listVo.price}원</span></li>
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
					<li class="page-item disabled"><a class="page-link" id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
				</c:if>
				<c:if test="${pvo.currentPage>1}">
					<li class="page-item"><a class="page-link" href="javascript:void(0);" id="prevBtn" 
							onclick="goPrev(${pvo.currentPage})"><i class="fa fa-angle-left"></i></a></li>
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
					<li class="page-item disabled"><a class="page-link" id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
				</c:if>
				<c:if test="${pvo.currentPage<pvo.totalPage}">
					<li class="page-item"><a class="page-link" href="javascript:void(0);" id="nextBtn"
							onclick="goNext(${pvo.currentPage})"><i class="fa fa-angle-right"></i></a></li>
				</c:if>
			</ul>
		</div><!-- row -->
	<br/>
</div>