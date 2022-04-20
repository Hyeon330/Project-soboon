$(function() {
	$('#proWarn').click(function() {
		$('#reportReason').dialog('open');
	});
	$('#reportReason').dialog({
		title: "신고사유",
		autoOpen: false,
		buttons: {
			등록: function() {
				alert('등록');
				$("#reportSubmit").submit();
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