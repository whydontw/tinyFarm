<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="description" content="">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	    
	    <% String contextPath = request.getContextPath(); %>
	    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	    <!-- Title -->
	    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>
	
	    <!-- Favicon -->
	    <link rel="icon" href="/resources/img/core-img/favicon.ico">
	
	    <!-- Core Stylesheet -->
	    <link rel="stylesheet" href="<%= contextPath %>/resources/style.css">
	
	</head>
	
	<body>
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	   <!-- ##### nav 그림 + 페이지 설명 ##### -->
		<div class="breadcrumb-area">
			<!-- Top Breadcrumb Area -->
			<div
				class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
				style="background-image: url(resources/img/bg-img/24.jpg);">
				<h2>회원가입</h2>
			</div>
	
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">Join</a></li>
							
						</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	
	    <!-- ##### Checkout Area Start ##### -->
	    <div class="checkout_area mb-100">
	        <div class="container">
	            <div class="row justify-content-between">
	                <div class="col-12 col-lg-7 mx-auto">
	                    <div class="checkout_details_area clearfix">
	                        <h5 style= "font-size : 30px">JOIN US</h5>
	                        <form action="insert.me" method="post" >
		                           <div class="row">
									    <label for="profile_picture" style="position: absolute; top: 90px; left: 30px; z-index: 2;">프로필 사진</label>
									    <div style="width: 300px; height: 300px; border: 1px solid #ccc; margin-top: 45px; margin-bottom: 20px; margin-left: 200px; position: relative; overflow: hidden;">
									        <!-- 이미지 표시 -->
									        <img src="<%= contextPath %>/resources/profile.jpg" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
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
	                                    <input type="password" class="form-control" id="userPwd" min="0" name = "userPwd" required>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="password">비밀번호 확인</label>
	                                    <input type="password" class="form-control" id="checkPwd" name = "checkPwd" required>
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
                                    <button type="submit" class="btn alazea-btn mt-15">회원가입</button>
                                </div>
	                        </form>
	                    </div>
	                   <script>
							$(function(){
								
								//userId 라는 id값은 header에 있는 login Form에 userId 아이디와 겹치기 때문에
								//더 위에 있는 loginForm userId 요소가 잡히게 된다.
								var inputUserId = $("#enrollUserId");
								
								
								inputUserId.keyup(function(){
									
									if(inputUserId.val().trim().length >= 5){
									
										$.ajax({
											url : "checkId.me",
											data : {checkId : inputUserId.val()},
											success : function(result){
												
												
												if(result=="NNNNN"){
													$("#checkResult").show();
													$("#checkResult").css("color","red").text("사용 불가능한 아이디입니다.");
													
													$("button[type=submit]").attr("disabled",true);
												}else{//사용가능
													$("#checkResult").show();
													$("#checkResult").css("color","green").text("사용가능한 아이디입니다.");
													
													$("button[type=submit]").attr("disabled",false);
												}
												
											},error : function(){
												console.log("통신 오류");
											}
										});
								
									}
								
								});
								
								
								
							});
						
						</script>
	                </div>
	            </div>
	        </div>
	    </div>
	    
  
	    <!-- ##### Checkout Area End ##### -->
	
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	      <!-- ##### All Javascript Files ##### -->
		    <!-- jQuery-2.2.4 js -->
		    <script src="<%= contextPath %>/resources/js/jquery/jquery-2.2.4.min.js"></script>
		    <!-- Popper js -->
		    <script src="<%= contextPath %>/resources/js/bootstrap/popper.min.js"></script>
		    <!-- Bootstrap js -->
		    <script src="<%= contextPath %>/resources/js/bootstrap/bootstrap.min.js"></script>
		    <!-- All Plugins js -->
		    <script src="<%= contextPath %>/resources/js/plugins/plugins.js"></script>
		    <!-- Active js -->
		    <script src="<%= contextPath %>/resources/js/active.js"></script>
		</body>

</html>