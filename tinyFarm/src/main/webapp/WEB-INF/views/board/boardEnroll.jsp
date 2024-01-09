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


<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 해시태그 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />



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

.tagify {
	width: 1000px;
}

.note-modal-footer {
	margin: 10px;
}
</style>



</head>

<body>
	<%@include file="../common/header.jsp"%>


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
							<li class="breadcrumb-item"><a href="/tinyfarm"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="moveList.bo">이야기해요</a></li>
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

					<td><textarea id="summernote" name="boardContent" required></textarea></td>
				</tr>
				<tr>
					<th><label for="boardHashTag">해시태그&nbsp;&nbsp;</label></th>
					<td><input placeholder="type tags" id="hashTag" name="hashTag"></td>
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

	<script>
		var hashTag = document.getElementById('hashTag');
		var tagify = new Tagify(hashTag);

		// 태그가 추가되면 이벤트 발생
		tagify.on('add', function() {
			console.log(tagify.value);
		})
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