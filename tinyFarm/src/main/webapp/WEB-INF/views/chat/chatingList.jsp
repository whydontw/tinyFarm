<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.chat-container {
	width: 100%;
	height: 800px;
	margin-bottom: 100px;
}

.chat-container-1 {
	display: flex;
	width: 1100px;
	height: 100%;
	margin: 0 auto;
}

.chat-list{
	width: 60%;
	height: 100%;
}
.chat-detail {
	width: 40%;
	height: 100%;
}
.chat-detail{
	margin-left:30px;
}
.chat-list {
	overflow: hidden scroll;
}

.chat-detail-name {
	width: 100%;
	height: 7%;
	padding: 10px;
}
.chat-form {
    display: flex;
    flex-direction: column;
    position: relative;
    margin: 16px;
    border: 1px solid black;
    border-radius: 8px;
    height: 20%;
    -webkit-box-pack: justify;
    justify-content: space-between;
 
}
.chat-textarea {
    margin: 12px 12px 0px;
    width: calc(100% - 24px);
    height: 63px;
    line-height: 150%;
    padding: 0px;
    resize: none;
    font-size: 14px;
    border: none;
    outline: none;
    color: black;
   
}
.chatform-option-area{
	display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    margin: 8px 10px;
    align-items: center;
}
.chat-send-btn{
	
	border-radius: 4px;
	border:none;
    width: 64px;
    height: 32px;
    line-height: 150%;
    font-weight: bold;
    font-size: 14px;
    background-color: orange;
    color: rgb(255, 255, 255);
    transition: background-color 0.5s ease 0s, color 0.5s ease 0s
}
.chat-area{
	
	background-color: #f3f3df;
	height: 70%;
	overflow: hidden auto;
    padding: 0px 20px;
    border-radius: 10px;
	
}
.test{
	background-color: black;
	width:100px;
	height:100px;
	
}
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>채팅</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">채팅</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="chat-container">
		<div class="chat-container-1">
			<div class="chat-list">
				<div class="chat-list-title">
					<h2>채팅 목록</h2>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-thumb">
							<img src="resources/img/bg-img/30.jpg" alt="">
						</div>
						<div class="post-content">
							<a href="#" class="post-title">
								<h6>New Harris Bugg design for Bridgewater</h6>
							</a> <a href="#" class="post-date">20 Jun 2018</a>
						</div>
					</div>
				</div>
			</div>
			<div class="chat-detail">
				<div class="chat-detail-name">
					<h4>
						채팅 상대방 이름
					</h4>
				</div>
				<div class="chat-area">
					
					
				</div>

				<div class="chat-form">
					<textarea placeholder="메시지를 입력해주세요" class="chat-textarea"></textarea>
					<div class="chatform-option-area">

						<span class="text-length">0/1000</span>
						<button class="chat-send-btn" onclick="send();">전송</button>
					</div>
					
				</div>
			</div>

		</div>
		<button onclick="connect();">접속</button>
		<button onclick="disconnect();">종료</button>
	</div>
	<script>
		//웹소켓 접속 함수
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 떄문에 전역변수에 담아두고 사용한다.)
		
		//연결함수 (접속)
		function connect(){
			//접속경로를 담아 socket을 생성한다.
			var url = "ws://localhost:8888/tinyfarm/basic";
			socket = new WebSocket(url);
			
			//연결이 되었을때
			socket.onopen = function(){
				console.log("연결 성공");
				console.log(socket);
			};
			//연결이 종료됐을때
			socket.onclose = function(){
				console.log("연결 종료");
			};
			//에러가 발생했을때
			socket.onerror = function(e){
				console.log("에러가 발생했습니다.");
				console.log(e);
			}
			//메세지가 왔을때
			socket.onmessage = function(message){
				console.log("메세지가 도착했습니다.");
				console.log(message);
				console.log(message.data);
				$(".chat-area").append(message.data);
				$(".chat-area").append($("<br>"));
			}
		}
		
		
		//접속종료
		function disconnect(){
			socket.close();//소켓닫기
		}
		
		//메세지 전송
		function send(){
			var text = document.getElementsByClassName("chat-textarea")[0];
			console.log(text.value);
			socket.send(text.value);
			
			text.value = "";
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>