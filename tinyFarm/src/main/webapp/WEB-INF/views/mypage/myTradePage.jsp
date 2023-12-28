<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>거래내역</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/jisu/css/tradePage.css">
<link rel="stylesheet" href="resources/style.css">
<script src="resources/jisu/js/myPage.js"></script>
<!-- date 
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->

<style>
.widget-title, .dateSearch {
	display: inline-block;
}

.dateSearch {
	width: 20%;
	float: right;
	text-align: right;
}

table.ui-datepicker-calendar {
	display: none;
}
.ui-datepicker-header.ui-widget-header.ui-helper-clearfix.ui-corner-all{
	background-color: #70c745;
}
.ui-datepicker-year,.ui-datepicker-month{
	-o-appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	text-align: center;
	font-weight: bold;
	border: none;
	width: 10%;
	background-color: #70c745;
}
.ui-datepicker-year>option ,.ui-datepicker-month>option {
	background-color: #fff;
}
.hasDatepicker{
	width: 50%;
}
#orderBtn , #sellBtn{
	width: 40px;
	height: 30px;
	border: none;
	background-color: #70c745;
	color: #fff;
	outline:none;
    display:inline;
    margin-left: -10px;
    box-sizing: border-box;

}
#orderBtn:hover, #sellBtn:hover{
	background-color: #66b83d;
}
.pagingArea{
	margin-top: 1%;
}
table{
border: none;
}

#orderDate, #sellDate{
	width:70%;
    height:30px;
    border: 1px solid #cdcdcd;
    font-size:1em;
    padding-left: 5px;
    font-style: oblique;
    display:inline;
    outline:none;
    box-sizing: border-box;
    color:black;
    }


</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>거래내역</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="trade.me">거래내역</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
    <!-- 활동내역 -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                    <div class="row">
                    	<div id="orderList">
                    		<div class="widget-title">
                                <h4>구매내역</h4>
                            </div>
                            <div class="dateSearch">
                            	<input type="text" id="orderDate" placeholder="검색날짜"> <input type="button" id="orderBtn" value="검색">
                            </div>
                            <!-- 구매목록 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">구매번호</td>
                    					<td style="width: 10%">제품이미지</td>
                    					<td style="width: 30%">제품명</td>
                    					<td style="width: 10%">가격</td>
                    					<td style="width: 10%">결제수단</td>
                    					<td style="width: 10%">판매자</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    			</tbody>
                    		</table>
                    		<!-- 구매목록 페이징바 -->
                    		<div id="orderPageArea" class="pagingArea">
								<ul class="pagination" id="orderPage">
									<!-- 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    	
                    	<div id="sellList">
                    		<div class="widget-title">
                                <h4>판매내역</h4>
                            </div>
                            <div class="dateSearch">
                            	<input type="text" id="sellDate" placeholder="검색날짜"> <input type="button" id="sellBtn" value="검색">
                            </div>
                            <!-- 판매내역 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">판매번호</td>
                    					<td style="width: 10%">제품이미지</td>
                    					<td style="width: 30%">제품명</td>
                    					<td style="width: 10%">가격</td>
                    					<td style="width: 10%">거래상태</td>
                    					<td style="width: 10%">구매자</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    			</tbody>
                    		</table>
                    		<!-- 판매목록 페이징바 -->
                    		<div id="sellPageArea" class="pagingArea">
								<ul class="pagination" id="sellPage">
									<!-- 판매목록 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </section>


	<script>
	let myNo = "${loginUser.userNo}"; //로그인유저 번호 미리 추출
	//구매내역
	$(function(){
    	$.ajax({
    		url : "orderPage.me",
    		type: "post",
    		data : {
    			userNo : myNo
    		},
    		success : function(result){
    			curPage = result.oPi.currentPage;
	    		startPage = result.oPi.startPage;
	    		endPage = result.oPi.endPage;
	    		maxPage = result.oPi.maxPage;
	    		let oList = result.oList;
	    		let str = ""; //게시글
	    	    let pStr = ""; //페이징
	    	    
	    	    if(oList.length == 0){
	    			str += "<tr>"
		    			+ "<td colspan='5'>구매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(oList, function(key, o){
		    			str += "<tr>"
			   				+ "<td>"+o.productNo+"</td>"
			   				+ "<td><img id='proImg' src='resources/profile/ham.png'></td>"
			   				+ "<td>"+o.productTitle+"</td>"
			   				+ "<td>￦"+o.productPrice+"</td>"
			   				+ "<td>"+o.salesStatus+"</td>"
			   				+ "<td>"+o.userNo+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    		$("#orderList tbody").html(str); //구매내역 리스트 띄워주기
	    		
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
    			$("#orderPageArea>#orderPage").html(pStr);
	    		
	    		
    		},error : function(){
    			console.log("구매내역 ajax 통신 실패");
    		}
    	});
    	
    	$.ajax({
    		url : "sellPage.me",
    		type: "post",
    		data : {
    			userNo : myNo
    		},
    		success : function(result){
    			curPage = result.sPi.currentPage;
	    		startPage = result.sPi.startPage;
	    		endPage = result.sPi.endPage;
	    		maxPage = result.sPi.maxPage;
	    		let sList = result.sList;
	    		let str = ""; //게시글
	    	    let pStr = ""; //페이징
	    	    
	    	    if(sList.length == 0){
	    			str += "<tr>"
		    			+ "<td colspan='5'>판매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(sList, function(key, s){ 
		    			str += '<tr onclick="location.href=\'pdetail.bo?pno=\' + '+s.productNo+'">' //클릭시 해당 제품 글로 이동
			   				+ "<td>"+s.productNo+"</td>"
			   				+ "<td><img id='proImg' src='resources/profile/ham.png'></td>"
			   				+ "<td>"+s.productTitle+"</td>"
			   				+ "<td>￦"+s.productPrice+"</td>"
			   				+ "<td>"+s.salesStatus+"</td>"
			   				+ "<td>"+s.userNo+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    		$("#sellList tbody").html(str); //게시글 리스트 띄워주기
	    			
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
    			$("#sellPageArea>#sellPage").html(pStr);
	    		
	    		
    		},error : function(){
    			console.log("판매내역 ajax 통신 실패");
    		}
    	});
    		
	});

	//구매내역 날짜검색
	$("#orderBtn").click(function(){
		let date = $("#orderDate").val();
		
		$.ajax({
    		url : "searchOrder.me",
    		type: "post",
    		data : {
    			userNo : myNo,
    			searchDate : date
    		},
    		success : function(result){
    			curPage = result.sPi.currentPage;
	    		startPage = result.sPi.startPage;
	    		endPage = result.sPi.endPage;
	    		maxPage = result.sPi.maxPage;
	    		let sList = result.sList;
	    		let str = ""; //게시글
	    	    let pStr = ""; //페이징
	    	    
	    	    if(oList.length == 0){
	    			str += "<tr>"
		    			+ "<td colspan='5'>구매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(oList, function(key, o){
		    			str += '<tr onclick="location.href=\'pdetail.bo?pno=\' + '+o.productNo+'">' //클릭시 해당 제품 글로 이동
			   				+ "<td>"+o.productNo+"</td>"
			   				+ "<td><img id='proImg' src='resources/profile/ham.png'></td>"
			   				+ "<td>"+o.productTitle+"</td>"
			   				+ "<td>￦"+o.productPrice+"</td>"
			   				+ "<td>"+o.salesStatus+"</td>"
			   				+ "<td>"+o.userNo+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    		$("#orderList tbody").html(str); //구매내역 리스트 띄워주기
	    		
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
    			$("#orderPageArea>#orderPage").html(pStr);
    			
    		},error : function(){
    			console.log("판매내역 ajax 통신 실패");
    		}
    	});
	});
	
	//판매내역 날짜검색
	$("#sellBtn").click(function(){
		let date = $("#sellDate").val();
		
		$.ajax({
    		url : "searchSell.me",
    		type: "post",
    		data : {
    			userNo : myNo,
    			searchDate : date
    		},
    		success : function(result){
    			curPage = result.sPi.currentPage;
	    		startPage = result.sPi.startPage;
	    		endPage = result.sPi.endPage;
	    		maxPage = result.sPi.maxPage;
	    		let sList = result.sList;
	    		let str = ""; //게시글
	    	    let pStr = ""; //페이징
	    	    
	    	    if(sList.length == 0){
	    			str += "<tr>"
		    			+ "<td colspan='5'>판매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(sList, function(key, s){
		    			str += "<tr>"
			   				+ "<td>"+s.productNo+"</td>"
			   				+ "<td><img id='proImg' src='resources/profile/ham.png'></td>"
			   				+ "<td>"+s.productTitle+"</td>"
			   				+ "<td>￦"+s.productPrice+"</td>"
			   				+ "<td>"+s.salesStatus+"</td>"
			   				+ "<td>"+s.userNo+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    		$("#sellList tbody").html(str); //게시글 리스트 띄워주기
	    		
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
    			$("#sellPageArea>#sellPage").html(pStr);
    			
    		},error : function(){
    			console.log("판매내역 ajax 통신 실패");
    		}
    	});
	});	
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