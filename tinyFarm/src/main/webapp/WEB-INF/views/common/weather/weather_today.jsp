<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 날씨</title>

<!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">

<style type="text/css">

body {
  background: #fff;
  color: #444;
  font-family: "Noto-sans", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
h1, h2, h3, h4, h5, h6 {
  margin: 0 0 15px 0;
  padding: 0;
  font-family: "Segoe UI", sans-serif;
  font-weight:700;
}
/*--------------------------------------------------------------
# Weather Card
--------------------------------------------------------------*/
.weather__card {
  width: 800px;
  padding: 40px 30px;
  background-color: #EEEEEE;
  border-radius: 20px;
  color:#3C4048;
}
.weather__card h2 {
  font-size:120px;
  font-weight:700;
  color:#3C4048;
  line-height: .8;
}
.weather__card h3 {
  font-size: 40px;
  font-weight: 600;
  line-height: .8;
  color:#3C4048;
}
.weather__card h5 {
  font-size: 20px;
  font-weight: 400;
  line-height: .1;
  color:#9D9D9D;
}
.weather__card img {
  width: 120px;
  height: 120px;
}
.weather__card .weather__description {
  background-color: #fff;
  border-radius: 25px;
  padding: 5px 13px;
  border:0;
  outline: none;
  color:#7F8487;
  font-size: .956rem;
  font-weight: 400;
}
/*--------------------------------------------------------------
# Weather Status
--------------------------------------------------------------*/
.weather__status img {
  height: 20px;
  width: 20px;
  vertical-align:middle;
}
.weather__status span {
  font-weight: 500;
  color: #3C4048;
  font-size: .9rem;
  padding-left: .5rem;
}
/*--------------------------------------------------------------
# Weather Forecast
--------------------------------------------------------------*/
.weather__forecast img {
  height: 25px;
  width: 25px;
  vertical-align:middle;
}
.weather__forecast span {
  font-weight: 500;
  color: #3C4048;
  font-size: 1rem;
  padding: 5px 10px;
}

</style>

</head>
<body>


	<!-- Weather -->
	<div class="container mt-5">
		<div class="text-center mb-30"><h3>🌱 오늘의 날씨</h3></div>
		<div class="d-flex flex-row justify-content-center align-items-center">
			<div class="weather__card" > <!-- style="background-image: url( '${pageContext.request.contextPath}/resources/img/bg-img/sky.jpg' );">  -->
				<div class="d-flex flex-row justify-content-center align-items-center" id="todayWeather">
					<div class="p-3 text-center">
						<h2><span></span>15&deg;</h2>
						<div>최고 <span id="mxTemp"></span>&deg; / 최저 <span id="minTemp"></span>&deg;</div>
					</div>
					<div class="p-3">
						<!-- 임시 img -->
						<img src="${pageContext.request.contextPath}/resources/img/weather/Sun.png">
					</div>
					<div class="p-3 text-right">
						<h5 class="mt-20 mb-20"><!-- 오늘 날짜 --></h5>
						<h3>서울</h3>
						<span class="weather__description">구름많음</span>
					</div>
				</div>
				<div
					class="weather__status d-flex flex-row justify-content-center align-items-center mt-3">
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="${pageContext.request.contextPath}/resources/img/weather/RainyPercent.png"> <span>10%</span>
					</div>
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="${pageContext.request.contextPath}/resources/img/weather/WindPercent.png"> <span>0.53 mB</span>
					</div>
<!-- 					<div class="p-4 d-flex justify-content-center align-items-center"> -->
<!-- 						<span class="weather__description">구름 많음</span> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		
		<!-- Weather Forecast -->
		<div class="weather__forecast d-flex flex-row justify-content-center align-items-center mt-3">
			<div class="p-4 d-flex flex-column justify-content-center align-items-center">
				<div><span style="color:#07d007">2:00</span></div>
				<div class="mb-15 mt-15">
					<img src="${pageContext.request.contextPath}/resources/img/weather/Fog.png">
				</div>
				<div><span>15&deg;</span></div>
				<div><span>강수확률</span></div>
				<div><span>습도</span></div>
				<div><span>상태</span></div>
			</div>
		</div>
		
		
	</div>
	
	
	
	<script type="text/javascript">
		
		$(function(){
			
			let date = new Date();
			let year = date.getFullYear();
			let month = ("0" + (date.getMonth() + 1)).substr(-2);
			
			let lastday = ("0" + (date.getDate() - 1)).substr(-2);		//어제 날짜
			let tday = ("0" + (date.getDate())).substr(-2);				//오늘 날짜
			
			//전날
			let baseDate = year + month + lastday;
			
			//오늘
			let today  = year + month + tday;
			$("#todayWeather h5").text(year + "/" + month + "/" + tday);
			
			
			let numOfRows = 1000;
			
			
			$.ajax({
				url: "showTodayWeather.wv",
				data: {
					baseDate : baseDate,
					numOfRows : numOfRows
				},
				success: function(result){
					
// 					console.log(result);
					
					let items = result.response.body.items.item;	//JSON item 변수
					
					//오늘날짜 필터링하기
					let todayItems = items.filter(function(item){
						return item.fcstDate == today;
					});
					
					
					//오늘 최저기온/최고기온
					let mxmnTemp = todayItems.filter(function(item){
						return item.category == 'TMX' || item.category == 'TMN';
					});
					
					for(var i in mxmnTemp){
						if(mxmnTemp[i].category == 'TMX'){
							$("#mxTemp").text(mxmnTemp[i].fcstValue); //최고기온 넣기
						}else{
							$("#minTemp").text(mxmnTemp[i].fcstValue); //최저기온 넣기
						}
					}
					
					
					
					//예측 시간
					var forcastTime = ['0200', '0500', '0800', '1100', '1400', '1700', '2000', '2300'];
					
					var forcastTimes = [];
					
					for(var i in forcastTime/*8*/){
						
						//예측시간별 필터링
						let forcastInfoByTimes = todayItems.filter(function(item){
							return item.fcstTime == forcastTime[i];
						});
						
						forcastTimes.push(forcastInfoByTimes);

					}
					
					
					/*				
						POP: 강수확률
						PTY: 강수형태
						PCP: 1시간 강수량
						REH: 습도
						SKY: 하늘상태
					*/					
					
					var fcstTimes = []; 
					
					for(var i in forcastTimes){
						
						var fcst = [forcastTime[i]]
						
						for(var k in forcastTimes[i]){
							
							if(forcastTimes[i][k].category == 'POP'){
								fcst.push(forcastTimes[i][k].fcstValue);
							}if(forcastTimes[i][k].category == 'PTY'){
								fcst.push(forcastTimes[i][k].fcstValue);
							}if(forcastTimes[i][k].category == 'REH'){
								fcst.push(forcastTimes[i][k].fcstValue);
							}if(forcastTimes[i][k].category == 'SKY'){
								fcst.push(forcastTimes[i][k].fcstValue);
							}if(forcastTimes[i][k].category == 'TMP'){
								fcst.push(forcastTimes[i][k].fcstValue);
							}
						}
						
						fcstTimes.push(fcst);
						
					}
					
					console.log(fcstTimes);
					
					

					

					
					
				}
			})
	
		})
		
		
		
		
		
		//조회 함수
		function makeTodayWeather(filterItems){
			
			console.log(filterItems);

			
			var tableHTML = '';
			
			filterItems.forEach((forcast) => {
				
				console.log(forcast.fcstDate);
				console.log(forcast.fcstTime);
				console.log(forcast.fcstValue);
				
				tableHTML += 
					"<div><p>날짜: " + forcast.fcstDate + "</p>" + 
						"<p>예측시간: " + (forcast.fcstTime).substr(0,2) + "시 기준</p>" +
						"<p>온도: " + forcast.fcstValue/*fcstValue: 예보값*/ + "</p></div><hr>";
						
			});
			
			$("#todayWeather h5").text(/*year +'년 '+ month + "월" + day + "일"*/today);
			
			$("#forcastInfo").html(tableHTML);
			
		}
	
	</script>



	<!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
</body>
</html>