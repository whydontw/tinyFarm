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
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>회원 정보 수정</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">


	<style>
		.boardHeader{
			display: flex;
		}
		.boardFooter{
			display: flex;
    		flex-direction: row;
    		justify-content: space-around;
		}
		#profileImg{
			 width: 300px;
			 height: 300px; 
			 border: 1px solid #ccc; 
			 margin-top: 45px; 
			 margin-bottom: 20px; 
			 margin-left: 200px; 
			 position: relative; 
			 overflow: hidden;
		}
	</style>


</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>회원 정보 수정</h2>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="update.me">회원 정보 수정</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
    <!-- 정보수정 -->
   <div class="checkout_area mb-100">
	        <div class="container">
	            <div class="row justify-content-between">
	                <div class="col-12 col-lg-7 mx-auto">
	                        <h5 style= "font-size : 30px">정보 수정</h5>
	                        <form action="update.me" method="post" >
			                    <div class="checkout_details_area clearfix">
		                           <div class="row">
									    <label for="profile_picture" style="position: absolute; top: 90px; left: 30px; z-index: 2;">프로필 사진</label>
									    <div id="profileImg">
									        <!-- 이미지 표시 -->
									        <img src="resources/profile.jpg" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
									    </div>
									    <div>    
									        <!-- 파일 업로드 입력 폼 -->
									        <input type="file" id = "upfile" name="upfile" style="cursor: pointer; background-color:white; border:none; margin-left:260px">
									    </div>
									    <div id="file-name-display" style="position: absolute; top: 70%; left: 50%; transform: translateX(-50%); text-align: center;"></div>
									</div>
	                                <div class="col-12 mb-4">
	                                    <label for="enrollUserId" style = "margin-top:10px">아이디</label>
	                                    <input type="text" class="form-control" id="enrollUserId" name = "userId" required>
	                                	<div id="checkResult" style="font-size:0.8em; display :none;"></div>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label>비밀번호</label>
	                                    <input type="button" value="수정하기"> <!-- 모달사용하기 -->
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="userName">이름</label>
	                                    <input type="text" class="form-control" id="userName" name="userName" required>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="email">이메일</label>
	                                    <input type="email" class="form-control" id="email" name="email" required> 
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="phone">전화번호</label>
	                                    <input type="text" class="form-control" id="phone" name="phone">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="address">주소</label>
	                                    <input type="text" class="form-control" id="address" name="address">
	                                </div>
	                            </div>
  								<div class="col-8">
                                    <button type="submit" class="btn alazea-btn mt-15">수정하기</button>
                                    <button type="button" class="btn alazea-btn mt-15">탈퇴하기</button>
                                </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>

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