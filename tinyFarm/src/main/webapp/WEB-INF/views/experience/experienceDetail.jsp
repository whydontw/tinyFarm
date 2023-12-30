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
	<!-- 카카오 지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed30e79691f839aedd7d7cec75482647&libraries=services"></script>
	<style>
		ul{
			padding:0;
		}
		.title{
			margin:15px 0;
			color: #222228;
		}
		.container{
			width:100%;
			height:auto;
		}
		.detail-div{
			width:800px;
			margin:50px auto;
			padding:40px;
		}
		.d-img-title{
			width:100%;
			height: auto;
			border-bottom: 1px solid #d4d4d4;
		}
		.title-img{
			width:100%;
			height:60%;
		}
		li.locplc{
			background: url(resources/img/icon/location-icon.png) top left/20px no-repeat;
		}
		li.telno{
			background: url(resources/img/icon/phone-icon.png) top left/20px no-repeat;
		}
		li.url{
			background: url(resources/img/icon/homepage-icon.png) top left/20px no-repeat;
		}
		.list li{
			width:100%;
			padding-left:25px;
			margin-top:20px;
			margin-bottom:20px;
		}
		.list-div{
			width:100%;
			border-bottom: 1px solid #d4d4d4;
		}
		.url a{
			font-size: 16px;
			color:#707070;
		}
		.cn-div,.map-div{
			padding:20px;
			border-bottom: 1px solid #d4d4d4;
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
						<li class="breadcrumb-item"><a href="${contextPath}/inGardenPlantList.pp">농촌교육농장</a></li>
					
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="detail-div">
			<div class="d-img-title">
				<img id="title-img" src="${ex.imgUrl1}">
				<h1 class="title"><b>${ex.cntntsSj}</b></h1>
				<p><b style="color:#FF6C30;">주제</b>&nbsp;&nbsp;${ex.thema}</p>
			
			</div>
			<div class="list-div">
			  <ul class="list">
			    <li class="locplc">
			      ${ex.locplc} <!-- 소재지 -->
			    </li>
			    <li class="telno">
			      ${ex.telno} <!-- 전화번호 -->
			    </li>
			    <li class="url">
			      <a href="${ex.url}">${ex.url}</a> <!-- 홈페이지 주소 -->
			    </li>
			  
			  </ul>
			</div>
			<div class="cn-div">
				${ex.cn }
			</div>
			<div class="map-div">
				<h2 class="title">찾아오는 길</h2>
				<div id="map" style="width:720px;height:600px;"></div>
			</div>
			<script>
				$(function(){
					var title = '${ex.cntntsSj}';
					var locplc = '${ex.locplc}';
					getMap(title,locplc);
				});
				function getMap(title,location){
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
		
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(location, function(result, status) {
			
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
			
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
			
	
			
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
				}
				
			</script>
		</div>
	</div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- ##### Product Area End ##### -->
</body>
</html>