<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>작은농장</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
    
    <link rel="stylesheet" href="resources/font-awesome.min.css" type="text/css">
	<style>
		.green-icon-img{
			width:25px;
			height:25px;
		}
		.plantImg{
			width:500px;
			height:500px;
		}
		
	</style>
</head>

<body>

    <!-- ##### Breadcrumb Area End ##### -->
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>실내정원용 식물</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="#">실내정원용 식물</a></li>
						<li class="breadcrumb-item active" aria-current="page">상세보기</li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-12 col-md-6 col-lg-5">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                	<c:forEach items="${imgArr}" var="i" varStatus="vs">
                                		<c:choose>
	                                		<c:when test="${vs.index eq 0}">
			                                    <div class="carousel-item active">
			                                        <a class="product-img" href="${i}" title="Product Image">
			                                        	<img class="d-block w-100 plantImg" src="${i}" alt="1">
			                                    	</a>
			                                    </div>
	                                		</c:when>
	                                		<c:otherwise>
			                                    <div class="carousel-item">
			                                        <a class="product-img" href="${i}" title="Product Image">
			                                        <img class="d-block w-100 plantImg" src="${i}" alt="1">
			                                    </a>
			                                    </div>
	                                		
	                                		</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                   
                                </div>
                               <%--  <ol class="carousel-indicators">
                                	<c:forEach items="${imgArr}" var="i" varStatus="vs">
                                		<c:choose>
	                                		<c:when test="${vs.index eq 0}">
			                                   <li class="active" data-target="#product_details_slider" data-slide-to="${vs.index}" style="background-image: url(${i});"></li>
	                                		</c:when>
	                                		<c:otherwise>
			                                    <li data-target="#product_details_slider" data-slide-to="${vs.index}" style="background-image: url(${i});"></li>
	                                		
	                                		</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </ol> --%>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                            <p class="title" style="font-size:20px; font-weight:900;">${plantInfo.cntntsSj}</p>
                            <p class="price" style="font-size:16px; font-weight:700;">${plntzrNm}</p>
                            <div class="short_overview">
                                <p style="font-size:14px; font-weight:600;">꽃말 : ${adviseInfo}</p>
                                <p style="font-size:14px; font-weight:600;">${speclmanageInfo}</p>
                            </div>

                           

                           <%--  <a href="#" class="wishlist-btn ml-15"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                            <div class="products--meta" style="padding-top: 30px;">
                                <p><span>잎 형태 정보 :</span> <span>${lefStleInfo}</span></p>
                                <p><span>냄새 정보 :</span> <span>${smellCodeNm}</span></p>
                                <p><span>관리수준 :</span> <span>${managelevelCodeNm}</span></p>
 								
                            </div> --%>

                        </div>
                        <div class="alazea-benefits-area">
	                        <div class="row">
	                            <!-- Single Benefits Area -->
	                            <div class="col-12 col-sm-6">
	                                <div class="single-benefits-area">
	                                    <img class="green-icon-img" src="resources/img/icon/temperature_icon.png" alt="">
	                                    <h5>생육 온도</h5>
	                                    <p style="font-weight:500;">${grwhTpCodeNm}</p>
	                                </div>
	                            </div>
	
	                            <!-- Single Benefits Area -->
	                            <div class="col-12 col-sm-6">
	                                <div class="single-benefits-area">
	                                    <img class="green-icon-img" src="resources/img/icon/water_icon.png" alt="">
	                                    <h5>습도</h5>
	                                    <p style="font-weight:500;">${hdCodeNm}</p>
	                                </div>
	                            </div>
	
	                            <!-- Single Benefits Area -->
	                            <div class="col-12 col-sm-6">
	                                <div class="single-benefits-area">
	                                    <img class="green-icon-img" src="resources/img/icon/stopwatch_icon.png" alt="">
	                                    <h5>생장속도</h5>
	                                    <p style="font-weight:500;">${grwtveCodeNm}</p>
	                                </div>
	                            </div>
	
	                            <!-- Single Benefits Area -->
	                            <div class="col-12 col-sm-6">
	                                <div class="single-benefits-area">
	                                    <img class="green-icon-img" src="resources/img/icon/snowman_icon.png" alt="">
	                                    <h5>겨울 최저 온도</h5>
	                                    <p style="font-weight:500;">${winterLwetTpCodeNm}</p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab" style="font-weight:800;">식물 정보</a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab" style="font-weight:800;">위키백과</a>
                            </li>
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab" style="font-weight:800;">의견 <span class="text-muted"></span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <div class="description_area" style="width:800px; margin:0 auto;">
                                    <p>과 명 : ${fmlCodeNm}</p> <br>
                                    <p>조언 정보 : ${adviseInfo}</p> <br>
                                    <p>성장 높이 정보 : ${growthHgInfo}</p> <br>
                                    <p>성장 넓이 정보 : ${growthAraInfo}</p> <br>
                                    <p>번식 시기 정보 : ${prpgtEraInfo}</p> <br>
                                    <p>생장속도 : ${grwtveCodeNm}</p> <br>
                                    <p>생육 온도 : ${grwhTpCodeNm}</p> <br>
                                    <p>겨울 최저 온도 : ${winterLwetTpCodeNm}</p> <br>
                                    <p>습도 : ${hdCodeNm}</p> <br>
                                    <p>비료 정보 : ${frtlzrInfo}</p> <br>
                                    <p>토양 정보 : ${soilInfo}</p> <br>
                                    <p>물주기 봄 : ${watercycleSprngCodeNm}</p> <br>
                                    <p>물주기 여름 : ${watercycleSummerCodeNm}</p> <br>
                                    <p>물주기 가을 : ${watercycleAutumnCodeNm}</p> <br>
                                    <p>물주기 겨울 : ${watercycleWinterCodeNm}</p> <br>
                                    <p>특별관리 정보 : ${speclmanageInfo}</p> <br>
                                    <p>기능성 정보 : ${fncltyInfo}</p> <br>
                                    <p>관리요구도 : ${managedemanddoCodeNm}</p> <br>
                                    <p>분류명 : ${clCodeNm}</p> <br>
                                    <p>생육형태명 : ${grwhstleCodeNm}</p> <br>
                                    <p>실내정원구성 : ${indoorpsncpacompositionCodeNm}</p> <br>
                                    <p>생태명 : ${eclgyCodeNm}</p> <br>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="addi-info">
                                <div class="additional_info_area">
                                   <object data="https://ko.wikipedia.org/wiki/${plantInfo.cntntsSj}"
								        width="1100"
								        height="800"
								        type="text/html">
								        <p align="center">해당 식물정보가 위키백과에 존재하지 않습니다.</p>
								    </object>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                                <div class="reviews_area">
                                    <ul>
                                        <li>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Quality</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Design</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Value</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div class="submit_a_review_area mt-50">
                                    <h4>Submit A Review</h4>
                                    <form action="#" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group d-flex align-items-center">
                                                    <span class="mr-15">Your Ratings:</span>
                                                    <div class="stars">
                                                        <input type="radio" name="star" class="star-1" id="star-1">
                                                        <label class="star-1" for="star-1">1</label>
                                                        <input type="radio" name="star" class="star-2" id="star-2">
                                                        <label class="star-2" for="star-2">2</label>
                                                        <input type="radio" name="star" class="star-3" id="star-3">
                                                        <label class="star-3" for="star-3">3</label>
                                                        <input type="radio" name="star" class="star-4" id="star-4">
                                                        <label class="star-4" for="star-4">4</label>
                                                        <input type="radio" name="star" class="star-5" id="star-5">
                                                        <label class="star-5" for="star-5">5</label>
                                                        <span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label for="name">Nickname</label>
                                                    <input type="email" class="form-control" id="name" placeholder="Nazrul">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label for="options">Reason for your rating</label>
                                                    <select class="form-control" id="options">
                                                          <option>Quality</option>
                                                          <option>Value</option>
                                                          <option>Design</option>
                                                          <option>Price</option>
                                                          <option>Others</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="comments">Comments</label>
                                                    <textarea class="form-control" id="comments" rows="5" data-max-length="150"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn alazea-btn">Submit Your Review</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <!-- ##### Footer Area End ##### -->

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