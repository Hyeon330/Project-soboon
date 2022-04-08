<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/home.css" type="text/css"/>
<script>
$(document).ready(function(){
	$(".functionImage").hover(function(){
		$(this).css('transform', 'translate(0px, -10px)');
	}, function(){
		$(this).css('transform', 'translate(0px, 10px)');
	});
});
</script>
<div class="entireContaier">
<div class="indexContainer"> 			
	<div id="demo" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/img/1.jpg"/>
	    </div>
	    <div class="carousel-item">
	      <img src="/img/2.jpg"/>
	    </div>
	    <div class="carousel-item">
	      <img src="/img/3.jpg"/>
	    </div>
	  </div>
	
	  <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
</div>
<div id="functionIntroduce">
	<div id="functionTitle">
	<br/>
	<br/>
	<br/>
	<h1 id="fuctionTitle" style="text-align:center; font-weight:bold;">소분소분의 이야기</h1>
	</div>
	<br/>
	<a href="#"><img src="/img/inform.png" class="functionImage"/></a>
	<a href="#"><img src="/img/inform.png" class="functionImage"/></a>
	<a href="#"><img src="/img/inform.png" class="functionImage"/></a>
	<a href="#"><img src="/img/inform.png" class="functionImage"/></a>
</div>
<div id="recentItem">
	<div class="container-fluid">
		<br/>
		<h1 id="fuctionTitle" style="text-align:center; font-weight:bold;">최근 게시물</h1>
		
		<br/>
			<div class="row">
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-12"></div>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-3">
					<div class="card-deck" >
						<div class="card">
	      				<div class="embed-responsive embed-responsive-4by3">
	       					<a href="/shareBoard/shareView"><img src="/img/books.jpg" class="card-img-top embed-responsive-item"  class="card-img-top" ></a>
	      					<div class="card-img-overlay">
	      					</div>
	      				</div>
						<div class="card-body">
								<ul>
										<li>닉네임</li>
										<li><a href="/shareBoard/shareView">제목</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br/>
			
		</div>
		<br/>
	</div>
</div>
</div>