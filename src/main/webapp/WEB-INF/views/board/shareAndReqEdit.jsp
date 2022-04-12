<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/shareAndReqEdit.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<script src="/js/shareAndReqEdit.js"></script>
<div class="container">
	<br/>
	<form class="form-group" method="post" action="/board/shareAndReqEditOk?no=${bvo.no}&category=${bvo.category}" id="shareReqForm" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
				<tr>
					<c:if test="${bvo.category=='share'}">
					<th><h1 style="text-align:center;">나눔 게시판 글 작성 폼</h1></th>
					</c:if>
					<c:if test="${bvo.category=='request'}">
					<th><h1 style="text-align:center;">요청 게시판 글 작성 폼</h1></th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="tbBody">
						<input type="text" class="form-control" id="shareAndReqTitle" placeholder="글 제목을 입력하세요."  name="title" maxlength="16" value="${bvo.title}"/>
						<input type="text" class="form-control" id="joinLimit" placeholder="참여인원이 필요하다면 적어주세요."/>	
					</td>
				</tr>
				<tr>
					<td><textarea name="content" id="writeContent" placeholder="글 내용을 입력하세요.">${bvo.content}</textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="fileList">
			<button type="button" class="btn" id="uploadBtn">첨부파일 선택</button>
			<div id="innerFiles" class="totalFile">
			<c:choose>
				<c:when test="${bvo.thumbnailImg!=null && bvo.thumbnailImg!=''}">
					<div>${bvo.thumbnailImg}  &nbsp; <span class="btn xbtn">X</span></div>
					<input type="hidden" name="" value="${bvo.thumbnailImg}"/>
					<input type="hidden" name="fileImg" id="thumbnailImg"/>
					<c:choose>
						<c:when test="${bvo.img1!=null && bvo.img1!=''}">
							<div>${bvo.img1}  &nbsp; <span class="btn xbtn">X</span></div>
							<input type="hidden" name="" value="${bvo.img1}"/>
							<input type="hidden" name="fileImg" id="bvoImg1"/>
						</c:when>
						<c:otherwise>
							<input type="file" name="fileImg" id="img1"/>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${bvo.img2!=null && bvo.img2!=''}">
							<div>${bvo.img2}  &nbsp; <span class="btn xbtn">X</span></div>
							<input type="hidden" name="" value="${bvo.img2}"/>
							<input type="hidden" name="fileImg" id="bvoImg2"/>
						</c:when>
						<c:otherwise>
							<input type="file" name="fileImg" id="img2"/>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${bvo.img3!=null && bvo.img3!=''}">
							<div>${bvo.img3}  &nbsp; <span class="btn xbtn">X</span></div>
							<input type="hidden" name="" value="${bvo.img3}"/>
							<input type="hidden" name="fileImg" id="bvoImg3"/>
						</c:when>
						<c:otherwise>
							<input type="file" name="fileImg" id="img3"/>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<input type="file" name="fileImg" id="thumbnailImg"/>
					<input type="file" name="fileImg" id="img1"/>
					<input type="file" name="fileImg" id="img2"/>
					<input type="file" name="fileImg" id="img3"/>
				</c:otherwise>
			</c:choose>
  			</div>
  		</div>
  		<div class="col-12 text-center">
			<input type="submit" class="btn" id="writeBtn" value="수정"/>
			<input type="reset" id="resetBtn" class="btn" value="취소"/>
		</div>
	</form>
</div>
<br/>