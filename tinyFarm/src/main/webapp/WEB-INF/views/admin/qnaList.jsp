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
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="${contextPath }/resources/img/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- ***** Top Header Area ***** -->
        <div class="top-header-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="top-header-content d-flex align-items-center justify-content-between">
                            <!-- Top Header Content -->
                            <div class="top-header-meta">
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="infodeercreative@gmail.com"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email: infodeercreative@gmail.com</span></a>
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="+1 234 122 122"><i class="fa fa-phone" aria-hidden="true"></i> <span>Call Us: +1 234 122 122</span></a>
                            </div>

                            <!-- Top Header Content -->
                            <div class="top-header-meta d-flex">
                                <!-- Language Dropdown -->
                                <div class="language-dropdown">
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle mr-30" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language</button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">USA</a>
                                            <a class="dropdown-item" href="#">UK</a>
                                            <a class="dropdown-item" href="#">Bangla</a>
                                            <a class="dropdown-item" href="#">Hindi</a>
                                            <a class="dropdown-item" href="#">Spanish</a>
                                            <a class="dropdown-item" href="#">Latin</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Login -->
                                <div class="login">
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i> <span>Login</span></a>
                                </div>
                                <!-- Cart -->
                                <div class="cart">
                                    <a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>Cart <span class="cart-quantity">(1)</span></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ***** Navbar Area ***** -->
        <div class="alazea-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="alazeaNav">

                        <!-- Nav Brand -->
                        <a href="index.html" class="nav-brand"><img src="${contextPath }/resources/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Navbar Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="#">Pages</a>
                                        <ul class="dropdown">
                                            <li><a href="index.html">Home</a></li>
                                            <li><a href="about.html">About</a></li>
                                            <li><a href="shop.html">Shop</a>
                                                <ul class="dropdown">
                                                    <li><a href="shop.html">Shop</a></li>
                                                    <li><a href="shop-details.html">Shop Details</a></li>
                                                    <li><a href="cart.html">Shopping Cart</a></li>
                                                    <li><a href="checkout.html">Checkout</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="portfolio.html">Portfolio</a>
                                                <ul class="dropdown">
                                                    <li><a href="portfolio.html">Portfolio</a></li>
                                                    <li><a href="single-portfolio.html">Portfolio Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="blog.html">Blog</a>
                                                <ul class="dropdown">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="single-post.html">Blog Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="shop.html">Shop</a></li>
                                    <li><a href="portfolio.html">Portfolio</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>

                                <!-- Search Icon -->
                                <div id="searchIcon">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </div>

                            </div>
                            <!-- Navbar End -->
                        </div>
                    </nav>

                    <!-- Search Form -->
                    <div class="search-form">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type keywords &amp; press enter...">
                            <button type="submit" class="d-none"></button>
                        </form>
                        <!-- Close Icon -->
                        <div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${contextPath }/resources/img/bg-img/24.jpg);">
            <h2>Admin</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Admin</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            
            
            	<%@ include file="admin_nav.jsp" %>

                
                <div class="col-12 col-md-9">
                    <!-- <div class="row"> -->
                        <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                            <div class="mb-0">
                                <p><h5><b>🌱 답변 관리</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <form action="#" method="post" class="form-inline">
                                    <select class="custom-select widget-title">
                                      <option selected>Show:</option>
                                      <option value="1">미답변</option>
                                      <option value="2">답변완료</option>
                                    </select>
                                </form>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15">
                        	<div class="mb-15">현재 페이지: ${pi.currentPage }</div>
                            <table class="table table-responsive" align="center">
                                <colgroup>
                                    <col width="5%">
                                    <col width="15%">
                                    <col width="auto%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="5%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>ID</th>
                                        <th>문의사항</th>
                                        <th>작성일자</th>
                                        <th>답변일자</th>
                                        <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="q" items="${qList }">
	                                    <tr>
	                                        <td>${q.qnaNo }</td>
	                                        <td>${q.userNo }</td>
	                                        <c:choose>
	                                        	<c:when test="${empty q.qnaAnswerContent }">
			                                        <td><a href="#" onclick="qnaAnswerUpdateBtn()">${q.qnaTitle } <span>&nbsp;&nbsp;&nbsp;<i class="fa fa-commenting-o fa-lg"></i></span></a></td>
	                                        	</c:when>
	                                        	<c:otherwise>
			                                        <td><a href="#" onclick="qnaAnswerUpdateBtn();">${q.qnaTitle } <span>&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil-square-o fa-lg"></i></span></a></td>
	                                        	</c:otherwise>
	                                        </c:choose>
	                                        <td>${q.qnaCreatedate }</td>
	                                        <td>${q.qnaAnswerCreatedate }</td>
	                                        <td><input type="checkbox" value="${q.qnaNo }" class="chkQna"></td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="single-widget-area float-right">
                            <ol class="popular-tags d-flex flex-wrap" onclick="checkQnaDelete()">
                                <li><a href="#">선택 삭제</a></li>
                            </ol>
                        </div>
                        
                        
                        

                        
                        
                        
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        <script type="text/javascript">
                        
					    	
                        $(function(){
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        });
                        
                        
                        
                    	//수정 form 이동
                    	function qnaAnswerUpdateBtn(qnaNo){
                    		
                    		var formObj = $("<form>");		//태그 생성하기
                    		
                    		formObj.attr("action", "qnaUpdateForm.ad").attr("method", "post");
                    		
                    		var inputQno = $("<input>").prop("type", "hidden").prop("name", "qnaNo").prop("value", qnaNo);
                    		var obj = formObj.append(inputQno);
                    		
    						$("body").append(obj)

    						obj.submit();
                    		
                    	}
                        
                        
                        
                        function checkQnaDelete(){
                        	
                        	if(confirm("선택 내역을 삭제하시겠습니까?")){

                            let chkQnaList = "";
							
                            //체크 요소 접근
                            $(".chkQna:checked").each(function(index, item){
                            	
                                if(index == 0){							//첫번째[0]면 값만 넣기
                                	chkQnaList += item.value;
                                } else {								//첫번째 아니면 ,값 넣기
                                	chkQnaList += "," + item.value;
                                }

                            });
                            
	                            //선택된 글 없을시
	                            if(chkQnaList == null || chkQnaList == ""){
	                            	
	                            	alert("삭제할 글을 선택하세요");
	                            	
	                            }else{
	                            
		                            //선택된 글이 있는 경우
		                    		var formObj = $("<form>");		//태그 생성하기
		                    		formObj.attr("action", "qnaAnswerDelete.ad").attr("method", "post");
		                    		
		                    		var inputQnos = $("<input>").prop("type", "hidden").prop("name", "chkQnaList").prop("value", chkQnaList);
		                    		var obj = formObj.append(inputQnos);
		                    		
		    						$("body").append(obj)
		
		    						obj.submit();
	    						
	                            }
	                            
                        	}
                            
                        }
                        
					    </script>
                        
                        
<!--						######### 검색 #########-->
<!--                         <div class="section-padding-100"> -->
<!--                             <div class="single-widget-area"> -->
<!--                                 <form action="#" method="get" class="search-form d-flex float-right">   height-50 css 추가 -->
<!--                                     <div class=""> -->
<!--                                         <select class="custom-select widget-title height-50"> -->
<!--                                             <option value="1">ID</option> -->
<!--                                             <option value="2">내용</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
<!--                                     <div class=""> -->
<!--                                         <input type="search" name="search" id="widgetsearch" placeholder="Search..."> -->
<!--                                         <button type="submit"><i class="icon_search"></i></button> -->
<!--                                     </div> -->
<!--                                 </form> -->
<!--                             </div> -->
<!--                         </div> -->


                    <!-- </div> -->

                    <div class="row">
                        <div class="col-12 mt-100">
                            <!-- ######### 페이징 바 #########-->
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                
			                        <c:if test="${pi.currentPage > 1}">
			                            <li class="page-item"><a class="page-link" href="${contextPath }/admin/qnaList?currentPage=${pi.currentPage-1}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>
                                
                                    
                                    <!-- paging 개수 -->
                                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
	                                    <li class="page-item"><a class="page-link" href="${contextPath }/admin/qnaList?currentPage=${i}">${i}</a></li>
									</c:forEach>
									
				                    
				                     <c:if test="${pi.currentPage < pi.maxPage}">
			                            <li class="page-item"><a class="page-link" href="${contextPath }/admin/qnaList?currentPage=${pi.currentPage+1}"><i class="fa fa-angle-right"></i></a></li>
									</c:if>
                                    
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    

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
