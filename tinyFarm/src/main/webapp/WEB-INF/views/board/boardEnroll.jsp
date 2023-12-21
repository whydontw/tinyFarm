<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Title -->
<title>Alazea - Gardening &amp; Landscaping HTML Template</title>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- 썸머노트 이용하기 -->
<!--  <script src="resources/summernote1/js/summernote/summernote-lite.js"></script>
	<script src="resources/summernote1/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="resources/summernote1/css/summernote/summernote-lite.css"> -->

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap"
	rel="stylesheet">



<style>
a, p {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}

#boardTitle {
	width: 100%;
	height: 30px;
}
</style>



</head>

<body>

	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">

		<!-- ***** Top Header Area ***** -->
		<div class="top-header-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="top-header-content d-flex align-items-center justify-content-between">
							<!-- Top Header Content -->
							<div class="top-header-meta"></div>

							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">

								<!-- Login -->
								<div class="login">
									<c:choose>
										<c:when test="${empty loginUser}">
											<a href="loginGo.me"> <i class="fa fa-user"
												aria-hidden="true"></i> <span>Login</span>
											</a>
											<a href="join.me">회원가입</a>
										</c:when>

										<c:otherwise>
											<c:if test="${not empty loginUser.userName}">
												<label
													style="font-size: 12px; color: white; margin-top: 10px">${loginUser.userName}님</label>

												<a style="margin-left: 20px" href="">마이페이지&nbsp;</a>
												<a href="logout.me">로그아웃</a>
											</c:if>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ***** Navbar Area ***** -->
		<div class="alazea-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="alazeaNav">

						<!-- Nav Brand -->
						<a href="/tinyfarm" class="nav-brand"><img
							src="resources/img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Navbar Start -->
							<div class="classynav">
								<ul>
									<li><a href="index.html">식물 정보</a>
										<ul class="dropdown">
											<li><a href="inGardenPlantList.pp">실내식물 정보</a></li>
											<li><a href="gardeningList.pp?category=채소">채소 정보</a></li>
											<li><a href="gardeningList.pp?category=실내농업">실내농업 관련
													정보</a></li>
											<li><a href="gardeningList.pp?category=기능별 텃밭">기능별
													텃밭 정보</a></li>
											<li><a href="makeInGarden.pp">실내정원 만들기</a></li>
										</ul></li>
									<li><a href="about.html">체험활동</a></li>

									<li><a href="moveList.bo">커뮤니티</a></li>
									<li><a href="plist.bo">작물거래</a></li>
									<li><a href="contact.html">공지사항</a></li>
									<li><a href="qnaList.qa">1:1 문의</a></li>
								</ul>

								<!-- Search Icon -->
								<div id="searchIcon">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>

							</div>
							<!-- Navbar End -->
						</div>
					</nav>

					<!-- Search Form -->
					<div class="search-form">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type keywords &amp; press enter...">
							<button type="submit" class="d-none"></button>
						</form>
						<!-- Close Icon -->
						<div class="closeIcon">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>글 작성하기</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">함께 이야기해요</a></li>
							<li class="breadcrumb-item active" aria-current="page">게시글
								작성</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->


	<div class="post-content" align="center">
		<form action="insert.bo" method="post" id="boardEnroll">
			<table>
				<tr>
					<th><label for="boardTitle">제목&nbsp;&nbsp;</label></th>
					<td><input type="text" id="boardTitle" name="boardTitle"
						required></td>
				</tr>
				<tr>
					<th><label for="boardContent">내용&nbsp;&nbsp;</label></th>

					<td><textarea id="summernote" name="boardContent"></textarea></td>
				</tr>
			</table>
			<input type="hidden" name="boardWriter" value="${loginUser.userNo }">
			<button type="submit" class="btn alazea-btn" value="boardInsert"
				id="boardInsertBtn">Post</button>
		</form>
	</div>

	<br>
	<br>
	<br>
	<br>
	<script>
		//썸머노트 css함수
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				width : 1000,
				height : 500, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

			});
		});
	</script>
	</div>
	</div>


	</div>
	</div>
	</section>
	<!-- ##### Blog Content Area End ##### -->


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />




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