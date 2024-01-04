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
	
	<% String contextPath = request.getContextPath(); %>
    
    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>
	
    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/style.css">

</head>

<body>
   	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="img/core-img/leaf.png" alt="">
        </div>
    </div>
   

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/book/bookmain.jpg);">
            <h2 style = "font-family:LotteMartDream">이달의 도서 추천</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href=""><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">책 추천하기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count">
                            <div class="py-2">🌿 초보 농부와 풀집사들을 위한</div>
                            <h2>도서 추천</h2>
                        </div>
                        <!-- Search by Terms -->
                        <div class="search_by_terms">
<!--                      <form action="#" method="post" class="form-inline" id=""> -->
                            <select class="custom-select widget-title" id="orderByStandard">
                              <option value ="byEnrolldate">Show: 최신등록순</option>
                              <option value="byHits">조회순</option>
                              <option value="byHighPrice">최고가격순</option>
                              <option value="byLowPrice">최저가격순</option>
                            </select>
                            <select class="custom-select widget-title" id="bookShowCount">
                              <option value="6">Show: 6</option>
                              <option value="12">12</option>
                              <option value="15">15</option>
                            </select>
<!--                       </form> -->
                        </div>
                    </div>
                </div>
            </div>
            
            <script type="text/javascript">
            
   				$(function(){

					var orbs = "${bookMap.orderByStandard}";			
					var bsc = ${bookMap.bookShowCount};			
					var bcy = "${bookMap.bookCategory}";			
   					
					
//    					alert(orbs);
//    					ALERT(BSC);
					
   					$("#orderByStandard").val(orbs);
   		   			$("#bookShowCount").val(bsc);
   		   			$("input[name=bookCategory]").val(bcy);
   		   			
   		   			$("#orderByStandard").change(function(){
   		   				location.href="bookMain.re?orderByStandard=" + $("#orderByStandard").val()  + "&bookShowCount=" + bsc;
   		   			})
   		   			
   		   			$("#bookShowCount").change(function(){
   		   				location.href="bookMain.re?orderByStandard=" + orbs  + "&bookShowCount=" + $("#bookShowCount").val();
   		   			})		
   		   			
   		   			
   				})
            
            
   				
            </script>

            <div class="row">
                <!-- Sidebar Area -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop-sidebar-area">

                        <!-- Shop Widget -->
                        <div class="shop-widget catagory mb-50">
                            <h4 class="widget-title">Categories</h4>
                            <div class="widget-desc">
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" value="원예" class="custom-control-input" id="customCheck1" name="bookCategory" checked="checked">
                                    <label class="custom-control-label" for="customCheck1">원예 <span class="text-muted"></span></label>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" value="조경" class="custom-control-input" id="customCheck2" name="bookCategory">
                                    <label class="custom-control-label" for="customCheck2">조경 <span class="text-muted"></span></label>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" value="텃밭" class="custom-control-input" id="customCheck3" name="bookCategory">
                                    <label class="custom-control-label" for="customCheck3">텃밭 <span class="text-muted"></span></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                
               		<c:if test="${loginUser.userId == 'admin'}">
               		<div class="mx-auto">
						<button type="button" onclick="location.href='bookInsert.re'" class="btn alazea-btn-orange mb-15 floot-left" id="">등록</button>
					</div>
					</c:if>
                
                    <div class="shop-products-area">
                        <div class="row">

							<c:forEach var="bl" items="${bookList }">
                               <!-- Single Product Area -->
	                            <div class="col-12 col-sm-6 col-lg-4">
	                                <div class="single-product-area mb-50">
	                                    <!-- Product Image -->
	                                    <div class="">
	                                        <a href="bookDetail.re?bookNo=${bl.bookNo}"><img src="${contextPath }/${bl.bookChangeName }" alt=""></a>
	                                        <!-- Product Tag -->
	                                        <c:if test="${bl.bookCount > 10 }">
	                                        	<div class="product-tag sale-tag"><a href="#">Hot</a></div>
	                                        </c:if>
	                                        <div class="product-meta d-flex">
<!-- 	                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a> -->
<!--                                        <a href="cart.html" class="add-to-cart-btn">Add to cart</a> -->
<!-- 	                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a> -->
	                                        </div>
	                                    </div>
	                                    <!-- Product Info -->
	                                    <div class="product-info mt-15 text-center">
	                                        <a href="bookDetail.re?bookNo=${bl.bookNo}">
	                                            <p>[ ${bl.bookCategory} ] ${bl.bookTitle }</p>
	                                        </a>
	                                        <h6>${bl.bookPrice }</h6>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
                        </div>
						
						

						

						
						<section>
	                        <!-- Pagination -->
	                        <nav aria-label="Page navigation">
	                            <ul class="pagination ">
			                        <c:if test="${pi.currentPage > 1}">
			                            <li class="page-item"><a class="page-link" href="bookMain.re?currentPage=${pi.currentPage-1}&orderByStandard=${bookMap.orderByStandard}&showBookCount=${bookMap.showBookCount}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>
                                    
                                    <!-- paging 개수 -->
                                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
	                                    <li class="page-item"><a class="page-link" href="bookMain.re?currentPage=${i}&orderByStandard=${bookMap.orderByStandard}&showBookCount=${bookMap.showBookCount}">${i}</a></li>
									</c:forEach>
				                    
				                     <c:if test="${pi.currentPage < pi.maxPage}">
			                            <li class="page-item"><a class="page-link" href="bookMain.re?currentPage=${pi.currentPage+1}&orderByStandard=${bookMap.orderByStandard}&showBookCount=${bookMap.showBookCount}"><i class="fa fa-angle-right"></i></a></li>
									</c:if>
                                </ul>
	                        </nav>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
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