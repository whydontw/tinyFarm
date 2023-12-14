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
    <title>회원 정보 수정</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">


	<style>
		.boardHeader{
			display: flex;
		}
		.boardFooter{
			display: flex;
    		flex-direction: row;
    		justify-content: space-around;
		}
		.container h5{
			font-size: 30px;
			text-align: center;
		}
		#picText{
			position: absolute; 
			top: 90px; 
			left: 30px; 
			z-index: 2;
			margin-top: 14%;
		}
		#profileImg{
			 width: 300px;
			 height: 300px; 
			 border: 1px solid #ccc; 
			 margin-top: 45px; 
			 margin-bottom: 20px; 
			 margin-left: 200px; 
			 position: relative; 
			 overflow: hidden;
		}
		#reUpfile{
			cursor: pointer; 
			background-color:white; 
			border:none; 
			margin-left:260px
		}
		#file-name-display{
			position: absolute; 
			top: 70%; left: 50%; 
			transform: translateX(-50%); 
			text-align: center;
		}
		#enrollUserId{
			margin-top:10px
		}
		#checkResult{
			font-size:0.8em; 
			display :none;
		}
		#center{
			width: 70%;
			margin: auto;
			margin-top: 2%;
		}
	</style>


</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>회원 정보 수정</h2>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="update.me">회원 정보 수정</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
    <!-- 정보수정 -->
   <div class="checkout_area mb-100">
	        <div class="container">
	            <div class="row justify-content-between">
	                <div class="col-12 col-lg-7 mx-auto">
	                        <h5>정보 수정</h5>
	                        <form action="update.me" method="post" >
			                    <div class="checkout_details_area clearfix">
		                           <div class="row">
									    <label for="profile_picture" id="picText">프로필 사진</label>
									    <div id="profileImg">
									        <!-- 이미지 표시 -->
									       <img id="loadImg" src="${loginUser.changeName }">
									    </div>
									    <div>    
									        <!-- 파일 업로드 입력 폼 사진 수정이므로 reUpfile로 했습니다. -->
									        <input type="file" id="reUpfile" name="reUpfile">
									    </div>
									</div>
	                                <div class="col-12 mb-4">
	                                    <label for="enrollUserId">아이디</label>
	                                    <input type="text" class="form-control" id="userId" name="userId" value="${loginUser.userId }" readonly>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label>비밀번호</label>
	                                    <input type="button" class="form-control" data-toggle="modal" data-target="#updatePwdForm" value="수정하기">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="userName">이름</label>
	                                    <input type="text" class="form-control" id="userName" name="userName" value="${loginUser.userName }" required>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="email">이메일</label>
	                                    <input type="email" class="form-control" id="email" name="email" value="${loginUser.email }" required> 
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="phone">전화번호</label>
	                                    <input type="text" class="form-control" id="phone" name="phone" value="${loginUser.phone }">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="address">주소</label>
	                                    <input type="text" class="form-control" id="address" name="address" value="${loginUser.address }">
	                                </div>
	                            </div>
  								<div class="col-8">
                                    <button type="submit" class="btn alazea-btn mt-15">수정하기</button>
                                    <button type="button" class="btn alazea-btn mt-15" data-toggle="modal" data-target="#deleteForm">탈퇴하기</button>
                                </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>

	<!-- 비밀번호 수정 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="updatePwdForm">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                    <!-- Modal body -->
                    <div class="modal-content">
                        <div id="center">
                            <label for="userPwd" class="mr-sm-2">현재 비밀번호</label>
                            <input type="password" class="form-control" placeholder="현재 비밀번호 입력" id="userPwd" name="userPwd"> <br>
                            
                            <label for="updatePwd" class="mr-sm-2">변경할 비밀번호</label>
                            <input type="password" class="form-control" placeholder="변경할 비밀번호 입력" id="updatePwd" name="updatePwd"> <br>
                            
                            <label for="upPwdChk" class="mr-sm-2">비밀번호 확인</label>
                            <input type="password" class="form-control" placeholder="변경할 비밀번호 입력" id="upPwdChk" name="upPwdChk">
                            
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button class="btn btn-success" onclick="updatePwd();">수정하기</button>
                    </div>
            </div>
        </div>
    </div>


	<!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-content">
                        <div id="center">
                        	작성한 영농일지 : <span id="dList">1</span>개 <br>
                           	작성한 게시글 : <span id="bList">1</span>개 <br>
                           	작성한 댓글 : <span id="rList">2</span>개 <br>
                           	탈퇴시 모든 정보가 삭제됩니다. 정말로 탈퇴하시겠습니까?
                        <br>
                            <label for="deletePwd" class="mr-sm-2">비밀번호를 입력해주세요. </label>
                            <input type="password" class="form-control" placeholder="비밀번호 입력" id="deletePwd" name="userPwd"> <br>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<script>
		//프로필 사진 변경
		function loadImg(inputFile, num) {
			let profileImage = $("#loadImg");
			console.log(profileImage);
			if (inputFile.files.length == 1) { //파일이 등록되면(length = 1)
				let reader = new FileReader();
				//파일을 읽어줄 메소드 :  reader.readAsDataURL(파일)
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e) {
				}
			}else{
				profileImage = "${loginUser.originName}";
			}
		}
	       	
	    //비밀번호 변경    	
		function updatePwd(){
			let currentPwd = $("#userPwd").val(); //현재비밀번호
			let wantPwd =  $("#updatePwd").val(); //변경할비밀번호
			let chkPWd = $("#upPwdChk").val(); //변경비번확인
			
			let pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			
			//////div border 빨간색으로 오류표시 하기 (나중애)
			
			//변경비번 일치하지 않을경우
			if(wantPwd != chkPWd){
				alert("변경하실 비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if(!pwdReg.test(wantPwd)){
				alert("비밀번호는 영(대/소)문자,숫자,특수문자 호팜 8~16자로 설정해주세요.");
				return false;
			}
			
			//위 if문 다 통과시 변경 진행
		    $.ajax({
		    	url : "updatePwd.me",
		    	data : {
		    		currentPwd : currentPwd,
		    		updatePwd : wantPwd
		    	},
		    	type : "post",
		    	success : function(result){
		    		if(result=="YYYYY"){
		    			alert("비밀번호 변경 성공");
		    			//성공시 모달창 닫기
		    			$("#updatePwdForm").modal("hide");
		    		}else if(result=="NNNYY"){
				    	alert("현재 비밀번호가 일치하지 않습니다.");
		    			$("#updatePwdForm").modal("hide");
		    		}else{
		    			alert("비밀번호 변경 실패. 다시 시도해주세요.");
		    			$("#updatePwdForm").modal("hide");
		    		}
		    	},error : function(){
		    		console.log("비번변경 ajax 통신오류");
		    	}
		    });
		};
	</script>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

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