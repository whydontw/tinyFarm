<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
    
    

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
                    <!-- <div class="row"> -->
                        <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                            <div class="mb-0">
                                <p><h5><b>🌱 나의 QNA 내역</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <form action="qnaList" method="post" class="form-inline">
                                    <select class="custom-select widget-title" id="showPeriod">
                                      <option selected>Show:</option>
                                      <option value="7">지난 7일</option>
                                      <option value="30">지난 30일</option>
                                    </select>
                                    <button type="submit" style="display:none"></button>
                                </form>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15">
                        	<div class="mb-15">현재 페이지: ${pi.currentPage }</div>
                            <table class="table table-responsive" align="center">
                                <colgroup>
                                    <col width="5%">
                                    <col width="auto%">
                                    <col width="5%">
                                    <col width="15%">
                                    <col width="12%">
                                    <col width="5%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>문의사항</th>
                                        <th></th>
                                        <th>답변</th>
                                        <th>수정</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
		                        	 <c:forEach items="${qList}" var="qList" varStatus="index">
	                                    <tr>
	                                        <td>${qList.qnaNo }</td>
	                                        <td>
	                                        	<p><b>${qList.qnaTitle }</b> <small>&nbsp;&nbsp; [ ${qList.qnaCreatedate } ]</small></p>
	                                        	<p>${qList.qnaContent }</p>
							                        				                        
						                        <!-- 관리자 답변 -->
			                                	<c:if test="${not empty qList.qnaAnswerContent }">	
						                            <div class="single-comment justify-content-between d-flex">
						                                <div class="user justify-content-between d-flex" style="display:none">
						                                    <div id="qaAdminAnswer${index.count }" class="collapse desc">
																<div class="py-4" style="border-top: 0.1em dotted #ccc;">
							                                		<p><i class="fa fa-lock" aria-hidden="true"></i>&nbsp;&nbsp;<b> 관리자 답변</b> <small>&nbsp;&nbsp; [ ${qList.qnaAnswerCreatedate } ]</small></p>
													                <p>${qList.qnaAnswerContent }</p>
							                                	</div>
															</div>
						                                </div>
						                            </div>
			                                    </c:if>
	                                        </td>
	                                        
	                                        <td align="center">
	                                        	<c:choose>
	                                        		<c:when test="${empty qList.qnaAnswerContent }"></c:when>
	                                        		<c:otherwise>
					                                	<a href="#" class="text-uppercase" id="checkAdminAnswer" data-toggle="collapse" data-target="#qaAdminAnswer${index.count}"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </td>
	                                        
	                                        <td align="center">
	                                        	<c:choose>
	                                        		<c:when test="${empty qList.qnaAnswerContent }"><b># 미답변</b></c:when>
	                                        		<c:otherwise><b># 답변완료</b></c:otherwise>
	                                        	</c:choose>
	                                        </td>
	                                        <td>
	                                        	<c:if test="${empty qList.qnaAnswerContent }">
 		                                        	<div class="single-widget-area float-right">
							                            <ol class="popular-tags d-flex flex-wrap">
							                                <li><a href="qnaUpdate?qno=${qList.qnaNo }">수정</a></li>
							                            </ol>
							                        </div>
		                                        </c:if>
	                                        </td>
											<td><a href="#" id="qnaDelete"><i class="fa fa-times" aria-hidden="true"></i></a></td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            
                        </div>
                        
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        
                        
                        
                        
                        
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
			                            <li class="page-item"><a class="page-link" href="qna/qnaList?currentPage=${pi.currentPage-1}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>
                                    
                                    <!-- paging 개수 -->
                                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
	                                    <li class="page-item"><a class="page-link" href="qna/qnaList?currentPage=${i}">${i}</a></li>
									</c:forEach>
				                    
				                     <c:if test="${pi.currentPage < pi.maxPage}">
			                            <li class="page-item"><a class="page-link" href="qna/qnaList?currentPage=${pi.currentPage+1}"><i class="fa fa-angle-right"></i></a></li>
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