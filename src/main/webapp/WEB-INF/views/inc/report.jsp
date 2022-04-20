<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/report.css" type="text/css"/>
<script>
$(function() {
	$('#proWarn').click(function(){
		$('#reportReason').dialog('open');
	});
	$('#reportReason').dialog({
		title: "신고사유",
		autoOpen: false,
		modal: true,
		buttons: {
			등록: function() {
				$.ajax({
					url:"/report/insertReportContent",
					data:"report_content="+$("#reportContent").val() + "&suspect="+$("#viewNickname").text() + "&board_no="+$("#reportReason").attr("no"),
					type:"POST",
					success:function(result){
						if(result>0){
							alert("신고가 접수되었습니다.");
						}
					}
				});
				$("#reportReason").dialog('close');
			},
			취소: function() {
				$("#reportReason").dialog('close');
			}
		}
	});
});
</script>
<div id="reportReason" no="${viewVo.no}">
	<form id="reportSubmit">
		<ul>
			<li>신고내용</li>
			<li><textarea cols="30" rows="3" maxlength="30"; placeholder="30자 내외로 입력하세요" id="reportContent" name="reportContent"></textarea></li>
		</ul>
	</form>
</div>