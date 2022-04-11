<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/home.css" type="text/css"/>
	<div class="mainContainer">
		<div class="typingContainer">
			<p id="dynamic" class="lg-text active1"></p>
			<p class="sm-text">모든 1인, 소규모 가구의 불편함을 덜어주는 <br/> 이웃 대상 커뮤니티 서비스</p>
		</div>
		<div class="slide">
			<ul>
				<li><img src="/img2/1.jpg"/></li>
				<li><img src="/img2/2.jpg"/></li>
				<li><img src="/img2/3.jpg"/></li>
			</ul>		
		</div>
	</div>
	<div style="clear:both"></div>
	
	<div id="midContainer">
		<div id="functionIntroduce">
			<br/>
			<br/>
			<br/>
			<h1 id="fuctionTitle" style="text-align:center; font-weight:bold; color:rgb(154, 97, 66);">소분소분의 이야기</h1>
			<br/>
			<a href="/board/shareAndReqList?category=share"><img src="/img/inform1.png" class="functionImage"/></a>				
			<a href="#"><img src="/img/inform2.png" class="functionImage"/></a>
			<a href="#"><img src="/img/inform3.png" class="functionImage"/></a>
			<a href="#"><img src="/img/inform4.png" class="functionImage"/></a>
		</div>
	</div>	
	<div id="bottomContainer">
		<div id="recentItem">
			<br/>
			<br/>
			<h1 id="fuctionTitle" style="text-align:center; font-weight:bold; color:rgb(154, 97, 66);">최근 게시물</h1>
			<br/>
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
<script src="/js/home.js"></script>