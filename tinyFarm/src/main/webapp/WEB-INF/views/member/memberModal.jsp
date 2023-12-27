<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">
	
</head>
<body>
		<!-- Button trigger modal -->
		<button type="button" id="memberdetailViewModal" class="btn  btn-primary" data-toggle="modal" data-target="#exampleModalCenter"></button>
		
		<!-- Modal -->
		<div class="modal" id="exampleModalCenter" tabindex="-5" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document" style="max-width:630px;">
				<div class="modal-content">
					<div class="modal-body">
	   					<div class="checkout_details_area clearfix">
						        <h5 style = "color:black; margin-top:15px; margin-left:10px">🌱 회원 정보</h5>
						        <div class="row" style = "margin-top:-30px">
						            <div class="col-md-12 mt-30 mb-30 d-flex justify-content-center align-items-center">
						                <div style="width: 240px; height: 240px; border: 1px solid #ccc; position: relative; overflow: hidden; margin-left:-200px">
						                    <!-- 이미지 표시 -->
						                    <img id="profileImage" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
						                </div> 
						                <div class="ml-5"> 
						                    <div class="mb-4" style ="margin-top : -70px">
						                        <label for="first_name">ID</label>
						                    </div>
						                    <div class="mb-4">
						                        <label for="last_name">이름</label>
						                    </div>
						                    <div>
						                        <label for="country">회원등급</label>
						                        <!-- 여기에 회원등급 입력 필드 또는 텍스트 추가 -->
						                    </div>
						                </div>
						                
						                
						            </div>
						        </div>
						    </div>
						</div>
						<div class="d-flex justify-content-start" style="margin-top: -85px; ">
						    <button type="button" class="btn alazea-btn2" style="margin-bottom: 20px; margin-left:310px;">팔로우</button>
						    <button type="button" class="btn alazea-btn2" style="margin-left:3px">1:1 채팅</button>
						    <button type="button" class="btn alazea-btn2" style="margin-left:3px">일지보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- ##### All Javascript Files ##### -->
		    <!-- jQuery-2.2.4 js -->
		    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
		    <!-- Popper js -->
		    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/popper.min.js"></script>
		    <!-- Bootstrap js -->
		    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
		    <!-- All Plugins js -->
		    <script src="${pageContext.request.contextPath}/resources/js/plugins/plugins.js"></script>
		    <!-- Active js -->
		    <script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
    
</body>
</html>