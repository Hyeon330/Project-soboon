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

	$("#reportContent").on('input', function() {
		var maxlength = 50;
		if ($("#reportContent").val().length > maxlength) {
			$("#reportContent").val($("#reportContent").val().substring(0, maxlength));
		}
	});
});