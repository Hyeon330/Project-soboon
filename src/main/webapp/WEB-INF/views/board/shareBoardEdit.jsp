<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/shareBoardEdit.css" type="text/css"/>
<script src="/js/shareBoardEdit.js"></script>
<div class="container">
	<br/>
	<form class="form-group" method="post" action="/board/shareBoardEditOk?no=${bvo.no}" id="shareReqForm" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
				<tr>
					<th><h1 style="text-align:center;">나눔 게시판 글 수정 폼</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="tbBody">
						<input type="text" class="form-control" id="shareBoardTitle" placeholder="글 제목을 입력하세요."  name="title" maxlength="16" value="${bvo.title}"/>
					</td>
				</tr>
				<tr>
					<td><textarea name="content" id="writeContent" placeholder="글 내용을 입력하세요.">${bvo.content}</textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="fileList">
			<div id="innerFiles" class="totalFile">
			<c:choose>
				<c:when test="${bvo.img1!=null && bvo.img1!=''}">
					<div>${bvo.img1}  &nbsp; <span class="btn xbtn">X</span></div>
					<input type="hidden" name="" value="${bvo.img1}"/>
					<input type="hidden" name="fileImg" id="bvoImg1"/>
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
					<c:choose>
						<c:when test="${bvo.img4!=null && bvo.img4!=''}">
							<div>${bvo.img4}  &nbsp; <span class="btn xbtn">X</span></div>
							<input type="hidden" name="" value="${bvo.img4}"/>
							<input type="hidden" name="fileImg" id="bvoImg4"/>
						</c:when>
						<c:otherwise>
							<input type="file" name="fileImg" id="img4"/>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<input type="file" name="fileImg" id="img1"/>
					<input type="file" name="fileImg" id="img2"/>
					<input type="file" name="fileImg" id="img3"/>
					<input type="file" name="fileImg" id="img4"/>
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