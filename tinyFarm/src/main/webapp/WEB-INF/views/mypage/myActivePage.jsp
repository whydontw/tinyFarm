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
    <title>나의 활동내역</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
	<link rel="stylesheet" href="resources/jisu/css/mypage.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<style>
		table {
			width: 100%;
			height: 100%;
			text-align: center;
		    box-shadow: 0 2px 5px rgba(0,0,0,.25);
		    border-radius: 5px;
		}
		thead {
	        font-weight: bold;
	        color: #fff;
        	background-color: #70c745;
        }
		
		#boardList>table thead tr:hover,
		#replyList>table thead tr:hover,
		#followingTableContainer>table thead tr:hover,
		#followerTableContainer>table thead tr:hover{ 
			cursor: default; 
		}
		#boardList>table tbody tr:hover,
		#replyList>table tbody tr:hover,
		#followingTableContainer>table tbody tr:hover,
		#followerTableContainer>table tbody tr:hover{ 
			cursor: pointer; 
			background-color: #e9f0e6;
		}
		.page-item.current-page a{
		    background-color: #a39485;
		}
		.modal-dialog{
			width: 80%;
			height: 50%;
		}
		.modal-content input{
			text-align: center;
			align-content: center;
			width: 200px;
		}
		.modal-content img{
			width: 40%;
			height: 40%;
			
		}
	</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>활동내역</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="active.me">활동내역</a></li>
						
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
    <!-- 활동내역 -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-8">
                    <div class="row">
                    	<div id="boardList">
                    		<div class="widget-title">
                                <h4>게시글</h4>
                            </div>
                            <!-- 게시글 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">글번호</td>
                    					<td style="width: 50%">제목</td>
                    					<td style="width: 20%">작성일</td>
                    					<td style="width: 10%">조회수</td>
                    					<td style="width: 10%">좋아요</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    				<!-- 게시글 리스트 영역 -->
                    			</tbody>
                    		</table>
                    		<!-- 게시글 페이징바 -->
                    		<div id="boardPageArea" class="pagingArea">
								<ul class="pagination" id="boPage">
									<!-- 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    	
                    	<div id="replyList">
                    		<div class="widget-title">
                                <h4>댓글</h4>
                            </div>
                            <!-- 댓글 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">글번호</td>
                    					<td style="width: 60%">댓글내용</td>
                    					<td style="width: 20%">작성일</td>
                    					<td style="width: 10%">좋아요</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    				<!-- 댓글 리스트 영역 -->
                    			</tbody>
                    		</table>
                    		<!-- 댓글 페이징바 -->
                    		<div id="replyPageArea" class="pagingArea">
								<ul class="pagination" id="rePage">
									<!-- 댓글 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    </div>
                </div>
                <!-- 팔로우목록 -->
                <div class="col-12 col-md-4">
                    <div class="post-sidebar-area">
                        <div class="single-widget-area">
                            <div id="follow">
                            <div class="widget-title">
                                <h4>Follow List</h4>
                            </div>
                            	<div class="pagination-container">
                            		<div id="fiPrePage">
                            		</div>
        								<div id="followingTableContainer">
		                            	 <table id="following">
											<thead>
												<tr><td>Following List</td></tr>
											</thead>
											<tbody>
											</tbody>
										 </table>
										</div>
									<div id="fiNextPage">
										
									</div>
   								</div>
   								<br>
   								<div class="pagination-container">
        							<div id="fwPrePage">
                            		</div>
        								<div id="followerTableContainer">
		                            	 <table id="follower">
											<thead>
												<tr><td>Follower List</td></tr>
											</thead>
											<tbody>
											</tbody>
										 </table>
										</div>
									<div id="fwNextPage">
										
									</div>
   								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 팔로잉 모달 -->
    <div class="modal fade" id="followModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원정보</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                    <!-- Modal body -->
                    <div class="modal-content" id="userinfo">
                        <div id="center">
                        	<div class="col-12 mb-4">
		                       	<img src="" id="followImg">
	                       		<label for="followId">아이디</label>
	                       		<input type="text" id="followId" class="form-control" readonly>
	                       		
                            	<label for="followName">이름</label>
                            	<input type="text" id="followName" class="form-control" readonly>
                            	
                        		<label for="followGrade">등급</label>
	                            <input type="text" id="followGrade" class="form-control" readonly>
                        	</div>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                       <button class="btn-click" onclick="showDiary();">일지보기</button>
                        <button class="btn-click" onclick="unfollow();">팔로우끊기</button>
                    </div>
            </div>
        </div>
    </div>
    
    <script>
    	let myId = "${loginUser.userId}"; //로그인한 회원 아이디
	    let curPage = 0;
	    let startPage = 0;
	    let endPage = 0;
		let maxPage0;
	    	
		// 게시글 테이블의 날짜 포맷팅
		function formatDateForBoard(dateString) {
		    return moment(dateString).format("YYYY-MM-DD");
		}

		// 댓글 테이블의 날짜 포맷팅
		function formatDateForReply(dateString) {
		    return moment(dateString).format("YYYY-MM-DD");
		}
		
    	//게시글 영역
	    function loadBoardPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "boardPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.bPi.currentPage;
	    			startPage = result.bPi.startPage;
	    			endPage = result.bPi.endPage;
	    			maxPage = result.bPi.maxPage;
	    			let bList = result.bList;
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    		    let nStr = ""; //다음페이지
	    		    
	    			//게시글 리스트 추가해주기위한 작업
	    			if(bList.length == 0){
	    				str += "<tr>"
		    				+ "<td colspan='5'>게시글이 존재하지 않습니다.</td>"
		    				+ "</tr>";
	    			}else{
		    			$.each(bList, function(key, b){
		    				let date = new Date(b.createDate);
		    				str += '<tr onclick="location.href=\'detail.bo?boardNo=\' + '+b.boardNo+'">'  //클릭시 해당 게시글로 이동
			    				+ "<td>"+b.boardNo+"</td>"
			    				+ "<td>"+b.boardTitle+"</td>"
			    				+ "<td>"+formatDateForBoard(b.createDate)+"</td>"
			    				+ "<td>"+b.count+"</td>"
			    				+ "<td>"+b.likeCount+"</td>"
			    				+ "</tr>";
		    			});
	    			}
	    			$("#boardList tbody").html(str); //게시글 리스트 띄워주기
	    			
	    			//페이징 처리
	    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
	    			}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+(startPage-5)+')">이전</a></li>';
	    			}
		    		for(var i=startPage; i<endPage+1; i++){
		    			if (i==curPage) { //현재페이지일때 current-page class 추가
		    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+i+')">'+i+'</a></li>';
		    		    } else {
		    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+i+')">'+i+'</a></li>';
		    		    }
		    		}
		    		if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
		    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
		    		}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+(startPage+5)+')">다음</a></li>';
		    		}
	    			$("#boardPageArea>#boPage").html(pStr);
	    		},error : function(){
	    			console.log("내가 쓴 글 ajax 통신 실패");
	    		}
	    	});
	    }
	    
	    //댓글 영역
	    function loadReplyPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "replyPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.rPi.currentPage;
	    			startPage = result.rPi.startPage;
	    			endPage = result.rPi.endPage;
	    			maxPage = result.rPi.maxPage;
	    			let rList = result.rList;
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    			
	    			//게시글 리스트 추가해주기위한 작업
	    			if(rList.length == 0){
	    				str += "<tr>"
		    				+ "<td colspan='6'>댓글이 존재하지 않습니다.</td>"
		    				+ "</tr>";
	    			}else{
		    			$.each(rList, function(key, r){
		    				str += '<tr onclick="location.href=\'detail.bo?boardNo=\' + '+r.refBno+'">'
			    				+ "<td>"+r.refBno+"</td>"
			    				+ "<td>"+r.replyContent+"</td>"
			    				+ "<td>"+formatDateForReply(r.createDate)+"</td>"
			    				+ "<td>"+r.likeCount+"</td>"
			    				+ "</tr>";
		    			});
	    			}
	    			$("#replyList tbody").html(str); //게시글 리스트 띄워주기
	    			
	    			//페이징 처리
	    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
	    			}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+(startPage-5)+')">이전</a></li>';
	    			}
	    			
	    			for (var i=startPage; i<endPage+1; i++) {
		    			if (i==curPage) { //현재페이지일때 current-page class 추가
		    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+i+')">'+i+ '</a></li>';
		    		    } else {
		    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+i+')">'+i+'</a></li>';
		    		    }
	    			}
		    			
		    		if(endPage>=maxPage){//마지막페이지가 최대페이지보다 크면 다음버튼 비활성
		    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
		    		}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+(startPage+5)+')">다음</a></li>';
	    			}
		    		
	    			$("#replyPageArea>#rePage").html(pStr);
	    		},error : function(){
	    			console.log("내가 쓴 댓글 ajax 통신 실패");
	    		}
	    	});
	    }
	    
	  	//팔로잉 영역
	    function loadFollowingPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "followingPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.fiPi.currentPage;
	    			startPage = result.fiPi.startPage;
	    			endPage = result.fiPi.endPage;
	    			maxPage = result.fiPi.maxPage;
	    			let fiList = result.fiList;
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    		    let nStr = ""; //다음페이지
	    			//게시글 리스트 추가해주기위한 작업
	    			if(fiList.length == 0){
	    				str += "<tr>"
		    				+ "<td>친구를 만들어보세요!</td>"
		    				+ "</tr>";
	    			}else{ 
		    			$.each(fiList, function(key, fi){
		    				str += '<tr onclick="$(\'#followModal\').modal();"><td>'+fi.followingId+'</td></tr>';
		    			});
	    			}
	    				
	    			$("#followingTableContainer tbody").html(str); //팔로잉 리스트 띄워주기
	    			
	    			//페이징 처리
	    			if(startPage == maxPage){ //시작과 최대가 같으면
	    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
	    				nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
						 	
	    			}else{
		    			if(curPage==1){ //현재페이지랑 시작페이지 같으면
		    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
		    			}else{
		    				pStr += '<a href="javascript:void(0)" onclick="loadFollowingPage('+(curPage-1)+')">&lt;</a>';
		    			}
		    			
			    		if(curPage==maxPage){ //현재페이지랑 끝페이지 같으면
			    			nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
			    		}else{
			    			nStr += '<a href="javascript:void(0)" onclick="loadFollowingPage('+(curPage+1)+')">&gt;</a>';
			    		}
	    			}
	    			
	    			$("#fiPrePage").html(pStr);
	    			$("#fiNextPage").html(nStr);
	    				
	    			
	    			// 모달 열기 및 정보 표시 함수
	    			function openFollowingModal(followingId) {
	    			    // 모달 열기
	    			    $.ajax({
	    			        url: "getFollowingInfo.me",
	    			        type: 'post',
	    			        data: { followingId: followingId },
	    			        success: function (m) {
	    			        	if(m.userId != null){
	    			        		if(m.changeName != null){ //유저 프로필 사진
		    			        		$("#followImg").attr("src",m.changeName);
	    			        		}else{ //없으면 기본사진
	    			        			$("#followImg").attr("src","resources/profile.jpg");
	    			        		}
	    			           	 	$("#followId").val(m.userId); //아이디
	    			           	 	$("#followName").val(m.userName); //이름
	    			           	 	$("#followGrade").val(m.grade); //등급
	    			           	 	
	    			        	}
	    			        },
	    			        error: function () {
	    			            console.log('following modal ajax 통신실패');
	    			        }
	    			    });
	    			    
	    			}

	    			// 클릭 이벤트를 추가하여 해당 followingId를 전달
	    			$(document).on('click', '#followingTableContainer tbody tr', function () {
	    			    // 클릭한 행에서 followingId 값을 가져옴
	    			    var followingId = $(this).find('td:first').text();

	    			    // 모달 열기 및 정보 표시 함수 호출
	    			    openFollowingModal(followingId);
	    			});
	    		},error : function(){
	    			console.log("팔로잉 ajax 통신 실패");
	    		}
	    	});
	    }
	  	
	  	//팔로워 영역
	    function loadFollowerPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "followerPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.fwPi.currentPage;
	    			startPage = result.fwPi.startPage;
	    			endPage = result.fwPi.endPage;
	    			maxPage = result.fwPi.maxPage;
	    			let fwList = result.fwList;
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    		    let nStr = ""; //다음페이지
	    			//게시글 리스트 추가해주기위한 작업
	    			if(fwList.length == 0){
	    				str += "<tr>"
		    				+ "<td >친구를 만들어보세요!</td>"
		    				+ "</tr>";
	    			}else{
		    			$.each(fwList, function(key, fw){
		    				str += '<tr onclick="$(\'#followModal\').modal();"><td>'+fw.userId+'</td></tr>';
		    			});
	    			}
	    			
	    			$("#followerTableContainer tbody").html(str); //팔로잉 리스트 띄워주기
	    			
	    			//페이징 처리
	    			if(startPage == maxPage){ //시작과 최대가 같으면
	    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
	    				nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
						 	
	    			}else{
		    			if(curPage==1){ //현재페이지랑 시작페이지 같으면
		    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
		    			}else{
		    				pStr += '<a href="javascript:void(0)" onclick="loadFollowingPage('+(curPage-1)+')">&lt;</a>';
		    			}
		    			
			    		if(curPage==maxPage){ //현재페이지랑 끝페이지 같으면
			    			nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
			    		}else{
			    			nStr += '<a href="javascript:void(0)" onclick="loadFollowingPage('+(curPage+1)+')">&gt;</a>';
			    		}
	    			}
	    			
	    			$("#fwPrePage").html(pStr);
	    			$("#fwNextPage").html(nStr);
	    			
	    			// 모달 열기 및 정보 표시 함수
	    			function openFollowerModal(userId) {
	    			    // 모달 열기
	    			    $.ajax({
	    			        url: "getFollowerInfo.me",
	    			        type: 'post',
	    			        data: { followerId: userId },
	    			        success: function (m) {
	    			        	if(m.userId != null){
	    			        		if(m.changeName != null){ //유저 프로필 사진
		    			        		$("#followImg").attr("src",m.changeName);
	    			        		}else{ //없으면 기본사진
	    			        			$("#followImg").attr("src","resources/profile.jpg");
	    			        		}
	    			           	 	$("#followId").val(m.userId); //아이디
	    			           	 	$("#followName").val(m.userName); //이름
	    			           	 	$("#followGrade").val(m.grade); //등급
	    			        	}
	    			        },
	    			        error: function () {
	    			            console.log('follower modal ajax 통신실패');
	    			        }
	    			    });
	    			}
	    			
	    			// 클릭 이벤트를 추가하여 해당 followingId를 전달
	    			$(document).on('click', '#followerTableContainer tbody tr', function () {
	    			    // 클릭한 행에서 followingId 값을 가져옴
	    			    var followerId = $(this).find('td:first').text();

	    			    // 모달 열기 및 정보 표시 함수 호출
	    			    openFollowerModal(followerId);
	    			});
	    				
	    		},error : function(){
	    			console.log("팔로워 ajax 통신 실패");
	    		}
	    	});
	    }

	    $(function(){ //초기 페이지 로딩은 1페이지여야 한다
	    	loadBoardPage(1);
	    	loadReplyPage(1);
	    	loadFollowingPage(1);
	    	loadFollowerPage(1);
    	});
	    
	    //팔로우 취소(modal창 UI나오면 합치기 !!)
	    function unfollow(){
	    	let alert = window.confirm("팔로우를 취소하시겠습니까?\n나중에 다시 팔로우 할 수 있습니다.");
	    	let followingId= $("#followId").val();
	    	if(alert){
				let form = document.createElement("form");
				let obj; //넘겨받을 값 준비
				//팔로잉 유저 아이디
				obj = document.createElement("input");
				obj.setAttribute("type","hidden");
				obj.setAttribute("name","followingId");
				obj.setAttribute("value",followingId);
				//폼 형식 갖추기
				form.appendChild(obj);
				form.setAttribute("method","post");
				form.setAttribute("action","unfollow.me");
				//body부분에 폼 추가
				document.body.appendChild(form);
				//전송!
				form.submit();
	    	}
	    }
	    
	    function showDiary(){
	    	let followingId= $("#followId").val();
	    	let alert = window.confirm(followingId+"님의 영농일지를 구경하시겠습니까?");
	    	let form = document.createElement("form");
			let obj; //넘겨받을 값 준비
	    	
	    	if(alert){//예 누를시
	    		obj = document.createElement("input");
				obj.setAttribute("type","hidden");
				obj.setAttribute("name","followingId");
				obj.setAttribute("value",followingId);
				//폼 형식 갖추기
				form.appendChild(obj);
				form.setAttribute("method","post");
				form.setAttribute("action","follow.di");
				//body부분에 폼 추가
				document.body.appendChild(form);
				//전송!
				form.submit();
	    		
	    	}
	    	
	    }
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