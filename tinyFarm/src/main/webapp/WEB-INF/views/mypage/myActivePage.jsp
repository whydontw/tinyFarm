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
		#boardList{
			width: 100%;
			height: 50%;
			border: 1px solid green;
		}
		#replyList{
			width: 100%;
			height: 50%;
			border: 1px solid blue;
			margin-top: 5%;
		}
		#follow{
			width: 100%;
			height: 100%;
			border: 1px solid red;
		
		}
		#follower{
			margin-top: 5%;
		}
		table{
			width: 100%;
			text-align: center
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
                    		<table border="1">
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">글번호</td>
                    					<td style="width: 50%">제목</td>
                    					<td style="width: 20%">작성일</td>
                    					<td style="width: 10%">조회수</td>
                    					<td style="width: 10%">좋아요</td>
                    				</tr>
                    			</thead>
                    			<tbody></tbody>
                    		</table>
                    	</div>
                    	
                    	<div id="replyList">
                    		<div class="widget-title">
                                <h4>댓글</h4>
                            </div>
                    		<table border="1">
                    			<thead>
                    				<tr>
                    					<td style="width: 15%">게시글번호</td>
                    					<td style="width: 70%">댓글내용</td>
                    					<td style="width: 15%">작성일</td>
                    				</tr>
                    			</thead>
                    			<tbody></tbody>
                    		</table>
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
                            	<!-- 
                            		조건문으로 팔로우 리스트 뽑은 후
                            		양옆페이징바 만들 수 있나..?
                            	 -->
                            	 <table border="1" id="following">
									<thead>
										<tr><td colspan="2">팔로잉</td></tr>
									</thead>
									<tbody>
										<tr><td>아이디</td></tr>
										<tr><td>아이디</td></tr>
										<tr><td>아이디</td></tr>
									</tbody>
								 </table>
								 <table border="1" id="follower">
									<thead>
										<tr><td colspan="2">팔로워</td></tr>
									</thead>
									<tbody>
										<tr><td>아이디</td></tr>
										<tr><td>아이디</td></tr>
										<tr><td>아이디</td></tr>
									</tbody>
								 </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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