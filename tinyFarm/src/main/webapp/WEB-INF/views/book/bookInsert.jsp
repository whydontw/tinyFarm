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
	
		<style>
			.genric-btn {
			    display: inline-block;
			    padding: 10px 15px;
			    font-size: 14px;
			    text-align: center;
			    text-decoration: none;
			    cursor: pointer;
			    background-color: #DCDCDC; /* 배경 색상 지정 */
			    color: black; /* 텍스트 색상 지정 */
			}
			
			.genric-btn:hover {
			    background-color: #BDBDBD; /* 호버 시 배경 색상 변경 */
			}
			</style>
	</head>
	
	<body>
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	   <!-- ##### nav 그림 + 페이지 설명 ##### -->
		<div class="breadcrumb-area">
			<!-- Top Breadcrumb Area -->
			<div
				class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
				style="background-image: url(resources/img/book/bookmain.jpg);">
				<h2>도서등록</h2>
			</div>
	
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">도서등록</a></li>
							
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
	                        <h5 style= "font-size : 30px">도서등록</h5>
	                        <form action="insert.me" method="post" enctype="multipart/form-data">
		                           <div class="row">
									    <div style="width: 290px; height: 290px; border: 1px solid #ccc; margin-top: 45px; margin-left:20px; margin-bottom: 20px; position: relative; overflow: hidden;">
									        <!-- 이미지 표시 -->
									        <img id="profileImage" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
 											<div>    
										        <!-- 파일 업로드 입력 폼 -->
										       <input type="file" id="upfile" name="upfile" style="cursor: pointer; background-color:white; border:none; align:center" onchange="loadImg(this, 1)">
										    </div>
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
	                                    <input type="password" class="form-control" id="password" min="0" name = "userPwd" required>
	                                	<div id="pwdcheck_blank1" style="font-size: 0.8em;"></div>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="password">비밀번호 확인</label>
	                                    <input type="password" class="form-control" id="password_check" name = "checkPwd" required>
	                                    <div id="pwdcheck_blank2" style="font-size: 0.8em;"></div>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="userName">이름</label>
	                                    <input type="text" class="form-control" id="userName" name="userName" required>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="email">이메일</label>
	                                    <input type="email" class="form-control" id="email" name="email" placeholder = "email@example.com" required> 
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="phone">전화번호</label>
	                                    <input type="text" class="form-control" id="phone" name="phone"  placeholder = "휴대폰 번호(숫자만 입력)">
	                                </div>
	                               <div class="col-12 mb-4" style="position: relative;">
									    <label for="address">주소</label>
									    <input type="text" id="address" class="form-control" name="address" readonly>
										<div class="button-group-area" id="address_kakao" style="position: absolute; top: 32px; right: 15px;">
										    <a href="#" class="genric-btn primary mt-0" style="height: 46px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">주소검색</a>
										</div>
									</div>
																		   
	                            </div>
  								<div class="col-8 text-center" style = "margin-left:120px">
                                    <button type="submit" class="btn alazea-btn mt-15">회원가입</button>
                                </div>
	                        </form>
	                    </div>
					
						 <script>
							 function loadImg(inputFile, num) {
								    var profileImage = document.getElementById('profileImage');
	
								    if (inputFile.files.length == 1) {
								        var reader = new FileReader();
	
								        reader.readAsDataURL(inputFile.files[0]);
	
								        reader.onload = function (e) {
								            console.log(e.target.result);
								            profileImage.src = e.target.result;
								        }
								    } else {
								        // 파일이 등록되지 않으면 기본 이미지로 설정
								        profileImage = "<%= contextPath %>/resources/profile.jpg";
								    }
								}
						</script>
						
						<script>
							 function loadImg(inputFile, num) {
								    var profileImage = document.getElementById('profileImage');
	
								    if (inputFile.files.length == 1) {
								        var reader = new FileReader();
	
								        reader.readAsDataURL(inputFile.files[0]);
	
								        reader.onload = function (e) {
								            console.log(e.target.result);
								            profileImage.src = e.target.result;
								        }
								    } else {
								        // 파일이 등록되지 않으면 기본 이미지로 설정
								        profileImage = "<%= contextPath %>/resources/profile.jpg";
								    }
								}
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