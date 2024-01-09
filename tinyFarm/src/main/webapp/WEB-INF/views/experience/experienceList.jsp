<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 5.3.2 -->
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<style>
		.exImg:hover,.exName:hover{
			cursor : pointer;
		}
		.exImg{
			 width:100%;
			 height:250px;
			 border-radius: 10px;
		}
		.searchContainer{
			display:flex;
			justify-content: flex-end;
			margin:0 auto;
			
		}
		.searchOutDiv{
			width: 320px;
			height:35px;
			margin-bottom:30px;
			/* margin-top: 15px;
			margin-bottom: 15px; */
			vertical-align:middle;
			border: 2px #70c745 solid ;
		}
		.searchOutDiv input{
			width: 210px;
			height: 20px;
			border-style: none;
			padding:10px;
			outline: none;
			
		}
		.searchInDiv{
			display:flex;
			align-items:center;
			width:310px;
			height:20px;
			margin:0 auto;
			margin:5px auto;
		}
		.searchInDiv img{
			width:15px;
			height:15px;
		}
		#searchBtn{
			display: flex;
			justify-content: center;
			align-items: center;
		 	width:30px;
		 	height:25px;
			background-color:transparent;
		 	border:none;
		 	align-content: center;
		}
		#sType{
			border:none;
			outline:none;
			
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
			<h2>농촌교육농장</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/experienceList.ex">농촌교육농장</a></li>
					
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
    <section class="new-arrivals-products-area section-padding-0-100">
    	<!-- ##### Single Widget Area ##### -->
  		
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>농촌교육농장</h2>
                        <p>전국 초/중/고등학생을 위한 농촌교육농장에 대한 정보를 알아볼 수 있어요</p>
                    </div>
                </div>
            </div>
        	<div class="searchContainer">
		        <div class="searchOutDiv">
		        	<div class="searchInDiv">
						<select id="sType">
							<option value="sCntntsSj">제목명</option>
							<option value="sLocplc">지역명</option>
							<option value="sThema">주제명</option>
						</select>
			  			<input type="search" id="searchInput" placeholder="search..">
				  		<button id="searchBtn" onclick="search();"><img src="${contextPath}/resources/img/icon/search.svg"></button>       	
			        	
		        	</div>
		        	
		  			
		  		</div> 
		    </div>

			 <div class="row itemRow">
				<c:forEach items="${list}" var="li">
	                <!-- Single Product Area -->
		                <div class="col-12 col-sm-6 col-lg-3">
		                    <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">
			                	
				                <form action="experienceDetail.ex">
									<input type="hidden" name="cntntsNo" value="${li.cntntsNo}">
				                	<input type="submit" class="submitBtn" hidden>
			                        <!-- Product Image -->
			                        <div class="ex-img-div">
			                            <img class="exImg" src="${li.imgUrl}">
			                        </div>
			                        <!-- Product Info -->
			                        <div class="product-info mt-15 text-center">
	
			                            <p class="exName">${li.cntntsSj}</p>
			                        </div>
			                    </form>
		                    </div>
		                </div>
	                	
	               
				
				</c:forEach>
            <!-- 페이징바 -->
			<div class="wholeList" align="center">
				<c:choose>
					<c:when test="${not empty sText}">
						<c:choose>
		                    <c:when test="${pi.currentPage eq 1}">
		                        <button  class='btn btn-sm' disabled>이전</button>
		                    </c:when>
		                    <c:otherwise>
		                        <button class='btn btn-sm' onclick="location.href='experienceList.ex?pageNo=${pi.currentPage-1}&sText=${sText}&sType=${sType}'">이전</button>
		                    </c:otherwise>
		                </c:choose>
		                <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
		                	<c:choose>
		                		<c:when test="${i eq pi.currentPage}">
		                			<button class='btn btn-sm active' onclick="location.href='experienceList.ex?pageNo=${i}&sText=${sText}&sType=${sType}'">${i}</button>
		                		</c:when>
		                		<c:otherwise>
		                			<button class='btn btn-sm' onclick="location.href='experienceList.ex?pageNo=${i}&sText=${sText}&sType=${sType}'">${i}</button>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage}">
		                        <button  class='btn btn-sm' disabled>다음</button>
		                    </c:when>
		                    <c:otherwise>
		                        <button  class='btn btn-sm' onclick="location.href='experienceList.ex?pageNo=${pi.currentPage+1}&sText=${sText}&sType=${sType}'">다음</button>
		                    </c:otherwise>
		                </c:choose>
					</c:when>
					<c:otherwise>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq 1}">
		                        <button  class='btn btn-sm' disabled>이전</button>
		                    </c:when>
		                    <c:otherwise>
		                        <button class='btn btn-sm' onclick="location.href='experienceList.ex?pageNo=${pi.currentPage-1}'">이전</button>
		                    </c:otherwise>
		                </c:choose>
		                <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
		                	<c:choose>
		                		<c:when test="${i eq pi.currentPage}">
		                			<button class='btn btn-sm active' onclick="location.href='experienceList.ex?pageNo=${i}'">${i}</button>
		                		</c:when>
		                		<c:otherwise>
		                			<button class='btn btn-sm' onclick="location.href='experienceList.ex?pageNo=${i}'">${i}</button>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage}">
		                        <button  class='btn btn-sm' disabled>다음</button>
		                    </c:when>
		                    <c:otherwise>
		                        <button  class='btn btn-sm' onclick="location.href='inGardenPlantList.pp?currentPage=${pi.currentPage+1}'">다음</button>
		                    </c:otherwise>
		                </c:choose>
					
					</c:otherwise>
				</c:choose>
			</div>
            

        </div>
    </section>
    <script>
	    $(".exImg").click(function(){
	    	
			$(this).parents("form").children(".submitBtn").click();
		});
	    function search(){
    		var input = document.getElementById("searchInput");
    		var selectEl = document.getElementById("sType");
    		var selectValue = selectEl.options[selectEl.selectedIndex].value;
    		location.href = "experienceList.ex?sText="+input.value+"&sType="+selectValue;
    		
    	}
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- ##### Product Area End ##### -->
</body>
</html>