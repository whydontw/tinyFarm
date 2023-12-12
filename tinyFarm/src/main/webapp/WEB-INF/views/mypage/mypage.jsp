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
    <!-- Title -->
    <title>마이페이지</title>
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
		
		#sub {
        list-style-type: none;
        display: none;
	    }
	
	    #navi:hover #sub {
	        display: block;
	        position: absolute;
	        float: right;
	        border: 1px solid red;
	    }
	
	    #sub li {
	        display: none;
	    }
	
	    #navi:hover #sub li {
	        display: block;
	    }
		
		
		.myPageMain{
			border: 1px solid grey;
            width: 100%;
            height: 100%;
            margin: auto;
        }
        .myPageMain a{
            text-decoration: none;
            color: black;
        }
		#updateMe,#myDiary,#myActive,#myTrade{
            border: 1px solid grey;
            width: 25%;
            height: 25%;
            text-align: center;
            font-size: 40px;
            margin: auto;
        }
        
	</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>마이페이지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ul class="breadcrumb" id="navi">
							<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i>Home</a></li>
							<li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
								<ol class="breadcrumb" id="sub">
									<li class="breadcrumb-item"><a href="update.me">회원 정보 수정</a></li>
									<li class="breadcrumb-item"><a href="diary.me">영농일지</a></li>
									<li class="breadcrumb-item"><a href="active.me">활동내역</a></li>
									<li class="breadcrumb-item"><a href="trade.me">거래내역</a></li>
								</ol>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-8">
                    <div class="row">
                        <div class="myPageMain">
                            <div id="updateMe">
                                <a href="update.me">정보수정</a> <br>
                                <img alt="update-icon" src="resources/jisu/img/update-icon.png">
                            </div>
                            <div id="myDiary">
                                <a href="diary.me">영농일지</a> <br>
                                <img alt="diary-icon" src="resources/jisu/img/diary-icon.png">
                            </div>
                            <div id="myActive">
                                <a href="active.me">활동내역</a> <br>
                                <img alt="active-icon" src="resources/jisu/img/active-icon.png">
                            </div>
                            <div id="myTrade">
                                <a href="trade.me">거래내역</a> <br>
                                <img alt="trade-icon" src="resources/jisu/img/trade-icon.png">
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