<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/shareAndReqWrite.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<script src="/js/shareAndReqWrite.js"></script>
<div class="container">
	<br/>
	<form class="form-group" method="post" action="/board/shareAndReqWriteOk?category=${category}" id="shareReqForm" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
				<tr>
					<c:if test="${category=='share'}">
						<th><h1 style="text-align:center;">나눔 게시판 글 작성하기</h1></th>
					</c:if>
					<c:if test="${category=='request'}">
						<th><h1 style="text-align:center;">요청 게시판 글 작성 폼</h1></th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="tbBody">
						<input type="text" class="form-control" id="shareAndReqTitle" placeholder="글 제목을 입력하세요."  name="title" maxlength="16"/>
					</td>
				</tr>
				<tr>
					<td><textarea name="content" id="writeContent" placeholder="글 내용을 입력하세요."></textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="fileList">
			<button type="button" class="btn" id="uploadBtn">첨부파일 선택</button>
			<div id="innerFiles">
     			<input type="file" name="fileImg" id="thumbnailImg"/>
     			<input type="file" name="fileImg" id="img1"/>
     			<input type="file" name="fileImg" id="img2"/>
     			<input type="file" name="fileImg" id="img3"/>
  			</div>
  		</div>
  		<div class="col-12 text-center">
			<input type="submit" class="btn" id="writeBtn" value="등록"/>
			<input type="reset" id="resetBtn" class="btn" value="취소"/>
		</div>
	</form>
</div>
<br/>