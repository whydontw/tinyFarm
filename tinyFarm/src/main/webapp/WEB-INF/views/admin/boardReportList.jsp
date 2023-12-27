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

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

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
                                <p><h5><b>🌱 신고 게시글 관리</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <select class="custom-select widget-title" id="selectBrCategory" onchange="selectBrCategory(this.value)">
                                  <option value="0" selected>CATEGORY:</option>
                                  <option value="1">스팸</option>
                                  <option value="2">욕설</option>
                                  <option value="3">광고</option>
                                  <option value="4">음란물</option>
                                </select>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15" id="boardReportListTable">
                        	<div class="mb-15" id="boardReportListCurrentPage"></div>
                            <table class="table table-responsive" align="center">
                                <colgroup>
                                    <col width="5%">
                                    <col width="12%">
                                    <col width="13%">
                                    <col width="13%">
                                    <col width="auto%">
                                    <col width="5%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>카테고리</th>
                                        <th>신고ID</th>
                                        <th>신고일자</th>
                                        <th>신고내역 상세</th>
                                        <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div class="single-widget-area float-right">
                            <ol class="popular-tags d-flex flex-wrap" >
                                <li onclick="boardReportStatus('cancel')"><a><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;&nbsp;신고취소</a></li>
                                <li onclick="boardReportStatus('delete')"><a><i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp;게시글 삭제</a></li>
<!--                            <li><a><i class="fa fa-download" aria-hidden="true"></i> 다운로드</a></li> -->
                            </ol>
                        </div>

                        
						<%@ include file="memberDetail.jsp" %>
						
						<!-- ######### 검색 ######### -->
	                    <div class="section-padding-100">
		                    <div class="row">
		                        <div class="col-12 mt-100">
		                            <!-- ######### 페이징 바 #########-->
		                            <nav aria-label="Page navigation">
		                            	<ul class="pagination" id="boardReportListPagenation"></ul>
		                            </nav>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
    <!-- ##### Blog Area End ##### -->


						<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        <script type="text/javascript">
					    	
                        $(function(){
                        	
                        	selectBoardReportList(${currentPage}, 0);
                        	
                        	//Modal 버튼 숨김
                        	$("#memberdetailViewModal").hide();
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        });
                        
                        
                        //회원 리스트
                        function selectBoardReportList(currentPage, category){
                        	
                        	$.ajax({
                        		url: "selectBoardReportList.ad",
                        		data: {
                        			currentPage: currentPage,
                        			category : category
                        		},
                        		success: function(result){
                        			makeBoardReportListTable(result, category);
                        		},error: function(){
                        			console.log("오류났수 ㅠㅠ");
                        		}
                        		
                        	})
                        	
                        }
                        
                        
                        function makeBoardReportListTable(result, category){
                        	
                        	let brList = result.brList;
                        	let brPi = result.pi;
                        	
                			let str = "";
                			
                        	brList.forEach((item) => {
                        		
                        		let categoryStr = "";
                				
                				switch (item.category) {
								case "1" :
									item.category = '스팸';
									break;
								case "2" :
									item.category = '욕설';
									break;
								case "3" :
									item.category = '광고';
									break;
								case "4" :
									item.category = '음란물';
									break;
								default:
									break;
								}
                				
                				
                				console.log("카테고리", item.category); 
                				
                				str += "<tr class='align-items-center'><td>" + item.reportNo + "</td>" + 
			                        	"<td>" + item.category + "</td>" +
			                        	"<td>" + item.reportWriter + "</td>" +
			                        	"<td>" + item.createDate + "</td>" +
			                        	"<td><div class='single-widget-area'>" +
			                            			"<div class='single-latest-post d-flex align-items-center mb-15'>" +
// 						                                "<div class='post-thumb'>" +
// 						                                    "<img src='${contextPath}/resources/img/bg-img/30.jpg' alt=''>" +
// 						                                "</div>" +
						                                "<div class='post-content'>" +
						                                    "<a href='detail.bo?boardNo=" + item.refBno + "' class='post-title'>" +
						                                        "<h6>" + item.boardTitle + "</h6>" +
						                                    "</a>" +
						                                    "<a class='post-date'>" + item.boardWriter + " / " + item.boardCreateDate + "</a>" +
						                                "</div>" +
						                            "</div>" +
					                        		"<div class='p-2' style='background: #F9F9F9'> <span style='color:red'>[ 신고사유 상세 ]  </span>   <span>   " + item.reportContent +"</div>" + 
					                            "</div>" +
			                        		"</td>" +
			                        	"<td><input type='checkbox' value=" + item.reportNo + " class='chkBoardReport'></td></tr>";
                				
                				
//                 				str += "<tr><td>" + item.ㄱ데ㅐ + "</td>" +
//                                  		"<td>" + item.userId + "</td>" +
//                                  		"<td>" + item.userName + "</td>" +
//                                  		"<td>" + item.phone + "</td>" +
//                                  		"<td>" + item.email + "</td>" +
//                                  		"<td>" + item.grade + "</td>" +
//                                  		"<td>" + item.status + "</td>" +
//                                  		"<td><a href='#' onclick='memberDetailInfo(" + item.userNo + ")'><i class='fa fa-search'></i></a></td>" +
//                                			"<td><input type='checkbox' value=" + item.userNo + " class='chkBoardReport'></td></tr>"
                				
                			})

                			$("#boardReportListTable table tbody").html(str);
                        	
                        	
                        	//pagination
                    		let beforePage = "<li class='page-item'><a class='page-link' onclick='selectBoardReportList(" + (brPi.currentPage - 1) + ", \"" + category + "\")'><i class='fa fa-angle-left'></i></a></li>"
                    		let afterPage = "<li class='page-item'><a class='page-link' onclick='selectBoardReportList(" + (brPi.currentPage + 1) + ", \"" + category + "\")'><i class='fa fa-angle-right'></i></a></li>"
                        	
                        	let paging = "";
                    		
                    		
                    		if(brPi.currentPage > 1){
                    			paging = beforePage;
                    		}
                    		
                    		
                    		for(var i = 1; i <= brPi.endPage; i++) {
                        		paging += "<li class='page-item'><a class='page-link' onclick='selectBoardReportList(" + i + ", \"" + category + "\")'>" + i + "</a></li>";
                    		}
                        	
                    		if(brPi.currentPage < brPi.maxPage){
                       			paging += afterPage;
                       		}	
                        	
                    		$("#boardReportListCurrentPage").text("현재 페이지: " + brPi.currentPage);
                			$("#boardReportListPagenation").html(paging);
                        	
                        }
                        
                        
                        
                        //카테고리별 검색
                        function selectBrCategory(category){
                        	selectBoardReportList(1, category);
                        }
                        
                        
                        
                        function boardReportStatus(status){
                        	
                        	let statusMsg = "";
                        	
                        	if(status == 'cancel'){
                        		statusMsg = "신고 일괄취소";
                        	}else{
                        		statusMsg = "게시글 삭제"
                        	}
                        	
                        	if(confirm("선택한 건의 " + statusMsg + "를 하시겠습니까?")){

                            let chkBoardReportList = "";
							
                            //체크 요소 접근
                            $(".chkBoardReport:checked").each(function(index, item){
                            	
                                if(index == 0){							//첫번째[0]면 값만 넣기
                                	chkBoardReportList += item.value;
                                } else {								//첫번째 아니면 ,값 넣기
                                	chkBoardReportList += "," + item.value;
                                }

                            });
                            
	                            //선택된 글 없을시
	                            if(chkBoardReportList == null || chkBoardReportList == ""){
	                            	alert("회원을 선택하세요");
	                            }else{
	                            	
	                            
									//선택된 글이 있으면
	                            	$.ajax({
		    							url: "boardReportStatus.ad",
		    							data: {
		    								status : status,
		    								chkBoardReportList : chkBoardReportList
		    							},
		    							success: function(result){
		    								
		    								if(result === "NNNY"){
		    									alert("일괄 변경되었습니다.");
		    									
		    									$("input[type=checkbox]").prop("checked",false);
		    									selectBoardReportList(${currentPage}, $("#selectBrCategory").val());
		    								}
		    								
		    							},
		    							error: function(){
		    								console.error("오류발생")
		    							}
		    						})
	    						
	                            }
	                            
                        	}
                            
                        }
                        
                        
                        function memberDetailInfo(userNo){
                        	
                        	$.ajax({
                        		url : "memberDetailInfo.ad",
                        		data: { userNo : userNo },
                        		success: function(result){
                        			
                        			console.log(result);
                        			
                        			$("#userNo_detail").val(result.userNo);
                        			$("#userId_detail").val(result.userId);
                        			$("#userName_detail").val(result.userName);
                        			$("#userEnrollDate_detail").val(result.enrollDate);
                        			$("#userStatus_detail").val(result.status);
                        			$("#userGrade_detail").val(result.grade);
                        			$("#userAddress_detail").val(result.address);
                        			$("#userPhone_detail").val(result.phone);
                        			
                        			var imageSrc = "";
                        			
                        			if(result.changeName == null){
                        				imageSrc = "${contextPath}/resources/img/icon/common_koongya.jpg";
                        			
                        			}else{
                        				imageSrc = "${contextPath}/" + result.changeName;
                        			}
                        			
                        			$("#profileImage").prop("src", imageSrc);
                        			
                                	$("#memberdetailViewModal").click();
                                	
                        		},
                        		error: function(){
                        			alert("오류났수ㅜ");
                        		}

                        	})
                        	
                        }
                        
						
//                         //회원 정보 변경
//                         function memberInfoUpdate(){

//                         	if(!confirm('회원 정보를 수정하겠습니까?')){
//                         		return false;
//                         	}
                        	
//                         	var userNo = $('#userNo_detail').val();
//                         	var status = $('#userStatus_detail').val();
//                         	var grade = $('#userGrade_detail').val();
                        	
                        	
//                         	$.ajax({
//                         		url : "memberInfoUpdate.ad",
//                         		data: {
//                         			userNo : userNo,
//                         			status : status,
//                         			grade : grade
//                         		},
//                         		success: function(result){
                        			
//                         			$("#userStatus_detail").val(result.status);
//                         			$("#userGrade_detail").val(result.grade);
                        			
//                                 	selectBoardReportList(${currentPage});
                        			
//                         		},
//                         		error: function(){
//                         			alert("오류났수ㅜ");
//                         		}

//                         	})
                        	
//                         }
                        
					</script>





    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
<%--     <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script> --%>
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
