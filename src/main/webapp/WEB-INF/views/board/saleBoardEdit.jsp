<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/saleBoardEdit.css" type="text/css"/>
<script src="/js/board/saleBoardEdit.js"></script>
<div class="container">
	<br/>
	<form class="form-group" method="post" action="/board/saleBoardEditOk?no=${bvo.no}" id="saleEditForm" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align:center">
			<thead>
				<tr>
					<th><h1>판매 게시판 글 수정 하기</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="tbBody">
						<input type="text" class="form-control col-7" id="saleBoardTitle" placeholder="글 제목을 입력하세요."  name="title" maxlength="16" value="${bvo.title}"/>
						<span class="form-control col-2">금&nbsp;&nbsp;액</span>
						<input type="number" class="form-control col-3" name="price" placeholder="금액을 입력하세요." value="${bvo.price}"/>
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
			<input type="button" class="btn" id="backList" value="리스트로 돌아가기"/>
		</div>
	</form>
</div>
<br/>