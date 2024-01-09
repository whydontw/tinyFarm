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

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- alert창 꾸미기 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.updateButton, .deleteButton, .updateRbutton, .deleteRbutton,
	.reportButton {
	width: 100%;
	height: 50px;
	border: none;
	outline: none;
	background-color: white;
}

.updateButton:hover, .deleteButton:hover, .updateRbutton:hover,
	.deleteRbutton:hover, .reportButton:hover {
	width: 100%;
	height: 50px;
	border: none;
	outline: none;
	background-color: #ebebe9;
}

#updateRbutton {
	display: none;
}

#replyBtn, .boardAllModal {
	border: none;
	outline: none;
	background-color: white;
}

.modal-content {
	margin-top: 300px;
}

#originContent {
	width: 600px;
	height: auto;
	word-wrap: break-word;
}

.reply-report-btn {
	margin-right: 10px;
	color: #b7b7b7;
}

.reply-report-btn:hover {
	cursor: pointer;
	color: #FF6C30;
}

.reply-report-div {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.post-content {
	width: 800px;
	word-wrap: break-word;
}

.ffbtn {
	display: flex;
	justify-content: space-around;
}
/*
.modal-content {
	margin: 0px;
}

.modal {
	z-index: 1050;
}
*/
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
			<h2>이야기 공간</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="moveList.bo">이야기해요</a></li>
							<li class="breadcrumb-item active" aria-current="page">이야기
								공간</li>
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
									<a href="#" id="boardCreateDate"><i class="fa fa-clock-o"
										aria-hidden="true"></i></a> <a href="#"><i class="fa fa-user"
										aria-hidden="true"></i> ${boardInfo.boardWriter }</a>
									<!-- 수정 /삭제 버튼  -->
									<button type="button" data-toggle="modal"
										data-target="#myModal" class="boardAllModal"
										style="outline: none;">
										<img src="resources/img/icon/dots.png"
											style="width: 25px; height: 25px;">
									</button>
								</div>
								<div class="post-thumbnail mb-30">
									<img src="${boardInfo.titleImg }" alt="">
								</div>
								<p>${boardInfo.boardContent }</p>
							</div>
						</div>

						<!-- 해시태그 -->
						<div
							class="post-tags-share d-flex justify-content-between align-items-center">
							<!-- Tags -->
							<ol
								class="popular-tags d-flex align-items-center flex-wrap hashTagOl">
								<li><span>Tag:</span></li>
							</ol>


						</div>


						<!-- 댓글창 -->
						<div class="leave-comment-area clearfix">
							<div class="comment-form">
								<h4 class="headline">
									<span id="rcount"></span> Comments
								</h4>

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
										<img src="${boardInfo.profile}" alt="${boardInfo.profile}">
									</div>
									<div class="author-name">
										<h5>${boardInfo.userName }</h5>
										<p>${boardInfo.email }</p>
									</div>
								</div>
								<br>
								<p>
									"안녕하세요! 나는 '${boardInfo.userName}'이라고 해요.<br>여러분과 소통하며 새로운
									친구들을 만나고 싶어요!"
								</p>



								<c:choose>
									<c:when test="${isFollow eq 1}">
										<form action="deleteFollow.fw">
											<input type="hidden" name="userNo"
												value="${loginUser.userNo }"> <input type="hidden"
												name="followingId" value="${boardInfo.boardWriter}">
											<input type="hidden" name="boardNo"
												value="${boardInfo.boardNo}">


											<c:choose>
												<c:when test="${loginUser.userId eq boardInfo.boardWriter }">

												</c:when>
												<c:otherwise>
													<div class="ffbtn">
														<button type="submit" class="btn alazea-btn"
															id="unfollowBtn">unfollow</button>
														<img src="resources/img/icon/profileModal.png"
															id="profileModal" style="width: 50px; height: 50px;">
													</div>
												</c:otherwise>
											</c:choose>
										</form>
									</c:when>
									<c:otherwise>
										<form action="insertFollow.fw">
											<input type="hidden" name="userNo"
												value="${loginUser.userNo }"> <input type="hidden"
												name="followingId" value="${boardInfo.boardWriter}">
											<input type="hidden" name="boardNo"
												value="${boardInfo.boardNo}">

											<c:choose>
												<c:when test="${loginUser.userId eq boardInfo.boardWriter }">

												</c:when>
												<c:otherwise>
													<div class="ffbtn">
														<button type="submit" class="btn alazea-btn"
															id="followBtn">follow</button>
														<img src="resources/img/icon/profileModal.png"
															id="profileModal" style="width: 50px; height: 50px;">
													</div>
												</c:otherwise>
											</c:choose>

										</form>
									</c:otherwise>
								</c:choose>






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
									onclick="location.href='moveUpdate.bo?boardNo=${boardInfo.boardNo}'"
									style="outline: none;">수정하기</button>
								<br>
								<form action="delete.bo" method="post">
									<input type="hidden" name="boardNo"
										value="${boardInfo.boardNo }">
									<button class="deleteButton" type="submit"
										style="outline: none;">삭제하기</button>
								</form>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- Modal body -->
						<div class="modal-body">
							<div class="buttonContent">
								<form action="moveReport.bo" method="post">
									<input type="hidden" name="boardNo"
										value="${boardInfo.boardNo }"> <input type="hidden"
										name="userNo" value="${loginUser.userNo }">
									<button class="reportButton" style="outline: none;">신고하기</button>
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
						<input id="hiddenRno" type="hidden"> <input
							id="hiddenRContent" type="hidden">
						<button type="button" class="updateRbutton"
							onclick="updateReply(this);" style="border: none; outline: none;">수정하기</button>
						<button type="button" class="deleteRbutton"
							onclick="deleteReply(this);" style="border: none; outline: none;">삭제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/memberModal.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- 해시태그 -->
	<script>
    var hashTags = ${boardInfo.hashTag};
    
	  for (var i = 0; i < hashTags.length; i++) {
		    var liArea = $("<li></li>");
		    var aArea = $("<a id='hashTag'></a>");	  
		  
	        var value = hashTags[i].value;
	        console.log(value); //하나하나 콘솔에 잘 찍힘
	        
	        
	        
	        aArea.text(hashTags[i].value);
	        liArea.append(aArea);

	        $(".hashTagOl").append(liArea);       
	    }
	</script>



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
                   //console.log("하이루"+result[i].replyWriter);
                  // console.log("유저아이디확인");
                   var loginUserId = "${loginUser.userId}";
                   //console.log(loginUserId);
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
                   replyContentStr.text(result[i].replyContent);
                   
                   
                   profileDiv.append(profileStr);
                   contentBetweenDiv.append(hiddenReplyNo).append(replyCreateDate).append(replyModalBtn)
                   inConmmentContent.append(replyWriterStr).append(contentBetweenDiv)
                   
                   
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
			        replyCreateDate.text(msg);
                   
                   
                   
                   
                   
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
        //console.log("giveRno : "+giveRno);
        
        var giveRContent = $(el).parents().parents().parents().children().eq(1).text();
        //console.log(giveRContent);

              
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
	
   //댓글수정버튼 클릭시 다시 댓글게시버튼으로 바꾸기 
	$("#updateRbutton").click(function(){
		$("#updateRbutton").hide();
		$("#insertRbutton").show();
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
        var originContent=$("#hiddenRContent").val();
        var contentArea = document.getElementById("replyContent");
        contentArea.innerText = originContent;
        
        //모달창에서 수정하기버튼을 누르면 기존등록버튼 사라지고 수정버튼이 보여지기
        $("#insertRbutton").css({"display":"none"});
        $("#updateRbutton").css({"display":"block"});
        
        $(".closeReply").click();
        //$('.updateRbutton').modal('hide')
        //$('.updateRbutton').off()

       
    }
	//승민 추가-----------
	function reportReply(el){
		var replyNo = $(el).parent().siblings("div").find("input[name='replyNo']").val();
		location.href = "moveReplyReport.bo?replyNo="+replyNo;
	}
	
	
	//팔로우버튼 클릭시 언팔로우 버튼으로 변경
	$("#followBtn").click(function(){
		var followBtn= $("#followBtn");
		followBtn.css("display","none");
	});
	
	//시간표시
	function time(){
			var today = new Date();
	        var dateString = "${boardInfo.createDate}"; 
	        var dateParts = dateString.split(/[- :]/);
	        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]); 

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

	       // console.log(msg);
	        //document.getElementById("boardCreateDate").innerText = msg;
	        $("#boardCreateDate").append(msg)
		
		
	}
	
	
	
	
	 // 클릭 이벤트를 추가하여 해당 followingId를 전달(회원정보 모달창 띄우기)
	// $("#profileModal").click(function(){
    $("#profileModal").on('click', function () {
    // 클릭한 행에서 followingId 값을 가져옴
        let userId = "${boardInfo.boardWriter}";

    	
        // 모달 열기 및 정보 표시 함수 호출
        $.ajax({
            url: "getFollowingInfo.me",
            type: 'post',
            data: { followingId: userId }, //클릭한 회원 아이디로 정보 불러오기
            success: function (m) { 
                if(m.userId != null){//아이디가 존재하면
                    if(m.changeName == null){ //유저 프로필 사진 있으면
                        $("#profileImage").attr("src","resources/profile.jpg");
                    }else{//없으면 기본사진
                        $("#profileImage").attr("src",m.changeName);
                    }
                $("#userId").text(m.userId); //모달창에 아이디값 넣기
                $("#userName").text(m.userName); //이름
                $("#userGrade").text(m.grade); //등급
                //팔로우 여부 체크
                $(function(){
                    let followingId = $("#userId").text();
                    let userNo = ${loginUser.userNo};
                    $.ajax({
                        url : "followChk.me",
                        data : {
                            followingId : followingId,
                            userNo : userNo
                        },
                        success : function(result){
                            if(result=='YY'){
                                //팔로우된 상태라면 버튼 바꿔주기
                                $("#followBtn").text("팔로우취소").attr("onclick","unfollow();");
                            }
                        },error : function(){
                            console.log("팔로우 확인 실패");
                        }
                    });
                });
                //모달창 실행
                $(".btn1").click();
                }
            }, error: function () {
                console.log('following modal ajax 통신실패');
             }
        });
    });
	
</script>



	<script>
   //상세게시물에 댓글 불러오기
   $(function(){   //페이지에 들어오는 순간 실행되는 함수 새로고침될때마다도 실행 함부로 많이쓰는거 x
       replyList();
   	   time();
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