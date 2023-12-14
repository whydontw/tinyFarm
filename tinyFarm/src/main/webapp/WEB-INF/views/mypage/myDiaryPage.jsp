<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>마이페이지</title>
    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
    <link rel="stylesheet" href="resources/jisu/css/mypage.css">
	<!-- 달력 API -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
	<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
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
		    	let formattedDate = moment(date).format('YYYY-MM-DD'); //DB저장을 위해 date 형식 변경
		        let str = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일";
		        let goInsert = window.confirm("선택하신 날짜는 " + str + "입니다. 일지를 작성하시겠습니까?");
		        if (goInsert != false) {
		          location.href = "insert.di?selectDate=" + encodeURIComponent(formattedDate);
		        }
	        }
		 	});
		    calendar.render();
		});
	</script>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>영농일지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="diary.me">영농일지</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                        <div id="selectDay">
                        	<div id="calendar"></div>
                        	<input type="hidden" id="diaryDate" name="diaryDate">
		          		</div>
                </div>
            </div>
        </div>
    </section>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
</body>

</html>