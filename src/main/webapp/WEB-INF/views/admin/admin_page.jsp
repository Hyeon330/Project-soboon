<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tab example</title>
	<style>
		#container {
			width:1800px;
			margin:0 auto;
			text-align:center;
		}
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		/* Float the list items side by side */
		.tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.tab li a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
		/* Style the tab content */
		.tabcontent {
			display: none;
			background-color:rgb(0,154,200);
			padding: 6px 12px;
			color:#fff;
		}
		ul.tab li.current{
			background-color: rgb(0,154,200);
			color: #222;
		}
		.tabcontent.current {
			display: block;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<div id="container">
		
		<br/><h2><b>==어서오세요 관리자 페이지입니다.==</b></h2><hr/>
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">회원관리</a></li>
			<li data-tab="tab2"><a href="#">신고관리</a></li>
			<li data-tab="tab3"><a href="#">어쩌고</a></li>
			<li data-tab="tab4"><a href="#">저쩌고</a></li>

		</ul>
		<hr/>
		<div id="tab1" class="tabcontent current"></div>
		<div id="tab2" class="tabcontent"></div>
		<div id="tab3" class="tabcontent"></div>
		<div id="tab4" class="tabcontent"></div>
	</div>

	<script>
		$(function() {
			ajaxsend('tab1')
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
				ajaxsend(activeTab)
			})
		});
		function ajaxsend(tab){
			//alert(tab1)
			var url='/admin';
			if(tab=='tab1'){
				url+='/memberMgr'
			}else if (tab=='tab2'){
				url+='/reportMgr'
			}
			
			
			
			$.ajax({
				url:url,
				dataType:'json',
				success:function(dataArr){
					//alert(JSON.stringify(dataArr))
					/* var str='<table>';
					$.each(dataArr,function(i, data){
						str+="<tr><td>"+data.proName+"</td><td>"+data.price+"</td></tr>"
					})
					str+="</table>"
					$('#'+tab).html(str) */
					if(tab=='tab1'){
						showMember(dataArr, tab)
					}else if (tab=='tab2'){
						showReport(dataArr, tab)
					}
					
				}
				
			})
			
			
		}
		
		function showMember(dataArr, tab){
			var str='<h3>회원관리</h3><table>';
			$.each(dataArr,function(i, data){
				str+="<tr><td>"+"□"+"</td><td>"+"아이디"+"<td>"+" 이름"+"<td>"+" 닉네임"+"<td>"+" 이메일"+"<td>"+" 신고누적"+"</td></tr>"
				str+="<tr><td>"+data.proName+"</td><td>"+data.price+"</td></tr>"
			})
			str+="</table>"
			$('#'+tab).html(str)
		}
		function showReport(dataArr, tab){
			var str='<h3>신고관리</h3><table>';
			$.each(dataArr,function(i, data){
				str+="<tr><td>"+data.proName+"</td><td>"+data.price+"</td></tr>"
			})
			str+="</table>"
			$('#'+tab).html(str)
		}
	</script>
</body>
</html>
</body>
</html>