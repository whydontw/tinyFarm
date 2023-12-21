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
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/scss/style.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    

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
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>SHOP DETAILS</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i>작은농장</a></li>
                            <li class="breadcrumb-item"><a href="#">작물거래</a></li>
                            <li class="breadcrumb-item active" aria-current="page">작물거래 상세보기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- 상품 조회 -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-12 col-md-6 col-lg-5">
                    	<div class="single_product_thumb">
                            <div id="product_details_slider" class="" data-ride="carousel">
                                <div class="carousel-inner">
                                	<!-- 상품 이미지 -->
                                    <div class="carousel-item active">
                    
				                		<c:choose>
				                    		<c:when test="${empty p.changeName}">
				                    			첨부파일이 없습니다.
				                    		
				                    		</c:when>
				                            <c:otherwise>
				                    			<img class="d-block w-100" src="${p.filePath}${p.changeName}" alt="" id="pimg">
				                    			
				                    		</c:otherwise>
				                    	</c:choose>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    		
                    	
					<!-- 상품 정보 -->
                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                        	<input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo}">
                            <h4 class="title" name="productTitle">${p.productTitle }</h4>
                            <h4 class="price" name="productPrice">${p.productPrice }원</h4>
                            <div class="short_overview" name="productContent">
                                <p>${p.productContent }</p>
                            </div>

                            <!-- <div class="products--meta" style="padding-top: 0px;">
                                <p><span>작물종류</span> <span>CT201807</span></p>
                                <p><span>교환여부</span> <span>Outdoor Plants</span></p>
                                <p><span>거래지역</span> <span>plants, green, cactus </span></p>
                            </div> -->

                            <div class="cart--area d-flex flex-wrap align-items-center" style="padding-top: 50px;">
                                <!-- 찜, 문의하기, 구매하기 버튼 -->
                                <div>
                                    <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15"><i class="icon_heart_alt"></i> 찜</button>
                                </div>
                                <div>
                                    <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15">1:1 문의하기</button>
                                </div>
                                <form class="cart clearfix d-flex align-items-center" method="post">
                                    <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15">구매하기</button>
                                </form>
                            </div>
                            
                        	<br>

							<!-- 로그인한 유저가 글을 작성한 유저 아이디와 동일하거나 admin일 경우 글 수정 삭제가 가능-->	
							<!-- 수정/삭제 -->
							<div class="pdubtn" align="center">
						
									<div align="center" id="bottondiv">
										<a type="submit" name="addtocart" id="deleteBtn" value="5" class="btn alazea-btn-gray ml-15">삭제하기</a>
		                            	<a type="submit" name="addtocart" id="" value="5" class="btn alazea-btn-orange ml-15" href="pupdate.bo?pno=${p.productNo}">수정하기</a>
									</div>

                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </section>
    <!-- ##### Single Product Details Area End ##### -->
    
   	<!--------------------------- script 구문 -------------------------------->
   	
   	<!-- 삭제하기 -->
	<script>
           	$(function(){
           		//삭제하기 버튼에 form submit 함수 작성하기
           		
           		var dlBtn = $("#deleteBtn");
           		$("#deleteBtn").click(function(){
           			//form 태그가 있어야하고 해당 form태그에 각 속성들을 채우고
           			//원하는 데이터가 있다면 해당 테이터도 같이 태그로 작성하여 채워주고
           			//마지막으로 submit을 진행하면 된다.
           			
           			//form 태그 직업 생성
           			var formObj = $("<form>");
           			//console.log(formObj);
           			
           			//생성된 form 태그에 action 속성과 method 속성값 채워주기
					formObj.attr("action","pdelete.bo").attr("method","post");
           			//생성된 form 태그로 전송할 데이터 추가하기
           			//1번 bno (게시글 번호) - 해당 게시글을 삭제하려면 게시글 번호가 있어야하기 때문에
           			var pno = $("<input>").prop("type","hidden").prop("name","pno").prop("value","${p.productNo}");
           			//2번 첨부파일 경로 - 해당 게시글에 첨부파일이 있엇으면 해당 첨부파일도 서버에서 삭제해야하기 때문에
           			var filePath = $("<input>").prop("type","hidden")
           									   .prop("name","filePath")
           									   .prop("value","${p.changeName}");
           			
           			//생성한 form 태그에 bno태그와 filepath태그들 넣어주기
           			var obj = formObj.append(pno).append(filePath);
           			
           			//생성된 form을 body에 넣어서 문서에 포함시키기
           			$("body").append(obj);
           			
           			//최종적으로 완성된 form 태그 obj를 submit()하기
           			obj.submit();
           			
           			
           		});
           		
           		
           		
           	});
           
           
	</script>
            
    
    
    
    
    
    
    
    
    
    
    
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>