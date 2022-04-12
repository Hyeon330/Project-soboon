<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0}">
	<c:if test="${vo.category=='share'}">
		<script>
			alert('🟢 글이 수정되었습니다.');
			location.href="/board/shareAndReqView?no="+${vo.no}+"&category=share";
		</script>
	</c:if>
	<c:if test="${vo.category=='request'}">
		<script>
			alert('🟢 글이 등록되었습니다.');
			location.href='/board/shareAndReqList?category=request';
		</script>
	</c:if>
</c:if>
<c:if test="${cnt==null || cnt==0}">
	<script>
		alert("🚫 글 수정에 실패했습니다.");
		history.go(-1);
	</script>
</c:if>
