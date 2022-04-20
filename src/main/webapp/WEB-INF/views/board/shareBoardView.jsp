<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/shareBoardView.css" type="text/css"/>
<link rel="stylesheet" href="/css/board/boardViewReply.css" type="text/css"/>
<script src="/js/board/boardViewReply.js"></script>
<script src="/js/board/boardViewPick.js"></script>
<script>
	let nickname = "${nickName}";

	$(function(){
		
		$("#shareBoardDel").click(function(){
			if(confirm("삭제하시겠어요?")){
				location.href="/board/shareBoardDel?no=${viewVo.no}";
			}	
		});
		
		// 이미 글에 찜한 유저 구하기
		if('${alrPick.no}'!=''){
			$("#pick1").addClass("pick2");
		}else{
			$("#pick1").removeClass("pick2");
		}
		
	});
</script>
<div class="container">
	<div class="row">

		<div class="col-6 sbi">
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
														<img src="/img/thumbnail_share.jpg">
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
				
		
		<div class="col-6 sb">
			<div id="productTitle">
				<span id="category" title="${viewVo.no}">나눔</span>
				<h2 id="titleInner">${viewVo.title}</h2>
			</div>
			<hr/>
			<div id="productIcon">
			<c:if test="${logId!=viewVo.userid}">
				<input type="button" class="btn pick1" id="pick1" value="찜하기"/>
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
						<a href="/board/shareBoardEdit?no=${viewVo.no}" class="btn" id="shareBoardEdit">수정</a>
						<span id="btnSpace"></span><input type="button" class="btn" id="shareBoardDel" value="삭제"/>
					</div>
				</c:if>
			</div>
		</div>
		<!-- 글내용 -->
		<div class="col-12 shareContent">
			<hr/>
			<div>${viewVo.content}</div>
		</div>
		<!-- 댓글 -->
		<div class="col-12 rp">
			<hr/>
			<div><i class="fa fa-comment fa-lg"></i><span class="iconValue">댓글</span></div>
				<form method="post" id="replyForm">
					<input type="hidden" name="no" id="no" value="${viewVo.no}">
					<div id="commentLine">
						<textarea name="coment" id="coment" class="shareBoardComent" rows="4" cols="80" placeholder="내용을 입력하세요"></textarea>
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