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
		}
		#replyList{
			width: 100%;
			height: 50%;
			margin-top: 5%;
		}
		table{
			width: 100%;
			text-align: center;
		}
		.pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }
        .pagination-container a {
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #ddd;
            color: #333;
            cursor: pointer;
        }
        .pagination-container table tr{
        	border-bottom: 1px solid grey;
        }
        .pagination-container table td{
        	width: 300px;
        	text-align: center;
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
                    			<tbody>
                    				<c:choose>
										<c:when test="${not empty list }">
											<c:forEach items="${list }" var="b">
												<tr>
													<td>${b.boardNo }</td>
													<td>${b.boardTitle }</td>
													<td>${b.boardContent }</td>
													<td>${b.count }</td>
													<td>${b.likeCount }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr><td colspan="5">작성한 게시글이 없습니다.</td></tr>
										</c:otherwise>
									</c:choose>
                    			</tbody>
                    		</table>
                    		<div id="pagingArea">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pi.currentPage eq 1 }">
											<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1 }">이전</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1 }">이전</a></li>
										</c:otherwise>
									</c:choose>
	
									<c:forEach var="i" begin="${ pi.startPage}" end="${pi.endPage }">
										<li class="page-item"><a class="page-link" href="list.bo?currentPage=${i}">${i}</a></li>
									</c:forEach>
	
									<c:choose>
										<c:when test="${pi.currentPage eq pi.maxPage }">
											<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${pi.currentPage+1 }">다음</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage+1 }">다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
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
                    			<tbody>
                    				<c:choose>
										<c:when test="${not empty rList }">
											<c:forEach items="${rList }" var="r">
											<tr>
												<td>${r.refBno}</td>
												<td>${r.replyContent}</td>
												<td>${r.createDate }</td>
												<td>${r.likeCount }</td>
											</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr><td colspan="4">작성한 댓글이 없습니다.</td></tr>
										</c:otherwise>
									</c:choose>
                    			</tbody>
                    		</table>
                    		<div id="pagingArea">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pi.currentPage eq 1 }">
											<li class="page-item disabled"><a class="page-link"href="list.bo?currentPage=${pi.currentPage-1 }">이전</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1 }">이전</a></li>
										</c:otherwise>
									</c:choose>
	
									<c:forEach var="i" begin="${ pi.startPage}" end="${pi.endPage }">
										<li class="page-item"><a class="page-link" href="list.bo?currentPage=${i}">${i}</a></li>
									</c:forEach>
	
									<c:choose>
										<c:when test="${pi.currentPage eq pi.maxPage }">
											<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${pi.currentPage+1 }">다음</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage+1 }">다음</a></li>
										</c:otherwise>
									</c:choose>
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
        							<a href="#" id="prevBtn">&lt;</a>
        								<div id="followingTableContainer">
		                            	 <table id="following">
											<thead>
												<tr><td>Following List</td></tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty fingList }">
														<c:forEach items="${fingList }" var="fi">
															<tr>
																<td>${f.userId }</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr><td>친구를 만들어보세요!</td></tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										 </table>
										</div>
									<a href="#" id="nextBtn">&gt;</a>
   								</div>
   								<br>
   								<div class="pagination-container">
        							<a href="#" id="prevBtn">&lt;</a>
        								<div id="followerTableContainer">
		                            	 <table id="follower">
											<thead>
												<tr><td>Follower List</td></tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty fwerList })">
														<c:forEach items="${fwerList }" var="fw">
															<tr>
																<td>${f.userId }</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr><td>친구를 만들어보세요!</td></tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										 </table>
										</div>
									<a href="#" id="nextBtn">&gt;</a>
   								</div>
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