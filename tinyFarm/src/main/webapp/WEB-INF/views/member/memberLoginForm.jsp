<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
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
			<h2>로그인</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="#">Login</a></li>
						
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-5">
                    <!-- Section Heading -->
                    <div class="section-heading">
                        <h2>LOGIN</h2>           
                    </div>
                    <!-- Contact Form Area -->
                    <div class="contact-form-area mb-100">
                        <form action="login.me" method="post">
                            <div class="row">
                                <div class="col-6 col-md-9">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="contact-name" style = "width:300px" placeholder="ID" name = "userId">
                                    </div>
                                </div>
                                <div class="col-9">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="contact-subject" style = "width:300px" placeholder="PW" name = "userPwd">
                                    </div>
                                	</div>
                               		<div class="col-8">
										<button type="submit" class="btn mt-15" style = "background-color:#70c745; color:white; height: 45px; width:300px">로그인</button>								    
									</div>
								    <div class="col-9 mt-100">
								    	<div><a id="kakao-login-btn"><img onclick="Kakao.Auth.login()"  style = "margin-top:-150px" src="<%= contextPath %>/resources/kakao_login.png" style = "width:286px"></a></div>
								    </div>
								<br>	
								</div>
								<div>
									<a href = "userfind.me">아이디 찾기 /</a> 
									<a onclick="">비밀번호 찾기</a> 
								</div>
 								<a onclick="unlinkApp()">로그아웃</a> 
							    <div id="result"></div>
                        </form>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                        <!-- Google Maps -->
                        <div class="map-area mb-100">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22236.40558254599!2d-118.25292394686001!3d34.057682914027104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2z4Kay4Ka4IOCmj-CmnuCnjeCmnOCnh-CmsuCnh-CmuCwg4KaV4KeN4Kav4Ka-4Kay4Ka_4Kar4KeL4Kaw4KeN4Kao4Ka_4Kav4Ka84Ka-LCDgpq7gpr7gprDgp43gppXgpr_gpqgg4Kav4KeB4KaV4KeN4Kak4Kaw4Ka-4Ka34KeN4Kaf4KeN4Kaw!5e0!3m2!1sbn!2sbd!4v1532328708137" allowfullscreen></iframe>
                        </div>
                </div>
            </div>
        </div>
    </section>
 	
 	<script type = "text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
		<script type="text/javascript">
			  function unlinkApp() {
			    Kakao.API.request({
			      url: '/v1/user/unlink',
			      success: function(res) {
			        alert('success: ' + JSON.stringify(res))
			      },
			      fail: function(err) {
			        alert('fail: ' + JSON.stringify(err))
			      },
			    })
			  }
			</script>
 
		<script type="text/javascript">
			Kakao.init('9dd7e5e19735d15aaef0ecd9dd6b1226');
			console.log(Kakao.isInitialized());
			 
			Kakao.Auth.login({
			    container: '#kakao-login-btn',
			    success: function(authObj) {
			      Kakao.API.request({
			        url: '/v2/user/me',
			        success: function(result) {
			          $('#result').append(result);
			          
			          id = result.id
			          
			          connected_at = result.connected_at
			          kakao_account = result.kakao_account
			          
			          $('#result').append(kakao_account);
			        
			          $('#result').append(resultdiv);
			          
			        },
			        fail: function(error) {
			          alert(
			            'login success, but failed to request user information: ' +
			              JSON.stringify(error)
			          )
			        },
			      })
			    },
			    fail: function(err) {
			      alert('로그인 실패: ' + JSON.stringify(err))
			    },
			  })
		</script>
	    
	    
	   
	
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