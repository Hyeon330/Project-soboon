<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/shareAndReqView.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("#shareAndReqDel").click(function(){
			if(confirm("삭제하시겠어요?")){
				location.href="/board/shareAndReqDel?no=${viewVo.no}&category=${viewVo.category}";
			}
		});
		$("#joinPlus").click(function(){
			let no = "${viewVo.no}"
			let userid = "${viewVo.userid}";
			console.log(no);
			console.log(userid);
			$.ajax({
				type:"POST",
				url:"/board/joinPlus",
				data:{"no":no,"userid":userid},
				dataType:"json",
				success:function(result){
					alert("성공적으로 참가하였습니다.");
					$("#joinUpdate").text(result);
				},error:function(e){
					alert("참여에 실패했습니다.");
				}
			});
		});
	});
</script>
<div class="container">
	<div class="row">

		<div class="col-6 sri">
			<div id="demo" class="carousel slide">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
					<li data-target="#demo" data-slide-to="3"></li>
				</ul>
				<!-- The slideshow -->
				<div class="carousel-inner">
					<c:choose>
						<c:when test="${viewVo.thumbnailImg!=null}">
							<div id="carousel-item active">
								<img src="/upload/${viewVo.thumbnailImg}"/>
							</div>
						</c:when>
						<c:when test="${viewVo.img1!=null}">
							<div id="carousel-item active">
								<img src="/upload/${viewVo.img1}"/>
							</div>
						</c:when>
						<c:when test="${viewVo.img2!=null}">
							<div id="carousel-item active">
								<img src="/upload/${viewVo.img2}"/>
							</div>
						</c:when>
						<c:when test="${viewVo.img3!=null}">
							<div id="carousel-item active">
								<img src="/upload/${viewVo.img3}"/>
							</div>
						</c:when>
						<c:otherwise>
							<div id="carousel-item active">
								<img src="/img/1.jpg"/>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- Left and right controls -->
				<c:choose>
					<c:when test="${viewVo.thumbnailImg!=null}">
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" style="background:yellow"></span>
						</a> 
						<a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</c:when>
				</c:choose>
				
			</div>
		</div>
		
		<div class="col-6 srb">
			<div id="productTitle">
				<c:if test="${viewVo.category=='share'}">
					<span id="category">나눔</span>
				</c:if>
				<h2><span id="titleInner">${viewVo.title}</span></h2>
			</div>
			<hr/>
			<div id="productIcon">
				<div class="btn" id="pick">좋아요</div>
				<div class="proIcon"><i class="fa fa-eye fa-lg"></i><span class="iconValue">${viewVo.views}</span></div>
				<div class="proIcon"><i class="fa fa-clock fa-lg"></i><span class="iconValue">${viewVo.createdate}</span></div>
				<div class="btn" id="proWarn"><i class="fa fa-bell"></i><span class="iconValue">신고하기</span></div>
			</div>
			<hr/>
			<div id="userInfo">
				<div><i class="fa fa-user fa-5x"></i></div>
				<div id="userinfoInner">
					<div>${viewVo.nickname}</div>
					<div>${viewVo.address}</div>
				</div>
			</div>
			<hr/>
			<div id="joinMember">
				<div><i class="fa fa-user fa-3x"></i></div>
				<div>나눔 인원</div>
				<div id="joinUpdate">${viewVo.joinno}&nbsp;명</div>
			</div>
			<hr/>
			<div class="ProductBtns">
				<div class="col-12 text-center pb">
					<input type="button" class="btn" name="joinPlus" id="joinPlus" value="참여">
				</div>
				<div class="col-12 text-center pb">
					<input type="submit" class="btn" id="joinMinus" name="joinMinus" value="참여취소">
					<span id="btnSpace"></span><input type="submit" class="btn" id="joinChat" name="joinChat" value="채팅방 입장">
				</div>
				<c:if test="${logId==viewVo.userid}">
					<div class="col-12 text-center pb">
						<a href="/board/shareAndReqEdit?no=${viewVo.no}&category=${viewVo.category}" class="btn" id="shareEdit">수정</a>
						<span id="btnSpace"></span><input type="button" class="btn" id="shareAndReqDel" value="삭제"/>
					</div>
				</c:if>
			</div>
		</div>
		<div class="col-12 src" >	
			<div id="shareAndReqContent">${viewVo.content}</div>
		</div>
		<div class="col-12">
			<hr/>
			<form>
				<div><i class="fa fa-comment fa-lg"></i><span class="iconValue">댓글</span></div>
				<div id="commentLine">
					<textarea name="coment" id="coment" class="shareAndReqComent" rows="4" cols="80" placeholder="내용을 입력하세요"></textarea>
					<span id="replyBtn"><input type="submit" class="btn" id="replyInsert" name="replyInsert" value="댓글 등록"></span>
				</div>
			</form>
		</div>
	</div>
</div>
<br />