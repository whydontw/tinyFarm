<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${contextPath }/resources/style.css">
</head>
<body>
     <%@include file="/WEB-INF/views/common/header.jsp" %>
	 <!-- ##### Product Area Start ##### -->
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>QnA</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i>QnA</a></li>
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i>QnA 작성</a></li>
						
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            
            
            	<div class="col-12 col-md-3">
		<div class="post-sidebar-area">

			<!-- ##### Single Widget Area ##### -->
			<!-- 검색창 -->
			<div class="single-widget-area">
				<form action="#" method="get" class="search-form">
					<input type="search" name="search" id="widgetsearch"
						placeholder="Search...">
					<button type="submit">
						<i class="icon_search"></i>
					</button>
				</form>
			</div>

			<!-- ##### Single Widget Area ##### -->
			<div class="single-widget-area">
				<!-- Author Widget -->
				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4>🌿 <b>QNA</b></h4>
							<!-- <p>Editor</p> -->
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
							<a href="qnaForm" class="post-title"><h6>QNA 작성</h6></a>
							<a href="qnaList" class="post-title"><h6>나의 QNA 내역</h6></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


				<div class="col-12 col-md-9">
					<div class="col-12">
						<div
							class=" d-flex flex-wrap align-items-center justify-content-between">
							<div class="mb-50">
								<p>
								<h5>
									<b>🌱 QNA 작성하기</b>
								</h5>
								</p>
							</div>
						</div>
						<div class="checkout_details_area clearfix">
							<form action="qnaEnroll" method="post">
								<input type="hidden" value="2" name="userNo">
								<div class="row">
									<div class="col-12 mb-4">
										<label for="phone_number">제목 *</label>
										<input type="text" class="form-control" id="qnaTitle" min="0" value="" name="qnaTitle" placeholder="제목을 입력해 주세요.">
									</div>
									<div class="col-md-6 mb-4">
										<label for="city">작성자</label> <input type="text" class="form-control" id="" value="user1" name="" disabled>
									</div>
									<div class="col-md-6 mb-4">
										<c:set var="nowTime" value="<%=new Date()%>" />
										<c:set var="createDate">
											<fmt:formatDate value="${nowTime}" pattern="yy/MM/dd" />
										</c:set>
										<label for="state">작성일자</label> <input type="text"
											class="form-control" id="" value="${createDate }" disabled>
									</div>
									<div class="col-md-12 mb-4">
										<label for="order-notes">문의사항 *</label>
										<textarea class="form-control" id="qnaContent" name="qnaContent" cols="30" rows="80" placeholder="문의할 내용을 입력해 주세요."></textarea>
									</div>
									<div class="col-12">
										<button type="submit" onclick="return qnaSend();" class="btn alazea-btn mt-15 float-right">Send Message</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    <script type="text/javascript">
    
    	function qnaSend(){
    		
    		if($("#qnaTitle").val() == null || $("#qnaTitle").val() == ""){
    			alert("제목을 입력해 주세요");
    			$("#qnaTitle").focus();
    			return false;
    		}
    		if($("#qnaContent").val() == null || $("#qnaContent").val() == ""){
    			alert("내용을 입력해 주세요");
    			$("#qnaContent").focus();
    			return false;
    		}
    		if(!confirm('문의 사항을 작성하시겠습니까?')){
    			return false;
    		}
    		return true;
    	}
    	
	</script>


    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${contextPath }/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${contextPath }/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath }/resources/js/active.js"></script>
</body>

</html>
