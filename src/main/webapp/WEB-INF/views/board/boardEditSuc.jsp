<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0}">
	<c:if test="${vo.category=='share'}">
		<script>
			alert('π’ κΈμ΄ μμ λμμ΅λλ€.');
			location.href="/board/shareBoardView?no="+${vo.no}+"";
		</script>
	</c:if>
	<c:if test="${vo.category=='rent'}">
		<script>
			alert('π’ κΈμ΄ μμ λμμ΅λλ€.');
			location.href="/board/rentBoardView?no="+${vo.no}+"";
		</script>
	</c:if>
	<c:if test="${vo.category=='sale'}">
		<script>
			alert('π’ κΈμ΄ μμ λμμ΅λλ€.');
			location.href="/board/saleBoardView?no="+${vo.no}+"";
		</script>
	</c:if>
	<c:if test="${vo.category=='req'}">
		<script>
			alert('π’ κΈμ΄ μμ λμμ΅λλ€.');
			location.href="/board/reqBoardView?no="+${vo.no}+"";
		</script>
	</c:if>
</c:if>
<c:if test="${cnt==null || cnt==0}">
	<script>
		alert("π« κΈ μμ μ μ€ν¨νμ΅λλ€.");
		history.go(-1);
	</script>
</c:if>
