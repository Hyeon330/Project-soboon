<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home.css" type="text/css" />
<div class="mainContainer">
	<div class="typingContainer">
		<p id="dynamic" class="lg-text active1"></p>
		<br />
		<p class="sm-text">
			모든 1인, 소규모 가구의 불편함을 덜어주는 <br /> 이웃 대상 커뮤니티 서비스
		</p>
	</div>
	<div class="slide">
		<ul>
			<li><img src="/img2/1.jpg" /></li>
			<li><img src="/img2/2.jpg" /></li>
			<li><img src="/img2/3.jpg" /></li>
		</ul>
	</div>
</div>
<div style="clear: both"></div>

<div id="midContainer">
	<div id="functionIntroduce">
		<br /> <br /> <br />
		<h1 id="fuctionTitle" style="text-align: center; font-weight: 900; color: rgb(72, 97, 86);">소분소분의 이야기</h1>
		<br /> 
		<a href="/board/shareBoardList">
			<img src="/img/inform1.png" class="functionImage" />
		</a>
		<a href="/board/rentBoardList">
			<img src="/img/inform2.png" class="functionImage" />
		</a>
		<a href="/board/saleBoardList">
			<img src="/img/inform3.png" class="functionImage" />
		</a>
		<a href="/board/requestBoardList">
			<img src="/img/inform4.png" class="functionImage" />
		</a>
	</div>
</div>
<div style="clear: both"></div>
<c:if test="${logStatus=='Y'}">
	<div id="recentItem">
		<div id="bottomContainer">
			<br /> <br />
			<h1 id="fuctionTitle" style="text-align: center; font-weight: 900; color: rgb(72, 97, 86);">최근 게시물</h1>
			<br /> <br />
			<div class="row">
				<c:forEach var="listVo" items="${list}">
					<div class="col-sm-3 sr">

						<div class="card">
							<div class="embed-responsive embed-responsive-4by3">
								<a href="/board/${listVo.category}View?no=${listVo.no}&category=${listVo.category}">
									<c:if test="${listVo.thumbnailImg==null}">
     									<img src="/img/thumbnail_${listVo.category}.jpg" class="embed-responsive-item">
     								</c:if>
     								<c:if test="${listVo.img1!=null}">
     									<img src="/upload/${listVo.img1}" class="embed-responsive-item">
     								</c:if>
     								<span id="heart" class="card-img-overlay"><i class="fa fa-heart fa-lg"></i>&nbsp;${listVo.pick}</span>
								</a>
							</div>
							<div class="card-body cb">
								<ul>
									<c:if test="${listVo.category == 'share'}">
										<li style="font-size: 1.5em; font-weight: 900">나눔</li>
									</c:if>
									<c:if test="${listVo.category == 'rent'}">
										<li style="font-size: 1.5em; font-weight: 900">대여</li>
									</c:if>
									<c:if test="${listVo.category == 'sale'}">
										<li style="font-size: 1.5em; font-weight: 900">판매</li>
									</c:if>
									<c:if test="${listVo.category == 'request'}">
										<li style="font-size: 1.5em; font-weight: 900">요청</li>
									</c:if>
									<li>${listVo.nickname}</li>
									<li><i class="fa fa-location-arrow fa-lg">&nbsp;</i>${listVo.small}</li>
									<li id="shareBoardTitle">
										<a href="/board/${listVo.category}BoardView?no=${listVo.no}">${listVo.title}</a>
									</li>
									<li>${listVo.createdate}</li>
									<li><i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;${listVo.views}</li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</c:if>
<script src="/js/home.js"></script>