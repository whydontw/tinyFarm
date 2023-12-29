<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
     <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">
    <style>

		a,p{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		.plantImg,.plantName:hover{
			cursor : pointer;
		}
		.loader {
	      border: 16px solid #f3f3f3;
	      border-top: 16px solid #70c745;
	      border-radius: 50%;
	      width: 120px;
	      height: 120px;
	      animation: spin 2s linear infinite;
	      margin: auto;
	    }
	
	    @keyframes spin {
	      0% { transform: rotate(0deg); }
	      100% { transform: rotate(360deg); }
	    }
		.hidden{
			display:none;
		}

   
        .plantImg,.plantName:hover{
            cursor : pointer;
        }
        
    </style>

</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-post-slides owl-carousel">
            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url(resources/img/bg-img/1.jpg);"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>식물을 키우고 싶은데 방법을 모르겠나요?</h2>
                                <p>저희 '작은농장'은 집, 학교, 회사 등 나만의 공간에서 텃밭 가꾸기를
                                    시작하려는 사람들에게 길잡이가 되어드립니다.</p>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url(resources/img/bg-img/2.jpg);"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>오늘의 식물 일지 작성하기</h2>
                                <p>오늘의 식물 일지를 작성하고 등급을 높여보아요</p>
                                <div class="welcome-btn-group">
                                    <button class="btn alazea-btn mr-30 go-diary">일지 작성하러 가기</a>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->
    <!-- ##### Service Area Start ##### -->
    <section class="our-services-area bg-gray section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>TIP</h2>
                        <p>We provide the perfect service for you.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-12 col-lg-5"  style="margin-left:70px;">
                    <div class="alazea-service-area mb-100" style="margin-bottom: 0px;">
                        <!-- Single Service Area -->
                        <div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                            <!-- Icon -->
                            <div class="service-icon mr-30">
                                <img src="resources/img/core-img/s1.png" alt="">
                            </div>
                            <!-- Content -->
                            <div class="service-content">
                                <h5>빛</h5>
                                <p style="font-size: 10px;">빛은 식물에게 중요한 요소입니다. 그러나 식물에 따라 필요한 양은 다양한데요. 일반적으로 꽃이 피고 열매를 맺는 식물이나 잎의 색깔이 화려한 식물은 많은 빛을 필요로 합니다. 현재 우리가 알고 있는
                                     일반 실내 식물들은 대부분 열대식물이나 아열대식물이며, 이들은 열대우림의 울창한 숲에 
                                     가려져 희미한 빛만 드는 환경에서도 잘 자라는 경우가 많습니다.</p>
                            </div>
                        </div>
                        <!-- Single Service Area -->
                        <div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="300ms"
                        style="margin-top:80px;">
                            <!-- Icon -->
                            <div class="service-icon mr-30">
                                <img src="resources/img/core-img/s2.png" alt="">
                            </div>
                            <!-- Content -->
                            <div class="service-content">
                                <h5>물과 환기</h5>
                                <p style="font-size: 10px;">식물은 물을 통해 많은 영양분을 흡수합니다. 식물이 광합성을 할 때 꼭 필요한 물질이며 잎과 줄기를 지탱해주죠. 
                                    식물에게 물은 아주 중요하지만, 흙이 숨 쉴 수 있도록 만들어주는 것은 신선한 공기입니다. 실내공간에서 공기의 순환이 어렵다는 것은 모두 알고 계실 텐데요. 주기적인 환기를 통해 식물과 흙을 건강하게 유지해 줘야 벌레도 안 생기고 식물도 건강해집니다.</p>
                            </div>
                        </div>
                        <!-- Single Service Area -->
                        <div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="500ms"
                        style="margin-top:80px;">
                            <!-- Icon -->
                            <div class="service-icon mr-30">
                                <img src="resources/img/core-img/s3.png" alt="">
                            </div>
                            <!-- Content -->
                            <div class="service-content">
                                <h5>온도와 습도</h5>
                                <p style="font-size: 10px;">대부분의 실내식물들은 10~25도 사이의 온도에서 잘 자랍니다. 일교차가 큰 환절기의 경우, 창문에서 떨어진 곳에 식물을 두는 것이 좋습니다. 저도 창가에 식물을 뒀다가 차가운 새벽 공기에 냉해를 입은 적이 있습니다. 특히 주거공간이 아닌 상업공간이나 사무실은 밤에 난방을 하지 않기 때문에 특별히 창가나 외벽 주변은 피하는 것이 안전해요.
                                    또한 냉난방기 주변은 매우 건조하기 때문에 피하는 것이 좋습니다. </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin-right:120px;">
                    	
                   <jsp:include page="/WEB-INF/views/common/weather/weather_resize.jsp"></jsp:include>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Service Area End ##### -->
    <input id="pageNo" type="hidden" value="1">
     
    <section class="new-arrivals-products-area bg-gray section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>실내정원용 식물</h2>
                        <p>We have the latest products, it must be exciting for you</p>
                    </div>
                </div>
            </div>

			<!-- 로딩 화면 -->
			<div id="loadingScreen" align="center">
	  			<div class="loader"></div>
	  			<br>
				<h5><b>로딩중입니다. 잠시만 기다려주세요</b></h5>
			</div>
            <div class="row itemRow hidden">

            </div>

            <div class="col-12 text-center more-view-div hidden ">
            	<button class="btn alazea-btn more-view-btn">더보기</button>
            </div>
            
            <script>

	            $(function(){
	        		getInGardenPlantListAjax();
	        		$(".more-view-btn").click(function(){
	        			getInGardenPlantListAjax();
	        			
	        		});
	           		$(".itemRow").on("click","img",function(){
	                   	console.log($(this));
	           			$(this).parents("form").children(".submitBtn").click();
	           		});
	           		$(".itemRow").on("click","p",function(){
	           			console.log($(this));
	           			$(this).parents("form").children(".submitBtn").click();
	           		});

	        	});
           		
            	function getInGardenPlantListAjax(){
            		console.log("식물 리스트 ajax 불러오기");
            		$.ajax({
            			url : "inGardenPlantListAjax.pp",
            			data : {
            				pageNo : $("#pageNo").val()
            			},
            			success : function(result){
            				console.log(result);
            				var inputValue = $("#pageNo").val(); // input 요소의 값을 가져옴
            		        var incrementedValue = parseInt(inputValue) + 1; // 가져온 값에 1을 더함 (숫자로 변환 후 덧셈)
            		        $("#pageNo").val(incrementedValue); // 변경된 값을 다시 input 요소에 설정함
            		        
            		        for(var i=0;i<result.length;i++){
            		        	var outDiv = $("<div class='col-12 col-sm-6 col-lg-3'></div>");
            		        	var inDiv = $("<div class='single-product-area mb-50 wow fadeInUp inDiv' data-wow-delay='100ms'></div>");
            		        	var formDiv = $("<form action='detailInGarden.pp' method='post'></form>");
            		        	
            		        	var rtnFileUrlStr = $("<input type='hidden' name='rtnFileUrlStr' value=''>");
            		        	rtnFileUrlStr.val(result[i].rtnFileUrlStr);
            		        	
            		        	var cntntsNo = $("<input type='hidden' name='cntntsNo' value=''>");
            		        	cntntsNo.val(result[i].cntntsNo);
            		        	
            		        	var cntntsSj = $("<input type='hidden' name='cntntsSj' value=''>");
            		        	cntntsSj.val(result[i].cntntsSj);
            		        	
            		        	var submitBtn = $("<input type='submit' class='submitBtn' hidden>");
            		        	var imgDiv = $("<div class='product-img'></div>");
            		        	var nameDiv = $("<div class='product-info mt-15 text-center'></div>");
            		        	var img = $("<img class='plantImg' style='width:250px; height:250px;'>");
            		        	var name = $("<p class='plantName'></p>").text(result[i].cntntsSj);
            		        	
            		        	img.attr("src",result[i].rtnFileUrl[0]);
            		        	
            		        	
            		        	nameDiv.append(name);
            		        	imgDiv.append(img);
            		        	formDiv.append(rtnFileUrlStr);
            		        	formDiv.append(cntntsNo);
            		        	formDiv.append(cntntsSj);
            		        	formDiv.append(submitBtn);
            		        	formDiv.append(imgDiv);
            		        	formDiv.append(nameDiv);
            		        	inDiv.append(formDiv);
            		        	outDiv.append(inDiv);
            		        	$(".itemRow").append(outDiv);
            		        }
            		        $("#loadingScreen").css("display","none");
            		        $(".itemRow").removeClass("hidden");
            		        $(".more-view-div").removeClass("hidden");
            			},
            			error : function(){
            				console.log("통신 오류");
            			}
            		});
            	}
            	//일지 작성 버튼 클릭 이벤트
            	$(".go-diary").click(function(){
            		var loginUser = "${loginUser.userId}";
            		console.log(loginUser);
            		if(loginUser == ""){
            			alert("로그인 후 진행해주세요.");
            			location.href = "loginGo.me";
            		}else {
            			location.href = "diary.me";
            		}
            	});	
            	

            </script>
        </div>
    </section>
    
    <!-- ##### Product Area End ##### -->
    <%@include file="common/footer.jsp" %>
    <%-- <jsp:include page="common/footer.jsp"/> --%>
    
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