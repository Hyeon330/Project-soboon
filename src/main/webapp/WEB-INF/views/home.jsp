<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.indexContainer{
	width:1200px;
	margin:0 auto;
}
.indexContainer img{
	width:1200px;
	height:717px;
}
#functionIntroduce{
	width:1200px;
	height:850px;
	margin:0 auto;
	background: linear-gradient(rgb(250, 246, 243), white);
}
#functionIntroduce>img{
	width:240px;
	margin:30px;
	padding:0px;
	display:block;
	float:left;
	filter : drop-shadow(5px 5px 5px rgb(192, 188, 177));
}
#recentItem{
	width:1200px;
	height:850px;
	margin:0 auto;
	background-color:white;
}


 .imgHoverEvent{width: 200px; height: 200px; margin: 30px; position: relative; overflow: hidden; display: inline-block;}
        .imgHoverEvent .imgBox{width: 200px; height: 200px; text-align: center; background:url(http://gahyun.wooga.kr/portfolio/triple/resources/img/city00.jpg) no-repeat 50% 50%; background-size: auto 100%;}
        .imgHoverEvent .hoverBox{position: absolute; top:0; left: 0; width: 200px; height: 200px;}
        .event1 .hoverBox{background: linear-gradient(to bottom, rgba(0,0,0,0) 5%,rgba(255,255,255,1) 90%); transform: translateY(60%); transition: 0.5s;}
        .event1:hover .hoverBox{transform: translateY(0);}
</style>
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
		<h1 style="text-align:center">소분소분의 이야기</h1>
	</div>
	<br/>
	<div id="wrap">
        <div class="imgHoverEvent event1">
            <div class="imgBox"><img src="img/img.png" alt=""> </div>
            	<div class="hoverBox">
				<img src="/img/inform.png" class="functionImage"/>
            </div>
        </div>
	<img src="/img/inform.png" class="functionImage"/>
	<img src="/img/inform.png" class="functionImage"/>
	<img src="/img/inform.png" class="functionImage"/>
</div>
<div id="recentItem">
	최신 글
</div>