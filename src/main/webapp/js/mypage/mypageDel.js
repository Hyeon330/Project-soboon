$(function() {
	  $('#selectBoxForDel').change(function() {
	    var result = $('#selectBoxForDel>option:selected').val();
	    if (result === 'reason4') {
	      $('.div1').show();
	    } else {
	      $('.div1').hide();
	    }
	  }); 
	  // 삭제 버튼 클릭시
	  $('#delFrm').submit(function(){
		  var reason = $('#selectBoxForDel>option:selected').val();
		  if(reason === '') {
			  alert('회원 탈퇴를 사유를 선택해주세요.');
			  $('#selectBoxForDel').focus();
			  return false;
		  }
		  if(reason === 'reason4') {
			  if($('#directReason').val() === '') {
				  alert('회원탈퇴 기타 사유를 적어주세요.');
				  $('#directReason').focus();
				  return false;
			  }
		  }
		  if($('#pwdForCheck').val()===''||$('#pwdForCheck').val()!==$('#hiddenPwd').val()) {
			  alert('기존 비밀번호와 일치하지 않습니다.\n다시 확인해주시기 바랍니다.');
			  $('#pwdForCheck').focus();
			  return false;
		  } 
		  if(confirm('회원삭제를 하시겠습니까?')) {
			  return true;
		  }
		  return false;
	  });

});