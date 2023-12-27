<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String selectDate = request.getParameter("selectDate"); //달력에서 선택한 날짜
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>마이페이지</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<style>
a, p {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.pl{
	width: 100px;
	height: 35px;
	box-sizing: border-box;
	border-radius: 10px;
	font-style: normal;
	font-size: 14px;
	line-height: 16px;
}
		
.pl:focus{
	border: 1px solid #70c745;
	box-sizing: border-box;
	border-radius: 10px;
	border-radius: 10px;
}

#diaryTitle {
	width: 100%;
	height: 40px;
	border: 1px solid #cdcdcd;
	padding-left: 10px;
}

#datelabel {
	float: right;
	text-align: right;
	padding-top: 20px;
	width: 30%;
	font-size: 17px;
}
.btn-green, .btn-red{
	width: 50px;
	height: 30px;
	float: right;
}
.btn-red{
	margin-left: 1%;
}
.radioBtn>label{ font-size: 14px;}
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<div class="breadcrumb-area">
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>영농일지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="insert.di">영농일지 작성</a></li>
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
					<div class="row">
						<form action="insert.di" method="post" onsubmit="return insertDiary();">
							<input type="hidden" name="diaryWriter" value="${loginUser.userNo }">
							<label for="categorys">텃밭유형 : </label>
								<select id="categoryNo" name="categoryNo" class="pl">
									<option value="1">개인밭</option>
									<option value="2">마당</option>
									<option value="3">베란다</option>
									<option value="4">옥상</option>
									<option value="5">주말농장</option>
									<option value="6">정원</option>
									<option value="7">학교</option>
								</select>
							<div id="datelabel">
								<input type="hidden" id="selectDate" name="selectDate" value=" <%=selectDate%>"> 작성일 : <%=selectDate%>
							</div>
							<input type="text" name="diaryTitle" id="diaryTitle" placeholder="제목을 입력해주세요.">
							<textarea id="diaryContent" name="diaryContent"></textarea>

							<div class="radioBtn">
								<label>공개 시 내가 팔로우 한 사람들에게만 공개됩니다. </label>
								<input type="radio" id="openY" name="selectOpen" value="Y"> <label for="openY">공개</label>
								<input type="radio" id="openN" name="selectOpen" value="N"> <label for="openN">비공개</label>
								<input type="button" id="backBtn" class="btn-red" value="취소">
								<input type="submit" id="diBtn" class="btn-green" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 일지 작성 스크립트 -->
	<script>
		$('#diaryContent').summernote({
					width : 815,
					height : 1000,
					minHeight : 1000,
					maxHeight : 1000,
					focus : true,
					lang : "ko-KR",
					placeholder : '나만의 영농일지를 작성해보세요! 최대 4000자까지 작성 가능합니다.',
					toolbar : [
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'insert', [ 'picture', 'link' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',
									'맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],	
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
								'20', '22', '24', '28', '30', '36', '50', '72' ]
				});

		$("#backBtn").click(function() {
			let alert = window.confirm("이전 페이지로 이동하시겠습니까?\n작성 중인 내용이 사라집니다.");
				if(alert){
		           	window.history.back();
		       	}else{
		       		return false;
		       	} 
		});

		function insertDiary() {
			let diaryTitle = $("#diaryTitle").val();
			let diaryContent = $("#diaryContent").val();
			let openVal = $("input[name=selectOpen]:checked").val();

			if (diaryTitle == "") {
				alert("제목을 입력해주세요.");
				$("#diaryTitle").focus;
				return false;
			}
			if (diaryContent == "") {
				alert("내용을 입력해주세요.");
				$("#diaryContent").focus;
				return false;
			}
			if (openVal == null) {
				alert("공개여부를 선택해주세요.");
				return false;
			}

		}
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<!-- <script src="resources/js/jquery/jquery-2.2.4.min.js"></script> -->
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