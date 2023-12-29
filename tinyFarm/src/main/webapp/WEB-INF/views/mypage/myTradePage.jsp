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

.ui-datepicker-header.ui-widget-header.ui-helper-clearfix.ui-corner-all
	{
	background-color: #70c745;
}

.ui-datepicker-year, .ui-datepicker-month {
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

.ui-datepicker-year>option, .ui-datepicker-month>option {
	background-color: #fff;
}

.hasDatepicker {
	width: 50%;
}

#orderBtn, #sellBtn {
	width: 40px;
	height: 30px;
	border: none;
	background-color: #70c745;
	color: #fff;
	outline: none;
	display: inline;
	margin-left: -10px;
	box-sizing: border-box;
	cursor: pointer;
}

#wishBtn {
	width: 40px;
	height: 30px;
	border: none;
	background-color: #70c745;
	color: #fff;
	outline: none;
	margin: auto;
}

#orderBtn:hover, #sellBtn:hover, #wishBtn:hover {
	background-color: #66b83d;
}

.pagingArea {
	margin-top: 1%;
}

table {
	border: none;
	font-size: 14px;
}

thead {
	height: 40px;
}

#wishListTableContainer {
	margin-top: -15px;
}

#wishListTableContainer table tbody {
	display: block;
	height: 450px;
	overflow: scroll;
	text-align: left;
	font-size: 14px;
	text-overflow: ellipsis;
}

#wishTable thead {
	height: 20px;
}

#wishTable tbody tr {
	border-bottom: 1px solid grey;
}

#orderDate, #sellDate {
	width: 70%;
	height: 30px;
	border: 1px solid #cdcdcd;
	font-size: 1em;
	padding-left: 5px;
	font-style: oblique;
	display: inline;
	outline: none;
	box-sizing: border-box;
	color: black;
}

#proImg {
	width: 60%;
	height: 60%;
	padding: 0px 0px 0px 0px;
}

#imgTd {
	width: 25%;
}

#btnTd {
	width: 20%;
	text-align: center;
}

#wishImg {
	width: 80%;
	height: 80%;
	padding: 10px 0px 10px 10px;
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
            <div class="row">
                <div class="col-12 col-md-8">
                    <div class="row">
                    	<div id="orderList">
                    		<div class="widget-title">
                                <h4>구매내역</h4>
                            </div>
                            <div class="dateSearch">
                            	<input type="text" id="orderDate" placeholder="검색날짜">
                            	<input type="button" id="orderBtn" value="검색" onclick="loadOrderSearch(1);">
                            </div>
                            <!-- 구매목록 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">구매번호</td>
                    					<td style="width: 15%">구매날짜</td>
                    					<td style="width: 15%">제품이미지</td>
                    					<td style="width: 30%">제품명</td>
                    					<td style="width: 10%">가격</td>
                    					<td style="width: 10%">결제수단</td>
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
                            	<input type="text" id="sellDate" placeholder="검색날짜">
                            	<input type="button" id="sellBtn" value="검색" onclick="loadSellSearch(1);">
                            </div>
                            <!-- 판매내역 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">판매번호</td>
                    					<td style="width: 10%">등록날짜</td>
                    					<td style="width: 20%">제품이미지</td>
                    					<td style="width: 30%">제품명</td>
                    					<td style="width: 10%">가격</td>
                    					<td style="width: 10%">거래상태</td>
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
    			<div class="col-12 col-md-4">
                    <div class="post-sidebar-area">
                        <div class="single-widget-area">
                            <div id="wishList">
	                            <div class="widget-title">
	                                <h4>찜내역</h4>
	                            </div>
	        					<div id="wishListTableContainer">
			                    	<table id="wishTable">
										<thead>
											<tr><td colspan="3">찜목록</td></tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</section>
		
	<script>
			
	let myNo = ${loginUser.userNo}; //로그인유저 번호 미리 추출
	let curPage = 0;
    let startPage = 0;
    let endPage = 0;
	let maxPage0;
	//구매내역
	function loadOrderPage(page){
    	$.ajax({
    		url : "orderPage.me",
    		type: "post",
    		data : {
    			userNo : myNo,
    			currentPage : page
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
		    			+ "<td colspan='6'>구매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(oList, function(key, o){
		    			str += '<tr onclick="location.href=\'pdetail.bo?pno=\' + '+o.productNo+'">' //클릭시 해당 제품 글로 이동
		    				+ "<td>"+o.paymentNo+"</td>"
			   				+ "<td>"+o.orderDate.substring(0,10)+"</td>"
			   				//+ '<td><img id="proImg" src="'+o.changeName+'"></td>'
			   				+ '<td><img id="proImg" src="resources/상추.jpg"></td>'
			   				+ "<td>"+o.productTitle+"</td>"
			   				+ "<td>￦"+o.paymentPrice+"</td>"
			   				+ "<td>"+o.paymentMethod+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    		$("#orderList tbody").html(str); //구매내역 리스트 띄워주기
	    		
	    			
	    		//페이징 처리
    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
    			}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+(startPage-5)+')">이전</a></li>';
    			}
	    		for(var i=startPage; i<endPage+1; i++){
	    			if (i==curPage) { //현재페이지일때 current-page class 추가
	    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+i+')">'+i+'</a></li>';
	    		    } else {
	    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+i+')">'+i+'</a></li>';
	    		    }
	    		}
	    		if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
	    		}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+(startPage+5)+')">다음</a></li>';
	    		}
    			$("#orderPageArea>#orderPage").html(pStr);
	    		
    		},error : function(){
    			console.log("구매내역 ajax 통신 실패");
    		}
    	});
	}

	//판매내역 리스트
    function loadSellPage(page){
    	$.ajax({
    		url : "sellPage.me",
    		type: "post",
    		data : {
    			userNo : myNo,
    			currentPage : page
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
		    			+ "<td colspan='6'>판매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(sList, function(key, s){ 
		    			str += '<tr onclick="location.href=\'pdetail.bo?pno=\' + '+s.productNo+'">' //클릭시 해당 제품 글로 이동
			   				+ "<td>"+s.productNo+"</td>"
			   				+ "<td>"+s.regiDate.substring(0,10)+"</td>"
			   				+ '<td><img id="proImg" src="'+s.changeName+'"></td>'
			   				+ "<td>"+s.productTitle+"</td>"
			   				+ "<td>￦"+s.productPrice+"</td>"
			   				+ "<td>"+s.salesStatus+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    		$("#sellList tbody").html(str); //게시글 리스트 띄워주기
	    			
	    		//페이징 처리
    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
    			}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+(startPage-5)+')">이전</a></li>';
    			}
	    		for(var i=startPage; i<endPage+1; i++){
	    			if (i==curPage) { //현재페이지일때 current-page class 추가
	    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+i+')">'+i+'</a></li>';
	    		    } else {
	    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+i+')">'+i+'</a></li>';
	    		    }
	    		}
	    		if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
	    		}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+(startPage+5)+')">다음</a></li>';
	    		}
    			$("#sellPageArea>#sellPage").html(pStr);
    		}
    	});
    }	

	//구매내역 날짜검색
    function loadOrderSearch(page){
    	let date = $("#orderDate").val(); //검색날짜
    	
   		$.ajax({
    		url : "searchOrder.me",
    		type : "post",
    		data : {
    			userNo : myNo,
    		    searchDate : date,
    		    currentPage : page
    		},
    		success : function(result){
    			$("#orderList tbody").empty();  //기존 리스트 비워주기
    		    curPage = result.oPi.currentPage;
    			startPage = result.oPi.startPage;
    			endPage = result.oPi.endPage;
    			maxPage = result.oPi.maxPage;
    			let oList = result.oList;
    			let str = ""; //게시글
    			let pStr = ""; //페이징
    				if(oList.length == 0){
    			    	str += "<tr>"
    				    	+ "<td colspan='5'>해당 기간 구매내역이 존재하지 않습니다.</td>"
    				    	+ "</tr>";
    			    }else{
    					$.each(oList, function(key, o){
    						str += '<tr onclick="location.href=\'pdetail.bo?pno=\' + '+o.productNo+'">' //클릭시 해당 제품 글로 이동
			    				+ "<td>"+o.paymentNo+"</td>"
				   				+ "<td>"+o.orderDate.substring(0,10)+"</td>"
				   				+ '<td><img id="proImg" src="'+o.changeName+'"></td>'
				   				+ "<td>"+o.productTitle+"</td>"
				   				+ "<td>￦"+o.paymentPrice+"</td>"
				   				+ "<td>"+o.paymentMethod+"</td>"
				   				+ "</tr>";
    				    	});
    			    	}
    				  
    			    	$("#orderList tbody").html(str); //구매내역 리스트 띄워주기
    			    		
    			    //페이징 처리
    		    	if(startPage==1){ //시작이 1이면 이전버튼 비활성
    		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
    		    	}else{
    		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+(startPage-5)+')">이전</a></li>';
    		    	}
    			    for(var i=startPage; i<endPage+1; i++){
    			    	if (i==curPage) { //현재페이지일때 current-page class 추가
    			    		pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+i+')">'+i+'</a></li>';
    			    	} else {
    			    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+i+')">'+i+'</a></li>';
    			    	}
    			    }
    			    if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
    			    	pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
    			    }else{
    		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+(startPage+5)+')">다음</a></li>';
    			    }
    		    	$("#orderPageArea>#orderPage").html(pStr);
    		}
    	});
   	}
	
	//판매내역 날짜검색
	function loadSellSearch(page){
		let date = $("#sellDate").val(); //String
		
		$.ajax({
	    	url : "searchSell.me",
	    	type: "post",
	    	data : {
	    		userNo : myNo,
	    		searchDate : date,
	    		currentPage : page
	    	},
	    	success : function(result){
	    		$("#sellList tbody").empty(); 
	    		curPage = result.sPi.currentPage;
		    	startPage = result.sPi.startPage;
		    	endPage = result.sPi.endPage;
		    	maxPage = result.sPi.maxPage;
		    	let sList = result.sList;
		    	let str = ""; //게시글
		        let pStr = ""; //페이징
		        if(sList.length == 0){
		    		str += "<tr>"
			   			+ "<td colspan='5'>해당 기간 판매내역이 존재하지 않습니다.</td>"
			   			+ "</tr>";
		    	}else{
			   		$.each(sList, function(key, s){
			   			str += '<tr onclick="location.href=\'pdetail.bo?pno=\' + '+s.productNo+'">' //클릭시 해당 제품 글로 이동
		   				+ "<td>"+s.productNo+"</td>"
		   				+ "<td>"+s.regiDate.substring(0,10)+"</td>"
		   				+ '<td><img id="proImg" src="'+s.changeName+'"></td>'
		   				+ "<td>"+s.productTitle+"</td>"
		   				+ "<td>￦"+s.productPrice+"</td>"
		   				+ "<td>"+s.salesStatus+"</td>"
		   				+ "</tr>";
			   		});
		    	}
		    	$("#sellList tbody").html(str); //게시글 리스트 띄워주기
		    	
		    	//페이징 처리
	    		if(startPage==1){ //시작이 1이면 이전버튼 비활성
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
	    		}else{
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+(startPage-5)+')">이전</a></li>';
	    		}
		    	for(var i=startPage; i<endPage+1; i++){
		    		if (i==curPage) { //현재페이지일때 current-page class 추가
		    	        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+i+')">'+i+'</a></li>';
		    	    } else {
		    	        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+i+')">'+i+'</a></li>';
		    	    }
		    	}
		    	if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
		    	}else{
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+(startPage+5)+')">다음</a></li>';
		    	}
	    		$("#sellPageArea>#sellPage").html(pStr);
	    		
	    	}
    	});
	}
	
    $(function(){ //초기 페이지 로딩은 1페이지여야 한다
		loadOrderPage(1); //구매내역
    	loadSellPage(1); //판매내역
    	loadOrderSearch(1); //구매검색내역
    	loadSellSearch(1); //판매검색내역
	});
    
    //찜목록
    $(function(){
    	$.ajax({
    		url : "wishList.me",
    		data : {
    			userNo : myNo
    		},
    		success : function(result){ //wishList
    			let wishList = result.wishList;
    			let str = "";
    			$.each(wishList, function(key, w){
    				console.log(w.productNo);
    				str += "<tr>"
    					+ "<td id='imgTd'><img id='wishImg' alt='제품이미지' src='resources/상추.jpg'></td>"
						+ "<td>"+w.productTitle+"<br>￦"+w.productPrice+"</td>"
						+ '<td id="btnTd"><input type="button" id="wishBtn" value="보기" onclick="location.href=\'pdetail.bo?pno=\' + '+w.productNo+'"></td>'
    					+ "</tr>";
    			});
    			
    			$("#wishTable tbody").html(str);
    		},error : function(){
    			console.log("찜목록 ajax 요청 실패");
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