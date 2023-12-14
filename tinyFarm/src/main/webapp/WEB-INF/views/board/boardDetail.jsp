<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>
	
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- alert창 꾸미기 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
	
	<style>
		.updateButton,.deleteButton,.updateRbutton,.deleteRbutton{
			width: 100%;
			height: 50px;
			border: none;
			
		}
	</style>


</head>

<body>
   	 <%@include file="../common/header.jsp" %>

    <!-- 상단 -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>이야기 공간</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="#">이야기 공간</a></li>
                            <li class="breadcrumb-item active" aria-current="page">이야기 공간 게시글</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 끝 -->

    <!-- 게시물 세부사항 영역 -->
    <section class="blog-content-area section-padding-0-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Blog Posts Area -->
                <div class="col-12 col-md-8">
                    <div class="blog-posts-area">
                        <!-- Post Details Area -->
                        <div class="single-post-details-area">
                            <div class="post-content">
                                <h4 class="post-title">${boardInfo.boardTitle }</h4>
                                <div class="post-meta mb-30">
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${boardInfo.createDate }</a>
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i> ${boardInfo.boardWriter }</a>
                                    <!-- 수정 /삭제 버튼  -->
	                                <button type="button" data-toggle="modal" data-target="#myModal" style="border: none;"> <img alt="..." src="resources/img/icon/dots.png" style="width: 25px; height: 25px;"> </button>
                                </div>
                                <div class="post-thumbnail mb-30">
                                    <img src="${boardInfo.titleImg }" alt="">
                                </div>
                                <p>${boardInfo.boardContent }</p>                           
                            </div>
                        </div>
                        
                        <script></script>

                      

						   <!-- Leave A Comment -->
                        <div class="leave-comment-area clearfix">
                            <div class="comment-form">
                                <h4 class="headline"><span id="rcount"></span> Comments</h4>

                                <div class="contact-form-area">
                                    <!-- Comment Form -->
                                    
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <textarea class="form-control" name="replyContent" id="replyContent" cols="30" rows="10" style="resize: none;" placeholder="Comment"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn alazea-btn" id="insertRbutton">Post Comment</button>
                                            </div>
                                            
                                        </div>
                                   
                                </div>
                            </div>
                        </div>
						
                        <!-- Comment Area Start -->
                        <div class="comment_area clearfix">
                            <ol>
                                <!-- Single Comment Area -->
                                <li class="single_comment_area">
                                </li>
                            </ol>
                        </div>
                        
                    

                     
                     <script>
                     	function replyList(){
                     		$.ajax({
                     			url: "boardReplyList.bo",
                     			data : {
                     					boardNo: ${boardInfo.boardNo}
                     					},
                     			success: function(result){
                     				
                     				$(".single_comment_area").empty();  //append방식을 사용할때는 이렇게 비워주지않으면 중첩으로 쌓이기떄문에 비워줘야함
                     				for(var i in result) {
                     					//console.log("하이루"+result[i].replyContent);
                     					var wraperDiv = $("<div class='comment-wrapper d-flex'></div>");
										var profileDiv = $("<div class='comment-author'></div>");
										var commentContent = $(" <div class='comment-content'></div>");
										var inConmmentContent = $("<div class='d-flex align-items-center justify-content-between'></div>");
										
										var profileStr = $("<img>");
										var replyWriterStr = $("<h5></h5>");
										var replyCreateDate = $("<span class='comment-date'></span>");
										var replyContentStr = $("<p></p>");
										var replyModalBtn = $("<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;'><img src='resources/img/icon/dots.png' style='width: 20px; height: 20px;'></button>");	
										var contentBetweenDiv = $("<div></div>");
										var hiddenReplyNo = $("<input>");
										
										hiddenReplyNo.attr("type","hidden").attr("name","replyNo").attr("value",result[i].replyNo);  //하나하나 replyNo를 숨겨서 controller로 보내줌
										profileStr.attr("src","result[i].profile");
										replyWriterStr.text(result[i].replyWriter);
										replyCreateDate.text(result[i].createDate);
										replyContentStr.text(result[i].replyContent);
								        
										
										profileDiv.append(profileStr);
										contentBetweenDiv.append(hiddenReplyNo).append(replyCreateDate).append(replyModalBtn)
										inConmmentContent.append(replyWriterStr).append(contentBetweenDiv)
										commentContent.append(inConmmentContent).append(replyContentStr);
										wraperDiv.append(profileDiv).append(commentContent);
														
									/* 	<div class='comment-wrapper d-flex'>
											<div class='comment-author'>
												<img src="">
											</div>
											<div class='comment-content'>
												<div class='d-flex align-items-center justify-content-between'>
													<h5>replyWriter</h5>
													<div>
														<input type="hidden" name="replyNo" value="result[i].replyNo">
														<span class='comment-date'>createDate</span>
														<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;'><img src='resources/img/icon/dots.png' style='width: 10px; height: 10px;'></button>
													</div>
												</div>
												<p>replyContent</p>
											</div>
										</div> */
										
										
                     					$(".single_comment_area").append(wraperDiv);
                     					
                     				}
                     					
                     					$("#rcount").text(result.length);
                     					
                     			},
                     			error: function(){
                     				console.log("통신오류");
                     			}
                     		});
                     	}
    	
                     	$(function(){
                     		
                     		$("#insertRbutton").click(function(){
                     			$.ajax({
		                 			url: "insertReply.bo",
		                 			data: {
		                 				replyContent : $("#replyContent").val(),
		                 				replyWriter : "${loginUser.userId}", //""을 써야 얘가 string형태임을 알수있음 안쓰면 모름
		                 				refBno : ${boardInfo.boardNo}
		                 				},
		                 			success: function(result){
		                 				if(result>0){
		                 					swal("Good job!", "댓글 작성 성공!", "success");
		                 			
		                 				}else{
		                 					swal("error!", "이용에 불편을 줘서 죄송합니다.");
		                 				}
		                 				replyList();
		                 				$("#replyContent").val("");
		                 			},
		                 			error: function(){
		                 				console.log("댓글작성실패");
		                 			}
		                 		}); 
                     		})
                     	});
                     	
                     	
                     	
                     </script>
                     
                    
                     
                    <script>
                    	//상세게시물에 댓글 불러오기
                    	$(function(){
                    		replyList();
                    		
                    	});
                    </script>
                     

                    </div>
                </div>

                <!-- Blog Sidebar Area -->
                <div class="col-12 col-sm-9 col-md-4">
                    <div class="post-sidebar-area">

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <form action="#" method="get" class="search-form">
                                <input type="search" name="search" id="widgetSearch" placeholder="Search...">
                                <button type="submit"><i class="icon_search"></i></button>
                            </form>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Author Widget -->
                            <div class="author-widget">
                                <div class="author-thumb-name d-flex align-items-center">
                                    <div class="author-thumb">
                                        <img src="resources/img/bg-img/29.jpg" alt="">
                                    </div>
                                    <div class="author-name">
                                        <h5>Alan Jackson</h5>
                                        <p>Editor</p>
                                    </div>
                                </div>
                                <p>I’m the editor for houseplants &amp; garden design articles on social, and I like to put each of those articles in the topic.</p>
                                <div class="social-info">
                                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>

                     
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Content Area End ##### -->

 
     <!-- 게시글 수정/삭제/신고 모달 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">더보기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
      	     <div class="buttonContent">
         		 <button class="updateButton" onclick="location.href='update.bo?boardNo=${boardInfo.boardNo}'">수정하기</button> <br>
         		 <form action="delete.bo" method="post">
         		 	<input type="hidden" name="boardNo" value="${boardInfo.boardNo }">
          		 	<button class="deleteButton" type="submit">삭제하기</button>  
          		 </form>
             </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    
    
  <!-- 댓글 수정/삭제/신고 모달 -->
  <div class="modal" id="replyModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">더보기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
         
        <!-- Modal body -->
        <div class="modal-body">
          <div class="replyBody">
          			<!-- <input type="hidden" name="replyNo" value=""> -->
         		 	<button class="updateRbutton" type="submit" id="updateRbutton">수정하기</button> <br> 	
          		 	<button class="deleteRbutton" type="submit" id="deleteRbutton">삭제하기</button>  
             </div>
        </div>
        
        <%--
         <!-- Modal body -->
        <div class="modal-body">
          <div class="replyBody">
          		 <form action="updateReply.bo" method="post">
         		 	<button class="updateRbutton" type="submit">수정하기</button> <br>
         		 	<input type="hidden" name="replyNo" value="${replyNo }">
         		 </form>
         		 <form action="deleteReply.bo" method="post">
         		 	<input type="hidden" name="replyNo" value="${boardInfo.boardNo }">
          		 	<button class="deleteRbutton" type="submit">삭제하기</button>  
          		 </form>
             </div>
        </div>
         --%>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    
    <script>
    $(function(){
    	$("#deleteRbutton").click(function(){
    		console.log("이거나오나?");
    		console.log($(this).parents());
    		console.log("replyNo: "+ $(this).parents().children().eq(0).val()); 
    		//console.log("replyNo: "+ $("#replyBtn").parents().children().eq(0).val());  //아이디값으로 하면은 id는 고유값이기때문에 지금 여러댓글리스트들이 다 같은 id로 되어있어서 가장 최신에 하나만 선택하게됨 그래서 boardNo가 같은 숫자만 나오게됨 그래서 this를 이용해야함
    		//console.log("replyNo: "+  $(this).closest(".comment-wrapper").find("input[name='replyNo']").val());
	    	var replyNo = $("#replyBtn",parent.document).eq(0).val();

	    	
	    	/*
	    		<div class='comment-content'>
					<div class='d-flex align-items-center justify-content-between'>
						<h5>replyWriter</h5>
							<div>
								<input type="hidden" name="replyNo" value="result[i].replyNo">
								<span class='comment-date'>createDate</span>
								<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;'><img src='resources/img/icon/dots.png' style='width: 10px; height: 10px;'></button>
							</div>
					</div>
						<p>replyContent</p>
				</div>
	    	*/
	    	
	    	
			$.ajax({
				url: "deleteReply.bo",
				data: {
					replyNo : replyNo
					},
				success: function(result){
					if(result>0){
     					swal("Good job!", "댓글 삭제 성공!", "success");

     				}else{
     					swal("error!", "이용에 불편을 줘서 죄송합니다.");
     				}
				},
				error: function(){
					console.log("통신오류");
				}
			});    		
    	});
    	
    	
    	$("#replyBtn").click(function(){
    		console.log(this);
    	}
    	
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