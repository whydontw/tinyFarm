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
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <style>
    
    	#deleteBtn{
    		color : #ffffff;    	
    	}

    	#deleteBtn:hover{
    		color : #b6b8b6;
    	
    	}
    	
    	#pimg{
    	/* 	width: 350px;
        	height: 400px; */
    	
    	}
    
    </style>

    
 
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
                            <li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> 작은농장</a></li>
                            <li class="breadcrumb-item"><a href="plist.bo">작물거래</a></li>
                            <li class="breadcrumb-item active" aria-current="page">작물정보</li>
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
                <div class="row justify-content">

                    <div class="col-12 col-md-4 col-lg-4 mx-auto">
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
                    <div class="col-12 col-md-5" style="margin : 15px;">
                        <div class="single_product_desc">
                        	<input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo}">
                            <input type="hidden" id="pUserNo" name="pUserNo" value="${p.userNo}">
                            <h4 class="title" name="productTitle">${p.productTitle }</h4>
                            <h4 class="price" name="productPrice">${p.productPrice }원</h4>
                            <div class="short_overview" name="productContent">
                                <p>${p.productContent }</p>
                            </div>


                            <div class="cart--area d-flex flex-wrap align-items-center" style="padding-top: 100px; padding-left: 5px; width: 500px;" align="center">
                                <!-- 찜, 문의하기, 구매하기 버튼 -->
                                <c:choose>
				                    <c:when test="${not empty loginUser}">
				                    	<c:choose>
				                    		<c:when test="${likeNo == 0}">
				                    		<!-- 빈하트일때 -->
					                    		<div>
	                                			<a idx="${p.productNo}" href="javascript:"
	                                				class="btn alazea-btn ml-15${p.productNo}" id="rec_update">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
														<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
													</svg>
	                                				${p.likeCount}</a>
	                                    		<!-- <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15" onclick="loginRequest();"><i class="bi bi-suit-heart"></i> 찜</button> -->
                                				</div>
				                    		</c:when>
				                    		<c:otherwise>
				                    		<!-- 꽉찬 하트일때 -->
				                    			<div>
                                				<a idx="${p.productNo}" href="javascript:" class="btn alazea-btn ml-15${p.productNo}" id="rec_update">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
  													<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
												</svg>
                                				${p.likeCount}</a>
                                    			<!-- <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15" id="rec_update"><i class="bi bi-suit-heart"></i> 찜</button> -->
                                				</div>
				                    		</c:otherwise>
				                    	</c:choose>
                                	</c:when>
                                	
                                	<c:otherwise>
                                	<div>
                             			<a href="javascript:" class="btn alazea-btn ml-15 notlogin" onclick="loginRequest();">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
											<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
										</svg>
                             			${p.likeCount}</a>
                                 		<!-- <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15" onclick="loginRequest();"><i class="bi bi-suit-heart"></i> 찜</button> -->
                            		</div>	
                                	</c:otherwise>
                                </c:choose>
                                <span id="likeCount">${likeCount}</span>
                                
                                
                                
                                <div>
                                    <button onclick="goChat();" name="addtocart" value="5" class="btn alazea-btn ml-15" >1:1 채팅하기</button>
                                </div>
                                <c:choose>
				                    <c:when test="${empty loginUser}">
                                		<div>
                                    		<button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15" onclick="loginRequest();">구매하기</button>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div>
                                    		<button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15" onclick="location.href='<%=request.getContextPath()%>/porder.bo?pno=${p.productNo}'">구매하기</button>
                                		</div>
                                	</c:otherwise>
                                </c:choose> 

                            </div>
                            
                        	<br>

							
							<!-- 수정/삭제 -->
							<div class="pdubtn" align="center" style="margin-right:30px;">
								
								<c:if test="${not empty loginUser}">
									<div align="center" id="bottondiv">
										<a type="submit" name="addtocart" id="deleteBtn" value="5" class="btn alazea-btn-gray ml-15">삭제하기</a>
		                            	<a type="submit" name="addtocart" id="" value="5" class="btn alazea-btn-orange ml-15" href="pupdate.bo?pno=${p.productNo}">수정하기</a>
									</div>
								</c:if>

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
	
   	
   	<!-- 추천 기능에 쓰이는 함수들 -->
	<script>
		$("#rec_update").click(function(){
			
			//pno를 idx로 전달받아 저장
			let pno = $(this).attr('idx');
			
			
			//빈하트 눌렀을때
			if($(this).children('svg').attr('class') == "bi bi-suit-heart"){


				$.ajax({
					url : 'likeInsert.bo',
					type : 'get',
					data : {
						pno
					},
					success : function(p){
						
						var likeCnt = p;
						
						console.log("하트추가 성공");
						console.log("p : ", p);						
						
						$("#rec_update").html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">'+
								'<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/></svg>  ' + likeCnt);

						console.log("꽉찬하트로 바꼈습니다");
						console.log("likecount: "+ likeCnt);
						
						
					},
					error : function(){
						console.log('서버 에러');
					}
				});
				


			//꽉찬 하트 눌렀을때
			}else if($(this).children('svg').attr('class') == "bi bi-suit-heart-fill"){
				console.log("꽉찬하트 click"+pno);
				
			 	$.ajax({
					url : 'likeRemove.bo',
					type : 'get',
					data : {
						pno
					},
					success : function(p){
						
						var likeCnt = p;

						console.log("하트 삭제 성공");
						console.log("p : ", p);
						
					 	//빈하트로 바꾸기
					 	
					 	$("#rec_update").html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">'+
						'<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/></svg>  '+likeCnt);
						
						
					},
					error : function(){
						console.log('서버 에러');
					}
				});
			 	console.log("빈하트로 바꾸기");
				
			}
					
		});
		

	</script>




	
	<!-- 찜기능 로그인 전(로그인 유도) 스크립트 -->	 
	<script>
	function loginRequest(){
  			alert("로그인 후 이용해주세요.");
  			location.href="loginGo.me";
  				return false;
			}
	</script>
	
	<!-- 채팅방 가기 -->
    <script>
    	function goChat(){
    		//상품 올린 사람의 userNo 정보
    		var userNo = $("#pUserNo").val();
    		var loginUserNo = "${loginUser.userNo}";

    		if(userNo != loginUserNo){
    			$.ajax({
    				url : "getUserId.ch",
    				data : {
    					userNo : userNo
    				},
    				success : function(result){
    					location.href="chatList.ch?userId="+result;
    				},
    				error : function(){
    					console.log("통신 에러");
    				}
    			});
    			
    		} else {
    			alert("나에게는 채팅을 걸 수 없습니다.");
    		}
    		
    	}
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