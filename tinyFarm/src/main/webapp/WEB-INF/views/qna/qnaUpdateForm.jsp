<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${contextPath }/resources/style.css">
</head>
<body>
     <%@include file="/WEB-INF/views/common/header.jsp" %>
	 <!-- ##### Product Area Start ##### -->
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>QnA</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i>QnA</a></li>
						<li class="breadcrumb-item"><a href="#"><i
						class="fa fa-home"></i>QnA 수정</a></li>
						
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            
            
            	<div class="col-12 col-md-3">
		<div class="post-sidebar-area">

			<!-- ##### Single Widget Area ##### -->
			<!-- 검색창 -->
			<div class="single-widget-area">
				<form action="#" method="get" class="search-form">
					<input type="search" name="search" id="widgetsearch"
						placeholder="Search...">
					<button type="submit">
						<i class="icon_search"></i>
					</button>
				</form>
			</div>

			<!-- ##### Single Widget Area ##### -->
			<div class="single-widget-area">
				<!-- Author Widget -->
				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4>🌿 <b>QNA</b></h4>
							<!-- <p>Editor</p> -->
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
							<a href="qnaForm" class="post-title"><h6>QNA 작성</h6></a>
							<a href="qnaList" class="post-title"><h6>나의 QNA 내역</h6></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


				<div class="col-12 col-md-9">
					<div class="col-12">
						<div
							class=" d-flex flex-wrap align-items-center justify-content-between">
							<div class="mb-50">
								<p>
								<h5>
									<b>🌱 QNA 수정하기</b>
								</h5>
								</p>
							</div>
						</div>
						<div class="checkout_details_area clearfix">
							<form action="qnaUpdate" method="post">
								<input type="hidden" value="${qna.qnaNo }" name="qnaNo">
								<input type="hidden" value="2" name="userNo">
								<div class="row">
									<div class="col-12 mb-4">
										<label for="phone_number">제목 *</label>
										<input type="text" class="form-control" id="qnaTitle" min="0" name="qnaTitle" value="${qna.qnaTitle}">
									</div>
									<div class="col-md-6 mb-4">
										<label for="city">작성자</label> <input type="text" class="form-control" id="" value="user1" name="" disabled>
									</div>
									<div class="col-md-6 mb-4">
										<c:set var="nowTime" value="<%=new Date()%>" />
										<c:set var="createDate">
											<fmt:formatDate value="${nowTime}" pattern="yy/MM/dd" />
										</c:set>
										<label for="state">작성일자</label> <input type="text"
											class="form-control" id="" value="${createDate }" disabled>
									</div>
									<div class="col-md-12 mb-4">
										<label for="order-notes">문의사항 *</label>
										<textarea class="form-control" id="qnaContent" name="qnaContent" cols="30" rows="80">${qna.qnaContent }</textarea>
									</div>
									<div class="col-12 ">
                                         <button type="button" class="btn alazea-btn mt-15  float-right" onclick="location.href='qnaList'">목록</button>
                                         <button type="submit" class="btn alazea-btn mt-15 mr-15 float-right" onclick="return confirm('문의사항을 수정하시겠습니까?')">전송</button>
                                     </div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area bg-img" style="background-image: url(img/bg-img/3.jpg);">
        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="footer-logo mb-30">
                                <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit samet, consectetur adipiscing elit. India situs atione mantor</p>
                            <div class="social-info">
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>QUICK LINK</h5>
                            </div>
                            <nav class="widget-nav">
                                <ul>
                                    <li><a href="#">Purchase</a></li>
                                    <li><a href="#">FAQs</a></li>
                                    <li><a href="#">Payment</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">Return</a></li>
                                    <li><a href="#">Advertise</a></li>
                                    <li><a href="#">Shipping</a></li>
                                    <li><a href="#">Career</a></li>
                                    <li><a href="#">Orders</a></li>
                                    <li><a href="#">Policities</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>BEST SELLER</h5>
                            </div>

                            <!-- Single Best Seller Products -->
                            <div class="single-best-seller-product d-flex align-items-center">
                                <div class="product-thumbnail">
                                    <a href="shop-details.html"><img src="img/bg-img/4.jpg" alt=""></a>
                                </div>
                                <div class="product-info">
                                    <a href="shop-details.html">Cactus Flower</a>
                                    <p>$10.99</p>
                                </div>
                            </div>

                            <!-- Single Best Seller Products -->
                            <div class="single-best-seller-product d-flex align-items-center">
                                <div class="product-thumbnail">
                                    <a href="shop-details.html"><img src="img/bg-img/5.jpg" alt=""></a>
                                </div>
                                <div class="product-info">
                                    <a href="shop-details.html">Tulip Flower</a>
                                    <p>$11.99</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>CONTACT</h5>
                            </div>

                            <div class="contact-information">
                                <p><span>Address:</span> 505 Silk Rd, New York</p>
                                <p><span>Phone:</span> +1 234 122 122</p>
                                <p><span>Email:</span> info.deercreative@gmail.com</p>
                                <p><span>Open hours:</span> Mon - Sun: 8 AM to 9 PM</p>
                                <p><span>Happy hours:</span> Sat: 2 PM to 4 PM</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Bottom Area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="border-line"></div>
                    </div>
                    <!-- Copywrite Text -->
                    <div class="col-12 col-md-6">
                        <div class="copywrite-text">
                            <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                    <div class="col-12 col-md-6">
                        <div class="footer-nav">
                            <nav>
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Service</a></li>
                                    <li><a href="#">Portfolio</a></li>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->


    <script type="text/javascript">
    
    	function qnaSend(){
    		
    		if($("#qnaTitle").val() == null || $("#qnaTitle").val() == ""){
    			alert("제목을 입력해 주세요");
    			$("#qnaTitle").focus();
    			return false;
    		}
    		if($("#qnaContent").val() == null || $("#qnaContent").val() == ""){
    			alert("내용을 입력해 주세요");
    			$("#qnaContent").focus();
    			return false;
    		}
    		if(!confirm('문의 사항을 작성하시겠습니까?')){
    			return false;
    		}
    		return true;
    	}
    	
	</script>


    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${contextPath }/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${contextPath }/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath }/resources/js/active.js"></script>
</body>

</html>
