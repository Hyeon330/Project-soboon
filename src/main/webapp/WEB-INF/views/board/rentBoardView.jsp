<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/rentBoardView.css" type="text/css"/>
<script src="/js/boardViewReply.js"></script>
<script src="/js/rentBoardView.js"></script>
<script>
	let nickname = "${nickName}";

	$(function(){
		$("#rentBoardDel").click(function(){
			if(confirm("삭제하시겠어요?")){
				location.href="/board/rentBoardDel?no=${viewVo.no}";
			}	
		});
		
	});
</script>
<div class="container">
	<div class="row">

		<div class="col-6 rbi">
			<div id="demo" class="carousel slide" data-ride="carousel">
			
			  <c:choose>
			  		<c:when test="${viewVo.img4!=null}">
			  			<!-- Indicators -->
			  			<div class="carousel-inner">
			  			</div>
					  	<ul class="carousel-indicators">
					  		<li data-target="#demo" data-slide-to="0" class="active"></li>
					   		<li data-target="#demo" data-slide-to="1"></li>
					   		<li data-target="#demo" data-slide-to="2"></li>
			 	  			<li data-target="#demo" data-slide-to="3"></li>
						</ul>
						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
					    		<img src="/upload/${viewVo.img1}">
					   		</div>
					   		<div class="carousel-item ">
					    		<img src="/upload/${viewVo.img2}">
					   		</div>
					   		<div class="carousel-item ">
					    		<img src="/upload/${viewVo.img3}">
					   		</div>
					   		<div class="carousel-item ">
					    		<img src="/upload/${viewVo.img4}">
					   		</div>
				   		</div>
						 <!-- Left and right controls -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								  <span class="carousel-control-prev-icon"></span>
							</a>
							<a class="carousel-control-next" href="#demo" data-slide="next">
								  <span class="carousel-control-next-icon"></span>
							</a>
			  		</c:when>
			  		<c:otherwise>
			  			<c:choose>
			  				<c:when test="${viewVo.img3!=null}">
			  					<!-- Indicators -->
			  					<ul class="carousel-indicators">
							  		<li data-target="#demo" data-slide-to="0" class="active"></li>
							   		<li data-target="#demo" data-slide-to="1"></li>
							   		<li data-target="#demo" data-slide-to="2"></li>
								</ul>
								<!-- The slideshow -->
								<div class="carousel-inner">
									<div class="carousel-item active">
							    		<img src="/upload/${viewVo.img1}">
							   		</div>
							   		<div class="carousel-item ">
							    		<img src="/upload/${viewVo.img2}">
							   		</div>
							   		<div class="carousel-item ">
							    		<img src="/upload/${viewVo.img3}">
							   		</div>
						   		</div>
								<!-- Left and right controls -->
								<a class="carousel-control-prev" href="#demo" data-slide="prev">
									  <span class="carousel-control-prev-icon"></span>
								</a>
								<a class="carousel-control-next" href="#demo" data-slide="next">
									  <span class="carousel-control-next-icon"></span>
								</a>
			  				</c:when>
			  				<c:otherwise>
			  					<c:choose>
			  						<c:when test="${viewVo.img2!=null}">
			  							<!-- Indicators -->
			  							<ul class="carousel-indicators">
									  		<li data-target="#demo" data-slide-to="0" class="active"></li>
									   		<li data-target="#demo" data-slide-to="1"></li>
										</ul>
										<!-- The slideshow -->
										<div class="carousel-inner">
											<div class="carousel-item active">
									    		<img src="/upload/${viewVo.img1}">
									   		</div>
									   		<div class="carousel-item ">
									    		<img src="/upload/${viewVo.img2}">
									   		</div>
								   		</div>
										<!-- Left and right controls -->
										<a class="carousel-control-prev" href="#demo" data-slide="prev">
											  <span class="carousel-control-prev-icon"></span>
										</a>
										<a class="carousel-control-next" href="#demo" data-slide="next">
											  <span class="carousel-control-next-icon"></span>
										</a>
			  						</c:when>
			  						<c:otherwise>
			  							<c:choose>
			  								<c:when test="${viewVo.img1!=null}">
			  									<div class="carousel-inner">
							  					 	<div class="carousel-item active">
														<img src="/upload/${viewVo.img1}">
													</div>
						  					 	</div>
			  								</c:when>
			  								<c:otherwise>
			  									<div class="carousel-inner">
							  					 	<div class="carousel-item active">
														<img src="/img/share.jpg">
													</div>
						  					 </div>
			  								</c:otherwise>
			  							</c:choose>
			  						</c:otherwise>
			  					</c:choose>
			  				</c:otherwise>
				  		</c:choose>
			  		</c:otherwise>
			  </c:choose>

			</div>
		</div>
				
		
		<div class="col-6 rb">
			<div id="productTitle">
				<span id="category" title="${viewVo.no}">대여</span>
				<h2><span id="titleInner">${viewVo.title}</span></h2>
			</div>
			<hr/>
			<div id="productIcon">
			<c:if test="${logId!=viewVo.userid}">
				<div id="pickDiv">
					<c:if test="${alrPick.userid==null}">
						<input type="button" class="btn" id="pick1" value="찜하기"/>
					</c:if>
					<c:if test="${alrPick.userid==logId}">
						<input type="button" class="btn" id="pick2" value="찜하기"/>
					</c:if>
				</div>
			</c:if>
			<c:if test="${logId==viewVo.userid}">
				<div class="proIcon"><i class="fa fa-heart fa-lg"></i><span class="iconValue">${viewVo.pick}</span></div>
			</c:if>
				<div class="proIcon"><i class="fa fa-eye fa-lg"></i><span class="iconValue">${viewVo.views}</span></div>
				<div class="proIcon"><i class="fa fa-clock fa-lg"></i><span class="iconValue">${viewVo.createdate}</span></div>
			<c:if test="${logId!=viewVo.userid}">
				<div class="btn" id="proWarn"><i class="fa fa-bell"></i><span class="iconValue">신고하기</span></div>
			</c:if>
				<%@ include file="/WEB-INF/views/inc/report.jsp" %>
			</div>
			<hr/>
			<div id="userInfo">
				<div><i class="fa fa-user fa-5x"></i></div>
				<div id="userinfoInner">
					<div id="viewNickname">${viewVo.nickname}</div>
					<div>${viewVo.small}</div>
				</div>
				<div id="rentBoardPrice">
					<div>${viewVo.price} 원</div>
				</div>
			</div>
			<hr/>
			<div class="ProductBtns">
				<c:if test="${logId!=viewVo.userid}">
					<div class="col-12 text-center pb">
						<span id="btnSpace"></span><input type="submit" class="btn" id="joinChat" name="joinChat" value="채팅 보내기">
					</div>
				</c:if>
				<c:if test="${logId==viewVo.userid}">
					<div class="col-12 text-center pb">
						<a href="/board/rentBoardEdit?no=${viewVo.no}" class="btn" id="rentBoardEdit">수정</a>
						<span id="btnSpace"></span><input type="button" class="btn" id="rentBoardDel" value="삭제"/>
					</div>
				</c:if>
			</div>
			<!-- 글내용 -->
			<div class="rentBrdContent">
				<hr/>
				<div>${viewVo.content}</div>
			</div>
		</div>
		
		<!-- 댓글 -->
		<div class="col-12 rp">
			<hr/>
			<div><i class="fa fa-comment fa-lg"></i><span class="iconValue">댓글</span></div>
				<form method="post" id="replyForm">
					<input type="hidden" name="no" id="no" value="${viewVo.no}">
					<div id="commentLine">
						<textarea name="coment" id="coment" class="rentBoardComent" rows="4" cols="80" placeholder="내용을 입력하세요"></textarea>
						<span id="replyBtn"><input type="submit" class="btn" id="replyInsert" value="댓글 등록"></span>
					</div>
				</form>
			<!-- 댓글 목록 표시 -->
			<div id="replyList">
				
			</div>
		</div>
	</div>
</div>
<br />