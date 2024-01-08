<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>영농일지보기</title>
    <link rel="icon" href="resources/img/core-img/favicon.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link rel="stylesheet" href="resources/style.css">
    <link rel="stylesheet" href="resources/jisu/css/mypage.css">
    
    <style>
        .content {
            width: 100%;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 3%;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 3%;
        }

		#cNt p{
			font-size: 15px;
			color: grey;
		}
		#cNt{
			text-align: center;
			margin-bottom: 5%;
		}
		#miniProfile{
			display:inline-block;
			
		}
		#miniProfile img{
			width: 35px;
			height: 35px;
			border-radius: 100%;
			margin-bottom: 2%;
		}
		#selectDate{
			font-size: 15px;
			color: grey;
		
		}
		.content>.note-editor.note-frame{
			border: none;
		}
        #diaryContent {
            width: 100%;
            margin-top: 5%;
        }
        .btn-area{
        	width: 50%;
        	margin: auto;
        	text-align: center;
        }
        .btn-green{
        	width: 80px;
        	height: 40px;
        	margin: auto;
        }
        #diarylike{
         	width: 28px;
         	height: 28px;
        	float: right;
        	text-align: center;
        	font-size: 14px;
        }
        #likeCount{
        	margin-top: -2%;
        }
        
        #diarylike img{
        	width: 100%;
        	height: 100%; 
        }
        #diarylike:hover {
        	cursor: pointer;
        }
    </style>
</head>

<body>
    <%@ include file="../common/header.jsp" %>

    <div class="breadcrumb-area">
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
            style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>영농일지</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="mypage.me"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0)">일지보기</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>

     <section class="alazea-blog-area my-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                	<div class="row">
	                    <div class="content">
	                    	<div id="cNt">
		                        <p>${d.categoryNo }</p>
		                        <h4>${d.diaryTitle }</h4>
	                    	</div>
	                    	<c:choose>
	                    		<c:when test="${not empty loginUser.changeName }">
			                    	<span id="miniProfile"><img src="${loginUser.changeName }">&nbsp;${loginUser.userName } &nbsp;</span>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<span id="miniProfile"><img src="resources/profile.jpg">&nbsp;${loginUser.userName } &nbsp;</span>
	                    		</c:otherwise>
			                    	
	                    	</c:choose>
	                    	<span id="selectDate">${d.selectDate }</span>
	                    	<hr>
	                        <div id="diaryContent">${d.diaryContent }</div>
	                    </div>
	                    <div class="btn-area">
	                        <button id="updateBtn" class="btn-green">수정</button>
	                        <button id="delBtn" class="btn-green">삭제</button>
	                        <button id="backBtn" class="btn-green">뒤로가기</button>
	                    </div>
                	</div>
                </div>
            </div>
        </div>
    </section>

    <script>
    $('#diaryContent').summernote("destroy");

        $(function () {
            $("#delBtn").click(function () {
                let warn = window.confirm("삭제 후 되돌릴 수 없습니다.\n등급 기준에 따라 등급이 하락할 수도 있습니다.\n정말로 삭제하시겠습니까?");
                if (warn) {
                    location.href = "delete.di?diaryNo="+${d.diaryNo};
                } else {
                    return false;
                }
            });
            
            $("#updateBtn").click(function(){
            	location.href="updatePage.di?diaryNo="+${d.diaryNo};
            });
            
            $("#backBtn").click(function(){
            	let alert = window.confirm("이전페이지로 이동하시겠습니까?");
            	if(alert){
	            	window.history.back();
            	}else{
            		return false;
            	}
            })
        });
        
        
    </script>

     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>