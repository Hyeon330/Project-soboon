<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${cnt>0}">
	<script>
		alert("소분소분으로 오세요~~~~~~~");
		location.href="/myapp/member/login";
	</script>
</c:if>
<c:if test="${cnt==null || cnt==0}">
	<script>
		alert("회원가입 실패!!!!! 다시해봐요....");
		history.go(-1);
	</script>
</c:if>