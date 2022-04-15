$(function() {
	$.ajax({
		url: '/addr/getLargeAddr',
		type: 'get',
		async: false,
		success: function(result) {
			result.forEach(largeData => {
				$('#boardlargeAddrSelect').append('<option value="'+largeData+'">'+largeData+'</option>');
			});
		}
	});
	
	const setMedium = () => {
		document.querySelector('#boardmediumAddrSelect').options.length = 0;
		document.querySelector('#boardsmallAddrSelect').options.length = 0;
		if($('#boardlargeAddrSelect').val()!=''){
			$.ajax({
				url: '/addr/getMediumAddr',
				data: 'large='+$('#boardlargeAddrSelect').val(),
				type: 'get',
				async: false,
				success: function(result) {
					result.forEach(d => {
						$('#boardmediumAddrSelect').append('<option value="'+d+'">'+d+'</option>');
					})
				}
			});
		}
	}
	
	const setSmall = () => {
		document.querySelector('#boardsmallAddrSelect').options.length = 0;
		if($('#boardmediumAddrSelect').val()!=''){
			$.ajax({
				url: '/addr/getSmallAddr',
				data: 'large='+$('#boardlargeAddrSelect').val()+'&medium='+$('#boardmediumAddrSelect').val(),
				type: 'get',
				async: false,
				success: function(result) {
					result.forEach(smallData => {
						$('#boardsmallAddrSelect').append('<option value="'+smallData+'">'+smallData+'</option>');
					});
				}
			});
		}
	}
	
	$('#boardlargeAddrSelect').on('change', function() {
		setMedium();
		setSmall();
	});
	$('#boardmediumAddrSelect').on('change', function() {
		setSmall();
	});
	
	const myBoardAddrReset = () => {
		$('#boardlargeAddrSelect').val($('#boardlargeAddrSelect').attr('default')).prop('selected');
		setMedium();
		$('#boardmediumAddrSelect').val($('#boardmediumAddrSelect').attr('default')).prop('selected');
		setSmall();
		$('#boardsmallAddrSelect').val($('#boardsmallAddrSelect').attr('default')).prop('selected');
	}
	
	
	myBoardAddrReset();
});