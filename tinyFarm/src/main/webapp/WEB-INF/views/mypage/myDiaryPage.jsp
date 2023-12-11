<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>마이페이지</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!-- Fonts and icons -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="resources/jisu/css/bootstrap.min.css" rel="stylesheet" />
  <link href="resources/jisu/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="resources/jisu/demo/demo.css" rel="stylesheet" />
  <!-- summernote -->
  <script src="resources/jisu/summernote/summernote-lite.js"></script>
  <script src="resources/jisu/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="resources/jisu/summernote/summernote-lite.css">
  <!-- 달력 API -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>
	  <script>
	  	//달력 화면에 띄우기
	    document.addEventListener('DOMContentLoaded', function() {
	      let calendarEl = document.getElementById('calendar');
	      let calendar = new FullCalendar.Calendar(calendarEl, {
	    	  initialView: 'dayGridMonth',
	    	  selectable: true, //날짜 선택
	    	  locale: 'ko',//한글 설정
	    	  navLinks: true,
	    	  navLinkDayClick: function(date,jsEvent){
	    		  $("#insertInfo").attr("hidden", true); //날짜 눌러주세요 문구 숨기기
	    		  $("#insertForm").attr("hidden", false); //일지작성란 보여주기
	    		  let str = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "+date.getDate()+"일";
	    		  $("#diaryDate").attr("value", str); //일지 작성란 작성일에 날짜 추가
              }
	      });
	      calendar.render();
	    });
	    </script>
  <style>
  	#calendar{
  		width: 650px; 
	  	height: 720px; 
	  	margin: auto;
	}
  	#selectDay{
  		width: 950px; 
  		height: 700px;
  		margin: auto;
  		padding-left: 20px;
  		padding-top: 28px;
  	}

  	.btn{
  		float: right
  	}
  	#diaryDate, #diaryTitle{background-color: #f2f4f5}
  	#diaryTitle{
  		width: 100%;
  		height: 40px;
  		border: 1px solid #c3c4c5;
  	}
  	#diaryDate{
  		width: 25%;
  		float: right;
  		text-align: right;
		border: none;
		font-size: 17px;
  	}
  	
  </style>
</head>
<body>
	<div class="wrapper">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="" class="simple-text logo-mini">
            <img src="resources/jisu/img/apple-icon.png">
        </a>
        <a href="" class="simple-text logo-normal">
          작은농장
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="mypage.me">
              <i class="nc-icon nc-circle-10"></i>
              <p>회원정보수정</p>
            </a>
          </li>
          <li class="active ">
            <a href="diary.me">
              <i class="nc-icon nc-calendar-60"></i>
              <p>영농일지 작성</p>
            </a>
          </li>
          <li>
            <a href="follow.me">
              <i class="nc-icon nc-favourite-28"></i>
              <p>팔로우목록</p>
            </a>
          </li>
          <li>
            <a href="trade.me">
              <i class="nc-icon nc-diamond"></i>
              <p>거래목록</p>
            </a>
          </li>
          <li>
            <a href="board.me">
              <i class="nc-icon nc-single-copy-04"></i>
              <p>내가 쓴 게시글</p>
            </a>
          </li>
          <li>
            <a href="reply.me">
              <i class="nc-icon nc-single-copy-04"></i>
              <p>내가 쓴 댓글</p>
            </a>
          </li>
          <li>
            <a href="delete.me">
              <i class="nc-icon nc-simple-remove"></i>
              <p>회원탈퇴</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    <div class="main-panel" style="height: 100vh;"> <!-- vh(Viewport Height) : 보여지는 화면에서 100%를 다 사용하겠다 -->
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand">영농일지</a>
          </div>
        </div>
      </nav>
      
      <!-- mainContent -->
      <div class="content">
        <div class="row">
          	<div class="left">
            	<div id="calendar"></div>
          	</div>
          	<div class="right">
          		<div id="selectDay">
          			<h4 id="insertInfo">☜ 일지를 작성하시려면 날짜를 클릭해주세요.</h4>
          			<div id="insertForm" hidden>
          				<input type="hidden" name="userNo" value="${loginUser.userNo })">
          				<input type="text" name="diaryDate" id="diaryDate"> <br>
          				<input type="text" name="diaryTitle" id="diaryTitle" placeholder="제목을 입력해주세요."> 
          				<textarea id="diaryContent" name="diaryContent"></textarea>
          				<input type="button" class="btn" value="등록">
          			</div>
          		</div>
          	</div>
          </div>
      </div>
    </div>
   </div>
   
   <!-- 일지 작성 스크립트 -->
   <script>
   	$("#diaryContent").summernote({
	 	height: 550,// content 높이
	 	minHeight: 570,// content 최소높이
	 	maxHeight: 1000,//content 최대높이
	  	focus: true,// 에디터 로딩후 포커스를 맞출지 여부
	  	lang: "ko-KR",// 한글 설정
	  	placeholder: '나만의 영농일지를 작성해보세요! 최대 4000자까지 작성 가능합니다.',//placeholder 설정
	  	toolbar: [
	  		// 글꼴 설정
			['fontname', ['fontname']],
			// 글자 크기 설정
			['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			// 글자색
			['color', ['forecolor','color']],
			// 글머리 기호, 번호매기기, 문단정렬
			['para', ['ul', 'ol', 'paragraph']],
			// 줄간격
			['height', ['height']],
			// 그림첨부, 링크만들기, 동영상첨부
			['insert',['picture','video']],
			// 코드보기, 확대해서보기, 도움말
			['view', ['help']]
		],
		// 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		// 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36']
  	});
   </script>
   
   <script>
   	$(function(){
   		$(".btn").click(function(){
   			$.ajax({
   				url : "insert.Di",
   				type : "post",
   				data : {
   					insertTitle : $("#diaryTitle").val(),
   					insertContent : $("#diaryContent").val()
   					
   				}
   			});
   		});
   	});
   </script>

   
   
       
  <!--   Core JS Files   -->
  <script src="resources/jisu/js/core/jquery.min.js"></script>
  <script src="resources/jisu/js/core/popper.min.js"></script>
  <script src="resources/jisu/js/core/bootstrap.min.js"></script>
  <script src="resources/jisu/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chart JS -->
  <script src="resources/jisu/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="resources/jisu/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="resources/jisu/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
</body>
</html>
