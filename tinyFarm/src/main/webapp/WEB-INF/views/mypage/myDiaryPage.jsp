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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
    <link rel="stylesheet" href="resources/jisu/css/mypage.css">
	<!-- 달력 API -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
	<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<style>
	.fc-event {
    background: none; /* 이벤트 컨텐츠의 배경색 */
    border: none;
    width:30px;
  	}
  	.fc-daygrid-event-harness {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	</style>
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
                       	<input type="hidden" id="selectDate" name="selectDate" value="formattedDate">
		          	</div>
                </div>
            </div>
        </div>
    </section>
<script>
	//달력 화면에 띄우기
	document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
		
		initialView: 'dayGridMonth',
		selectable: true, //날짜 선택
		locale: 'ko',//한글 설정
		navLinks: true, //날짜 선택 가능
		navLinkDayClick: function(date,jsEvent){ //날짜 클릭시
			let formattedDate = moment(date).format('YYYY/MM/DD'); //DB저장을 위해 date 형식 변경
		    let str = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일";
		    let goInsert = window.confirm("선택하신 날짜는 " + str + "입니다. 일지를 작성하시겠습니까?");
			    if (goInsert != false) { //확인 누를시 일지작성페이지로 가기
			    	location.href = "insert.di?selectDate=" + encodeURIComponent(formattedDate);
			    }
	    },editable: true, 
	    eventContent: function(img) { //새싹이미지를 위한 함수 ..
	    	let imageUrl = img.event.extendedProps.imageUrl;
	        return {
	           html: '<div class="fc-content"><div class="fc-title">' + img.event.title + '</div><img src="' + imageUrl + '" alt="Event Image" style="max-width: 100%; height: auto;"></div>'
	        };
	    },events: //일지 작성된 날짜에 이미지 띄우기
	    	function(info, successCallback, failureCallback){
	    		let userNo = ${loginUser.userNo};
	        	let events = [];
	        	
	        	$.ajax({
	        		url: "calendarImg.do",
	        		data: {
	        			userNo : userNo //회원번호 받아오기
	        		}
	        		,success: function(result){ //해당 날짜에 일지 있을시 새싹 이미지 띄우기
	        			$.each(result,function(index,el){ //반복문 돌려서 날짜 뽑기
			        	let startDate = moment(el.selectDate).format('YYYY-MM-DD');//날짜 형식 바꾸기
	        				if(startDate != null){ //날짜가 존재하면
		        				events.push({
		        					start: startDate,
		        			        imageUrl: "resources/jisu/img/calender-icon.png"
		        				});
	        				}
	        			});
	        			successCallback(events); //이벤트 호출
	        		},error: function(){
	        			console.log("달력 ajax통신 실패");
	        		}
	        	});
	    },eventClick: function(info){ //새싹 이미지 클릭시 일지 보러가기
	        //나중에 필요할 것 같아서 미리 ..
	       	let date = moment(info.event.start).format('YYYY/MM/DD');
	        let year = info.event.start.getFullYear();
	        let month = info.event.start.getMonth()+1;
	        let day = info.event.start.getDate();
	        let view = alert(year+"년 "+month+"월 "+day+"일의 일지를 보시겠습니까?");
	        	if(view != false){
		        	location.href="view.di?selectDate="+encodeURIComponent(date);
	        	}
	        }
	    });
		calendar.render(); //달력 띄우기
		});
	</script>
	
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