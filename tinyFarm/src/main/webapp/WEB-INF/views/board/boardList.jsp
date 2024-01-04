<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Alazea - Gardening &amp; Landscaping HTML Template</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<style>
.boardHeader {
	display: flex;
}

.boardFooter {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}
.boardContent{
	width:700px;
	word-wrap:break-word;
}

</style>


</head>

<body>
	<%@include file="../common/header.jsp"%>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>함께 이야기해요</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">함께이야기해요</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### Blog Area Start ##### -->
	<section class="alazea-blog-area mb-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-8">
					<div style="display:flex; justify-content:flex-end;">
						<a href="insert.bo"><img src="resources/img/icon/글작성1.png"
							style="width: 25px; height: 25px;"></a>
					</div>
					<div class="row">


						<div>
							<ul class="feed_items">

							</ul>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-4">
					<div class="post-sidebar-area">
						<!-- ##### Single Widget Area ##### -->
						<div class="single-widget-area">
							<form action="#" method="get" class="search-form">
								<input type="search" name="search" id="widgetsearch"
									placeholder="Search...">
								<button type="submit">
									<i class="icon_search"></i>
								</button>
							</form>
						</div>
						<jsp:include page="/WEB-INF/views/common/weather/weather_resize.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Blog Area End ##### -->

	<script>
                       	$(function(){
                       		selectBoardList();
                       		time();
                       	});
                      </script>

	<script>
							
									
                       		function selectBoardList(){
                    	   		 
                       			$.ajax({
                       				url: "list.bo",
                       				success: function(result){
                     					
                       					$(".feed_items").empty();
                       					if(result.length == 0){
                       						
                       					}else {
                       						
	                       					for(var i in result){
	                       						var liDiv = $("<li class='feed_item'></li>");
	                       						var boardHeaderDiv = $("<div class='boardHeader'></div>");
	                       						var div1 = $("<div style='width:700px;'></div>");
	                       						var pDiv = $("<p></p>");
	                       						var spanDiv1 = $("<span></span>");
	                       						var boardContentDiv= $("<div class='boardContent'></div>");
	                       						var div2 = $("<div></div>");
	                       						var div3 = $("<div></div>");
	                       						var footerUl = $("<ul class='boardFooter'>");
	                       						var footerLi1 = $("<li></li>");
	                       						var footerLi2 = $("<li></li>");
	                       						
	                       					
	                       						var profileStr = $("<img style='width: 30px; height: 30px; border-radius: 20px;'>");
	                       						var hiddenBno = $("<input type='hidden' name='boardNo'>");
	                       						var replyIcon = $("<img style='width: 23px; height: 23px;'>"); 
	                       						var replyCount = $("<span id='rcount'></span>");
	                       						var hiddenBno2 = $("<input type='hidden' name='boardNo' id='hiddenBno'>");
	                       						var heartIcon = $("<img>");
	                       						var buttonStr = $("<button type='button' onclick='dolike(this);' style='border: none; outline: none; background-color:white;'>좋아요</button>");
	                       						var spanDiv2 = $("<span id='likeCount'></span>");
	                       						var hrStr = $("<hr style='background-color: #E0E0E0; opacity: 0.7'>");
	                       						
	                       						profileStr.attr("src",result[i].profile);
	                       						
	                       						
	                       			            var today = new Date();
	                       				        console.log("today: " + today);
	                       			
	                       				        var dateString = result[i].createDate; // 여기에 "${boardInfo.createDate}" 대신 직접 값을 넣어주세요.
	                       				        var dateParts = dateString.split(/[- :]/);
	                       				        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]);
	                       				        console.log("timeValue: " + timeValue);
	                       				        
	                       				     
	                       			
	                       				        const timeDifference = today - timeValue; // 밀리초 단위의 차이
	                       				        const seconds = Math.floor(timeDifference / 1000);
	                       				        const minutes = Math.floor(seconds / 60);
	                       				        const hours = Math.floor(minutes / 60);
	                       				        const days = Math.floor(hours / 24);
	                       			
	                       				        let msg = "";
	                       			
	                       			                   
	                       				        if (days > 0 && days <= 7) {
	                       				            msg = days + "일 전";
	                       				        } else if (days > 7) {
	                       				            // 날짜 형식으로 표시
	                       				            const year = timeValue.getFullYear();
	                       				            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
	                       				            const day = timeValue.getDate();
	                       			
	                       				            msg = year + ". " + month + ". " + day;
	                       				        } else if (hours > 0) {
	                       				            msg = hours + "시간 전";
	                       				        } else if (minutes > 0) {
	                       				            msg = minutes + "분 전";
	                       				        } else {
	                       				            msg = "방금 전";
	                       				        }
	                       			
	                       				        console.log(msg);
	                       				    	spanDiv1.text(msg);
	                       	                   
	                       						pDiv.text(result[i].boardWriter).append(" •").append(spanDiv1);  //이 부분 맞는지 확인
	                       						div1.append(pDiv);
	                       						boardHeaderDiv.append(profileStr).append("&nbsp;&nbsp;").append(div1);
	                       						
	                       						hiddenBno.attr("value",result[i].boardNo);
	                       						div2.append(result[i].boardContent);
	                       						boardContentDiv.append(hiddenBno).append(div2);
	                       						
	                       						replyIcon.attr("src","resources/img/icon/댓글.png");
	                       						replyCount.text(result[i].replyCount);
	                       						footerLi1.append(replyIcon).append("&nbsp;댓글").append("&nbsp;").append(replyCount);
	                       						
	                       						hiddenBno2.attr("value",result[i].boardNo);
	                       						heartIcon.attr("src","resources/img/icon/heart.svg").attr("class","heartClass");
	                       						spanDiv2.text(result[i].likeCount);
	                       						footerLi2.append(hiddenBno2).append(heartIcon).append(" &nbsp;").append(buttonStr).append("&nbsp;").append(spanDiv2);
	                       						
	                       						footerUl.append(footerLi1).append(footerLi2);
	                       						div3.append(footerUl);
	                       						
	                       						liDiv.append(boardHeaderDiv).append(boardContentDiv).append(div3).append(hrStr);
	                       						
	                       						$(".feed_items").append(liDiv);
	                       					
	                       					 
	                       						
	                       						
	                       					
	                       						
	                       						/*
	                       							<div>
	                      						      <ul class="feed_items">
	                      						    	 <li class="feed_item">
		                      						    	 <div class="boardHeader">  
		     		                                       	    <img src="${b.profile }" style="width: 30px; height: 30px; border-radius: 20px;"> &nbsp;&nbsp;
			     		                                       	<div> 
					                                               <p class="">${b.boardWriter}<span class="">•${b.createDate}</span></p>
					                                            </div>
				                                       		 </div>
				                                       		 
					                                       	  <!--글내용과 사진 작성-->
						                                       <div class="boardContent">
						                                       		<input type="hidden" name="boardNo" value="${b.boardNo }">
						                                            <div>${b.boardContent }</div>
						                                       </div>    
	     		                                       	    
						                                       <!--댓글/좋아요 영역-->
						                                       <div>
						                                            <ul class="boardFooter">  <!--옆으로 띄워야함-->  <!--그리고 좋아요수 댓글수는 비동기식으로 작성하기-->
						                                            	
						                                                <li>
						                                                	<img src="resources/img/icon/댓글.png" style="width: 23px; height: 23px;">
						                                                	&nbsp; 댓글  
						                                                	<span id="rcount">${b.replyCount }</span> 
						                                                </li>
						                                                <li>
						                                                	<input type="hidden" name="boardNo" id='hiddenBno' value="${b.boardNo }">
						                                                	<img class="heartClass" src="resources/img/icon/heart.svg">&nbsp;&nbsp;
						                                                	<button type="button" onclick="dolike(this);" style="border: none;">좋아요</button>  <!-- 내 자신의 정보를 넣어주려고 this 넣음 --> 
						                                                	<span id="likeCount">${b.likeCount }</span> 
						                                                </li>
						                                            </ul>
						                                       </div>
						                                       
						                                       <hr style="background-color: #E0E0E0; opacity: 0.7">
						                                   </li>
						                               </ul>
	
						                           </div>
	                       						*/
	                       						
	                       						
	                       					}
                       					}
                       					findLike();
                       				},
                       				error: function(){
                       					console.log("통신오류");
                       				}
                       			});
                       		}                       
              
                            function findLike(){
                            	
							
							
								var boardNoArray = document.querySelectorAll('.boardFooter input#hiddenBno');
								console.log(boardNoArray)
								
                            	 $.ajax({
                            		url : "findLike.bo",
                            		data : {
                            			userNo : ${loginUser.userNo}
										
                            		},
                            		//async : false, //순서대로 하게끔만들음(동기식마냥)
                            		success: function(result){
	                            
                            				for(var j=0;j<boardNoArray.length;j++){
		                            			for(var i in result){	
		                            				if(boardNoArray[j].value==result[i].refBno){
		                            					console.log("확인");
		                            					console.log($(boardNoArray[j]).siblings("button"));
		                            					//console.log("refBno : "+result[i].refBno);
		                            					//console.log($(boardNoArray[j]).siblings("img.heartClass"));
		                            					$(boardNoArray[j]).siblings("img").eq(0).attr("src","resources/img/icon/heart-fill.svg");
		                            					$(boardNoArray[j]).siblings("button").css("color","#FF9999");
		                            					$(boardNoArray[j]).siblings("#likeCount").css("color","#FF9999");
		                            					break;
		                            				}else{
		                            					$(boardNoArray[j]).siblings("img").eq(0).attr("src","resources/img/icon/heart.svg")
		                            					$(boardNoArray[j]).siblings("button").css("color","black");
		                            					//$(boardNoArray[j]).siblings("#likeCount").css("color","black");
		                            					
		                            				}
	                            				}
                            				}


										
                            		},
                            		error: function(){
                            			console.log("통신오류");
                            		}
                            	}); 
                            		
                           	}
                            
                            	
              
                            //로그인유저userNo와 각 게시글의 bno를 받아오기
                         
 					
                            
                            function dolike(el){
                            	
                            	var refBno = $(el).parents().children().eq(0).val();
      
                            	var heartImg = $(el).parents().children().eq(1); //이미지사진 
                            	
                            	//var likeText = $(el).parents().children().eq(2).text();
                            	var like = $(el).parents().children().eq(2);
                            	var likeText = like.text();
                            	console.log(likeText);
                            	var likeCount = $(el).parents().children().eq(3); 
                            	
     							console.log(likeCount.text())
                            	
                            	//if(이미지파일이 heart이면 ) 
                            if(heartImg.attr("src") =="resources/img/icon/heart.svg"){
                            	 $.ajax({
                            		url : "dolike.bo",
                            		data : {
                            				refBno : refBno,
                            				userNo : "${loginUser.userNo}"
                            			},
                            		success : function(result){
                            			if(result==1){
                            				heartImg.attr("src","resources/img/icon/heart-fill.svg");
                            				
                            				//likeText.css({"color":"red"});
                            				//like.css({"color":"red"});
                            				//likeText.style.color="red";
                            				selectBoardList();
                            				
                            				
                            			}else{
                            				console.log("좋아요실패");
                            			}
                            		},
                            		error : function(){
                            			console.log("통신오류")
                            		}
                            	}); 
                            	
                            	}else{
	                            	$.ajax({
	                            		url : "cancelLike.bo",
	                            		data : {
	                            			refBno : refBno,
	                        				userNo : "${loginUser.userNo}"
	                            		},
	                            		success: function(result){
	                            			if(result==1){
	                            				heartImg.attr("src","resources/img/icon/heart.svg");
	                            				selectBoardList();
	                            				
	                            			}else{
	                            				console.log("좋아요취소실패");
	                            			}
	                            		},
	                            		error : function(){
	                            			console.log("통신오류");
	                            		}
	                            	});
                            	}
                            }
                          
                        	//시간표시
                        	function time(){
                        		 var today = new Date();
                        	        console.log("today: " + today);

                        	        var dateString = "${boardInfo.createDate}"; // 여기에 "${boardInfo.createDate}" 대신 직접 값을 넣어주세요.
                        	        var dateParts = dateString.split(/[- :]/);
                        	        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]);
                        	        console.log("timeValue: " + timeValue);

                        	        const timeDifference = today - timeValue; // 밀리초 단위의 차이
                        	        const seconds = Math.floor(timeDifference / 1000);
                        	        const minutes = Math.floor(seconds / 60);
                        	        const hours = Math.floor(minutes / 60);
                        	        const days = Math.floor(hours / 24);

                        	        let msg = "";

                        	        if (days > 0 && days <= 7) {
                        	            msg = days + "일 전";
                        	        } else if (days > 7) {
                        	            // 날짜 형식으로 표시
                        	            const year = timeValue.getFullYear();
                        	            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
                        	            const day = timeValue.getDate();

                        	            msg = year + ". " + month + ". " + day;
                        	        } else if (hours > 0) {
                        	            msg = hours + "시간 전";
                        	        } else if (minutes > 0) {
                        	            msg = minutes + "분 전";
                        	        } else {
                        	            msg = "방금 전";
                        	        }

                        	        console.log(msg);
                        	        //document.getElementById("boardCreateDate").innerText = msg;
                        	        $("#boardCreateDate").append(msg)
                        		
                        		
                        	}
                            
                       </script>


	<script>
							$(function(){
								$(".feed_items").on("click","li>.boardContent",function(){
									
									//console.log("boardNo: "+$(this).children().eq(0).val());
									//location.href="detail.bo?boardNo="+$(this).children().eq(0).val();
									location.href="detail.bo?boardNo="+$(this).children().eq(0).val();
								});
								
							});
						</script>





	<jsp:include page="../common/footer.jsp"></jsp:include>


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