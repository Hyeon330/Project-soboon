
$(() => {
	// 채팅 리스트 나타내고 없어지는 애니메이션
	$('#chatBtn').click(function() {
		if($('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2)>0){
			$('#chatBtn').html('<i class="bi bi-chat-square-text chat-icon"></i>');
			$('#chatPopup').animate({
				height: '0'
			}, 150);
		}else {
			$('#chatBtn').html('<i class="bi bi-x-lg chat-icon"></i>');
			$('#chatPopup').animate({
				height: window.innerHeight-120+'px'
			}, 150);
		}
	});
	
	// 화면크기에 따라 채팅 리스트 일정한 크기 유지
	const resizeChatLists = () => {
		var chatHeadHeight = Number($('.chat-head').css('height').substring(0,$('.chat-head').css('height').length-2));
		var chatSearchHeight = Number($('.chat-search').css('height').substring(0,$('.chat-search').css('height').length-2));
		$('#chatLists').css('height', (window.innerHeight-120-chatHeadHeight-chatSearchHeight-10)+'px');
	};
	resizeChatLists();
	$(window).resize(() => {
		var chatPopupHeight = $('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2);
		if(chatPopupHeight != 0){
			$('#chatPopup').css('height', window.innerHeight-120+'px');
			resizeChatLists();
		}
	});
	
	// 채팅 검색창 자연스러운 테두리 나타내기
	$('.chat-search-text').focus(function(){
		$('.chat-search-box').css('border','2px solid #666');
	});
	$('.chat-search-text').blur(function(){
		$('.chat-search-box').css('border','2px solid rgba(0,0,0,0)');
	});
	
	var myNickname = $('#myNickName').text();
	var todayTime = new Date();
	// 채팅 리스트 리로드
	const setChatLists = function(result){
		$('#chatLists').empty();
		result.forEach(data => {
			var chatDateArr = data.chat_datetime.split(' ')[0].split('-');
			var chatTimeArr = data.chat_datetime.split(' ')[1].split(':');
			var chatDate = new Date(chatDateArr[0], chatDateArr[1], chatDateArr[2]);
			var today = new Date(todayTime.getFullYear(), todayTime.getMonth()+1, todayTime.getDate());
			
			var chatList = '<li class="chat-list">';
			chatList += '<div>';
			chatList += '<div class="chat-info">';
			if(data.receiver === myNickname){
				chatList += '<p class="chat-name">'+data.sender+'</p>';
			} else {
				chatList += '<p class="chat-name">'+data.receiver+'</p>';
			}
			
			// 메시지
			if(data.chat_read == 'n' && data.sender != myNickname){
				chatList += '<p class="last-chat"><b class="not-read">'+data.sender+": "+data.msg+'</b></p>';
			}else {
				chatList += '<p class="last-chat">'+data.sender+": "+data.msg+'</p>';
			}
			chatList += '</div>';
			
			// 시간
			if(chatDate.getTime() === today.getTime()){
				chatList += '<p class="chat-date">'+Number(chatTimeArr[0])+':'+Number(chatTimeArr[1])+'</p>';
			}else {
				chatList += '<p class="chat-date">'+Number(chatDateArr[1])+'월 '+Number(chatDateArr[2])+'일'+'</p>';
			}
			
			chatList += '</div></li>';
			
			$('#chatLists').append(chatList);
		});
	}
	const chatListsReload = () => {
		$.ajax({
			url: '/chat/getLastMessage',
			type: 'get',
			async: false,
			success: function (result){
				setChatLists(result);
			}
		});
	};
	chatListsReload();
	
	// 닉네임 검색
	$('#chatSearch').on('input', function() {
		if($(this).val()!=''){
			$.ajax({
				url: '/chat/searchNickname',
				data: 'nickNameKeyword='+$(this).val(),
				type: 'post',
				success: function(result) {
					if(result.length!=0){
						setChatLists(result);
					}else {
						$('#chatLists').html('');
					}
					openMsgPopupReload();
				}
			});
		}else {
			chatListsReload();
		}
	});
	
	// 메시지 창에 메시지 넣는 함수
	var prevTime = '';
	var prevPosition = '';
	var prevDate = '';
	const setMessage = (data) => {
		if((myNickname == data.sender && $('#oppNickName').text() == data.receiver)||
			(myNickname == data.receiver && $('#oppNickName').text() == data.sender)){
			var msgDateArr = data.chat_datetime.split(' ')[0].split('-');
			var msgDate = msgDateArr[0]+'년 '+msgDateArr[1]+'월 '+msgDateArr[2]+'일';
			if(prevDate != msgDate){
				$('.msg-lists').append('<li><div class="msg-date-line">'+msgDate+'</div></li>');
				prevDate = msgDate;
			}
			var msg = '<li class="msg-list">';
			
			var position = '';
			if(data.sender == myNickname){
				position = 'right';
			} else {
				position = 'left';
			}
			
			msg += '<div class="msg-box '+position+'">';
			var msgDateTimeArr = data.chat_datetime.split(' ')[1].split(':');
			var nowTime = Number(msgDateTimeArr[0])+':'+Number(msgDateTimeArr[1]);
			if(prevTime != nowTime || prevPosition != position){
				msg += '<div class="msg-info">';
				if(position=='right'){
					msg += '<span class="msg-time">'+nowTime+'</span>';
					msg += '·<span class="msg-nickname">'+data.sender+'</span>';
				}else {
					msg += '<span class="msg-nickname">'+data.sender+'</span>';
					msg += '·<span class="msg-time">'+nowTime+'</span>';
				}
				msg += '</div>';
				prevTime = nowTime;
				prevPosition = position;
			}
			msg += '<div class="msg-text '+position+'"><span>'+data.msg+'</span></div></div></li>';
			
			$('.msg-lists').append(msg);
			$('.msg-lists').scrollTop($('.msg-lists')[0].scrollHeight);
		}
	}
	
	var socket = io("http://1.246.60.149:9001");
	
	
	// 닉네임에 맞는 메시지 가져오는 함수
	const msgLoad = (oppNickname) => {
		$('#oppNickName').text(oppNickname);
		$('.msg-lists').empty();
		$.ajax({
			url: '/chat/getAllMessage',
			type: 'post',
			data: 'oppNickname='+oppNickname,
			async: false,
			success: function(result) {
				prevDate = '';
				result.forEach(data => {
					setMessage(data);
				});
			}
		});
		$('#msgPopup').css('display', 'block');
		$('.msg-lists').scrollTop($('.msg-lists')[0].scrollHeight);
	}
	
	// 메시지 창 열고 닫기
	$('.msg-close').click(() => {
		$('#msgPopup').css('display', 'none');
	});
	const openMsgPopupReload = () => {
		$('.chat-list').on('click', function(){
			if($(this).find('.chat-name').text()!=$('#oppNickName').text()){
				$('.msg-textarea').val('');
			}
			msgLoad($(this).find('.chat-name').text());
			chatListsReload();
			openMsgPopupReload();
		});
	}
	openMsgPopupReload();
	
	// 메시지 데이터 소켓 서버로 보내기
	const sendMessage = (msg) => {
		var data = {
			sender: myNickname,
			receiver: $('#oppNickName').text(),
			msg: msg
		};
		socket.emit('send-msg', data);
	}
	
	var message = '';
	// 보내기 버튼 클릭시 sendMessage함수 실행
	$('.msg-send-btn').click(() => {
		message = $('.msg-textarea').val().replace(/\n/g, '<br>');
		if(!message.startsWith('<br>') && message!=''){
			sendMessage(message);
		}
		$('.msg-textarea').val('');
	});
	$('.msg-textarea').keydown((e)=>{
		if(e.keyCode === 13 && !e.shiftKey){
			$('.msg-send-btn').click();
		}
	});
	$('.msg-textarea').keyup((e)=>{
		if($('.msg-textarea').val()!='' && e.keyCode === 13 && !e.shiftKey){
			$('.msg-textarea').val('');
		}
	});
	
	// 소켓 서버에서 메시지 데이터 받기
	var audio = new Audio('/notice/iponealert.mp3');
	audio.volume = 0.3;
	socket.on('receive-msg', function(data){
		if($('#msgPopup').css('display')=='block' && data.receiver==myNickname && data.sender==$('#oppNickName').text()){
			$.ajax({
				url: '/chat/updateChatRead',
				type: 'post',
				async: false
			});
		}else if($('#msgPopup').css('display')=='none' && data.receiver==myNickname && !($('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2)>0)) {
			audio.pause();
			audio.currentTime = 0.5;
			audio.play();
			setTimeout(function() {
				audio.pause();
			},1500);
		}
		chatListsReload();
		openMsgPopupReload();
		setMessage(data);
    });
    
    
    // 보드 뷰에서 '채팅 보내기' 버튼 클릭시
    $('#joinChat').click(() => {
		if($('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2)==0){
			$('#chatBtn').click();
		}
		$('#oppNickName').text($('#viewNickname').text());
		msgLoad($('#viewNickname').text());
		$('#msgPopup').css('display', 'block');
	});
	
	// 채팅 한정 개수 100개로 하고 스크롤 최상단으로 올렸을시 리로드
	
	// 채팅 받았을 경우 버튼위에 빨간점
	
	// 페이지 이동시 현상 유지
    
    setInterval(() => {
		if($('#chatSearch').val()==''){
			chatListsReload();
			openMsgPopupReload();
		}
	}, 2000);
});