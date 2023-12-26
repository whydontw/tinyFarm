<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">

    <!-- jQuery 라이브러리 -->
    <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- alert창 꾸미기 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
        .updateButton, .deleteButton, .updateRbutton, .deleteRbutton,.reportButton {
            width: 100%;
            height: 50px;
            border: none;
            outline: none;
        }
        
        #updateRbutton{
                display: none;
         }
                
        #replyBtn, .boardAllModal {
            border: none;
            outline: none;
        }
        
        .modal-content{
            margin-top: 300px;
        }
        
        
        #originContent{
        	width:600px;
        	height:auto;
        	word-wrap:break-word;
        }
        .reply-report-btn{
        	margin-right:10px;
        	color: #b7b7b7;
        }
        .reply-report-btn:hover{
        	cursor:pointer;
			color:#FF6C30;
        }
        .reply-report-div{
        	width:100%;
        	display: flex;
        	justify-content: flex-end;
        }
        </style>



</head>

<body>
    <%@include file="../common/header.jsp"%>

    <!-- ##### Breadcrumb Area Start ##### -->
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
                            <li class="breadcrumb-item"><a href="#">함께 이야기해요</a></li>
                            <li class="breadcrumb-item active" aria-current="page">이야기 공간</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

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
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> ${boardInfo.createDate }</a>
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i> ${boardInfo.boardWriter }</a>
                                    <!-- 수정 /삭제 버튼  -->
                                    <button type="button" data-toggle="modal" data-target="#myModal" class="boardAllModal" style="outline: none;">
										<img src="resources/img/icon/dots.png" style="width: 25px; height: 25px;">
									</button>
                                </div>
                                <div class="post-thumbnail mb-30">
                                    <img src="${boardInfo.titleImg }" alt="">
                                </div>
                                <p>${boardInfo.boardContent }</p>   
                            </div>
                        </div>

                       
                        <!-- Leave A Comment -->
                        <div class="leave-comment-area clearfix">
                            <div class="comment-form">
                                <h4 class="headline"><span id="rcount"></span> Comments</h4>

                                <div class="contact-form-area">
                                    <!-- Comment Form -->
                                    <div class="row">
										<div class="col-12">
											<div class="form-group">
												<textarea class="form-control" name="replyContent"
													id="replyContent" cols="30" rows="10" style="resize: none;"
													placeholder="Comment"></textarea>
											</div>
										</div>
										<div class="col-12">
											<button type="submit" class="btn alazea-btn "
												id="insertRbutton">Post Comment</button>
											<button type="submit" class="btn alazea-btn"
												id="updateRbutton">Update Comment</button>

										</div>

									</div>
                                </div>
                            </div>
                            <!-- Comment Area Start -->
							<div class="comment_area clearfix">
								<ol>
									<!-- Single Comment Area -->
									<li class="single_comment_area"></li>
								</ol>
							</div>

                        </div>

                    </div>
                </div>

                <!-- Blog Sidebar Area -->
                <div class="col-12 col-sm-9 col-md-4">
                    <div class="post-sidebar-area">

                        

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Author Widget -->
                            <div class="author-widget">
                                <div class="author-thumb-name d-flex align-items-center">
                                    <div class="author-thumb">
                                        <img src="resources/img/bg-img/29.jpg" alt="">
                                    </div>
                                    <div class="author-name">
                                        <h5>${boardInfo.boardWriter }</h5>
                                        <p>${boardInfo.email }</p>
                                    </div>
                                </div>
                                <p>자기소개서 하기</p>
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
				
				<c:choose>
					<c:when test="${boardInfo.boardWriter eq loginUser.userId }">
						<!-- Modal body -->
						<div class="modal-body">
							<div class="buttonContent">
								<button class="updateButton"
									onclick="location.href='moveUpdate.bo?boardNo=${boardInfo.boardNo}'" style="outline:none;">수정하기</button>
								<br>
								<form action="delete.bo" method="post">
									<input type="hidden" name="boardNo" value="${boardInfo.boardNo }">
									<button class="deleteButton" type="submit" style="outline:none;">삭제하기</button>
								</form>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- Modal body -->
						<div class="modal-body">
							<div class="buttonContent">
								<form action="moveReport.bo" method="post">
									<input type="hidden" name="boardNo" value="${boardInfo.boardNo }">
									<input type="hidden" name="userNo" value="${loginUser.userNo }">
									<button class="reportButton" style="outline:none;">신고하기</button>
								</form>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				
			
				

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
							<button type="button" class="close closeReply" data-dismiss="modal">&times;</button>
						</div>
							<!-- Modal body -->
							<div class="modal-body">
								<div class="replyBody">
									<input id="hiddenRno" type="hidden"> 
									<input id="hiddenRContent" type="hidden">
									<button type="button" class="updateRbutton" onclick="updateReply(this);" style="border: none; outline:none;">수정하기</button>
									<button type="button" class="deleteRbutton" onclick="deleteReply(this);" style="border: none; outline:none;">삭제하기</button>
								</div>
							</div>		
					 </div>
				</div>
			</div>

    <jsp:include page="../common/footer.jsp"></jsp:include>

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
                   console.log("하이루"+result[i].replyWriter);
                   console.log("유저아이디확인");
                   var loginUserId = "${loginUser.userId}";
                   console.log(loginUserId);
                   var wraperDiv = $("<div class='comment-wrapper d-flex'></div>");
                   var profileDiv = $("<div class='comment-author'></div>");
                   var commentContent = $(" <div class='comment-content'></div>");
                   var inConmmentContent = $("<div class='d-flex align-items-center justify-content-between'></div>");
                   
                   var profileStr = $("<img>");
                   var replyWriterStr = $("<h5></h5>");
                   var replyCreateDate = $("<span class='comment-date'></span>");
                   var replyContentStr = $("<p id='originContent'></p>");
                  
                   if(loginUserId == result[i].replyWriter){
                  	   var replyModalBtn = $("<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;' onclick='giveRno(this);'><img src='resources/img/icon/dots.png' id='replyImg' style='width: 20px; height: 20px;'></button>");
                   }else{
                	   var replyModalBtn = $("<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;' onclick='giveRno(this);'></button>");
                   }
                   var contentBetweenDiv = $("<div></div>");
                   var hiddenReplyNo = $("<input>");
                   
                   hiddenReplyNo.attr("type","hidden").attr("name","replyNo").attr("value",result[i].replyNo);  //하나하나 replyNo를 숨겨서 controller로 보내줌
                   profileStr.attr("src",result[i].profile);
                   replyWriterStr.text(result[i].replyWriter);
                   //replyCreateDate.text(result[i].createDate);
                   replyCreateDate.text(new Date(result[i].createDate).toLocaleString());
                   replyContentStr.text(result[i].replyContent);
                   
                   
                   profileDiv.append(profileStr);
                   contentBetweenDiv.append(hiddenReplyNo).append(replyCreateDate).append(replyModalBtn)
                   inConmmentContent.append(replyWriterStr).append(contentBetweenDiv)
                   //승민 추가-------------------
                   if(loginUserId == result[i].replyWriter){
	                   commentContent.append(inConmmentContent).append(replyContentStr);
                	   
                   }else {
                	   //승민 추가-------
                       var replyReportDiv = $("<div class='reply-report-div'></div>");
                       var replyReportBtn = $("<p class='reply-report-btn' onclick='reportReply(this);' '></p>").text("신고");
                       replyReportDiv.append(replyReportBtn);
                       //-------------
                	   commentContent.append(inConmmentContent).append(replyContentStr).append(replyReportDiv);
                   }
                   //승민추가 끝 ---------------------
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
                    //giveRno(el);
            },
            error: function(){
                console.log("통신오류");
            }
        });
    }
    
    
    //댓글모달창을 클릭할때 숨겨진 input요소에 클릭한 각각의 값 부여해주기
    function giveRno(el) {
        //console.log($(el).parents().children().eq(0).val());  //$(el)은 모달버튼 <button data-target='#replyModal'> 이것을 나타냄
        var giveRno = $(el).parents().children().eq(0).val();
        console.log("giveRno : "+giveRno);
        
        var giveRContent = $(el).parents().parents().parents().children().eq(1).text();
        console.log(giveRContent);

              
        $("#hiddenRno").attr("value",giveRno);
        $("#hiddenRContent").attr("value",giveRContent);
        
    } 
    
    
    
    


   
        $("#insertRbutton").click(function(){
            $.ajax({
                url: "insertReply.bo",
                data: {
                    replyContent : $("#replyContent").val(),
                    replyWriter : "${loginUser.userNo}", //""을 써야 얘가 string형태임을 알수있음 안쓰면 모름
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
        });	


   $("#updateRbutton").click(function(){
       var refRno = $("#hiddenRno").val();
        $.ajax({
            url: "updateReply.bo",
            data : {
                replyNo : refRno,
                replyContent : $("#replyContent").val()
            },
            success: function(result){
                if(result>0){
                    swal("Good job!", "댓글 수정 성공!", "success");
            
                }else{
                    swal("error!", "이용에 불편을 줘서 죄송합니다.");
                }
                replyList();
                $("#replyContent").val("");
            },
            error : function(){
                console.log("통신오류");
            }
        });
});

    
    


    function deleteReply(el) {
       
       var refRno = $("#hiddenRno").val(); //this함수를 사용했기에 클릭한 댓글rno가 뽑아짐
       
       $.ajax({
           url: "deleteReply.bo",
           data: {
               replyNo : refRno
               },
           success: function(result){
               if(result>0){
                    swal("Good job!", "댓글 삭제 성공!", "success");

                }else{
                    swal("error!", "이용에 불편을 줘서 죄송합니다.");
                }
               replyList();
           },
           error: function(){
               console.log("통신오류");
           }
       }); 
       $(".closeReply").click();
   }
    
    
    
    function updateReply(el){
        var refRno = $("#hiddenRno").val();
        console.log(refRno); //내가 클릭한 댓글의 replyNo가 나옴
        //console.log(giveRno(el)); //이렇게 해도 내가 클릭한 댓글의 replyNo가 나옴
        
        var originContent=$("#hiddenRContent").val();
        console.log(originContent);
        
        var contentArea = document.getElementById("replyContent");
        contentArea.innerText = originContent;
        
        
        //모달창에서 수정하기버튼을 누르면 기존등록버튼 사라지고 수정버튼이 보여지기
        $("#insertRbutton").css({"display":"none"});
        $("#updateRbutton").css({"display":"block"});
        
        //이 방식은 안먹힘 id값이나 class값이 잘 바뀌고 버튼text도 잘바뀌었지만 그대로 등록기능만 적용됨
        //$(".insertRbutton").addClass("updateRbutton");
        //$(".insertRbutton").removeClass("insertRbutton").text("Update Comment");

        //var buttonChange = document.getElementById("insertRbutton");
        //console.log(buttonChange);
        //$(buttonChange).attr("id","updateRbutton").text("Update Comment");

        $(".closeReply").click();

       
    }
	//승민 추가-----------
	function reportReply(el){
		var replyNo = $(el).parent().siblings("div").find("input[name='replyNo']").val();
		location.href = "moveReplyReport.bo?replyNo="+replyNo;
	}
	
</script>



       <script>
   //상세게시물에 댓글 불러오기
   $(function(){   //페이지에 들어오는 순간 실행되는 함수 새로고침될때마다도 실행 함부로 많이쓰는거 x
       replyList();
   });
</script>

   
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