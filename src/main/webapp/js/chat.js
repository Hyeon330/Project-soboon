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
	const chatListsReload = () => {
		$.ajax({
			url: '/chat/getLastMessage',
			type: 'get',
			async: false,
			success: function (result){
				$('#chatLists').empty();
				result.forEach(d => {
					var chatDateArr = d.chat_datetime.split(' ')[0].split('-');
					var chatTimeArr = d.chat_datetime.split(' ')[1].split(':');
					var chatDate = new Date(chatDateArr[0], chatDateArr[1], chatDateArr[2]);
					var today = new Date(todayTime.getFullYear(), todayTime.getMonth()+1, todayTime.getDate());
					
					var chatList = '<li class="chat-list">';
					chatList += '<div>';
					chatList += '<div class="chat-info">';
					if(d.receiver === myNickname){
						chatList += '<p class="chat-name">'+d.sender+'</p>';
					} else {
						chatList += '<p class="chat-name">'+d.receiver+'</p>';
					}
					
					// 메시지
					if(d.chat_read == 'n' && d.sender != myNickname){
						chatList += '<p class="last-chat"><b class="not-read">'+d.sender+": "+d.msg+'</b></p>';
					}else {
						chatList += '<p class="last-chat">'+d.sender+": "+d.msg+'</p>';
					}
					chatList += '</div>';
					
					// 시간
					if(chatDate.getTime() === today.getTime()){
						chatList += '<p class="chat-date">'+Number(chatTimeArr[0])+'시 '+Number(chatTimeArr[1])+'분'+'</p>';
					}else {
						chatList += '<p class="chat-date">'+Number(chatDateArr[1])+'월 '+Number(chatDateArr[2])+'일'+'</p>';
					}
					
					chatList += '</div></li>';
					
					$('#chatLists').append(chatList);
				});
			}
		});
	};
	chatListsReload();
	
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
			var nowTime = msgDateTimeArr[0]+'시 '+msgDateTimeArr[1]+'분';
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
	// 메시지 창 열고 닫기
	$('.msg-close').click(() => {
		$('#msgPopup').css('display', 'none');
	});
	
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
	
	const openMsgPopupReload = () => {
		$('.chat-list').on('click', function(){
			msgLoad($(this).find('.chat-name').text());
		});
	}
	openMsgPopupReload();
	
	const sendMessage = (msg) => {
		var data = {
			sender: myNickname,
			receiver: $('#oppNickName').text(),
			msg: msg
		};
		socket.emit('send-msg', data);
		$('.msg-textarea').val('');
	}
	
	$('.msg-textarea').keyup((e)=>{
		if($('.msg-textarea').val()!='' && e.keyCode === 13 && !e.shiftKey){
			$('.msg-textarea').val('');
		}
	});
	$('.msg-textarea').keydown((e)=>{
		if($('.msg-textarea').val()!='' && e.keyCode === 13 && !e.shiftKey){
			$('.msg-send-btn').click();
		}
	});
	$('.msg-send-btn').click(() => {
		if($('.msg-textarea').val()!=''){
			sendMessage($('.msg-textarea').val());
		}
	});
	
	socket.on('receive-msg', (data) => {
		chatListsReload();
		openMsgPopupReload();
		setMessage(data);
    });
    
    // 채팅 보내기 버튼 클릭시
    $('#joinChat').click(() => {
		if($('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2)==0){
			$('#chatBtn').click();
		}
		$('#oppNickName').text($('#viewNickname').text());
		msgLoad($('#viewNickname').text());
		$('#msgPopup').css('display', 'block');
	});
    
    setInterval(() => {
		chatListsReload();
		openMsgPopupReload();
	}, 1000);
});