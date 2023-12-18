<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>간단한 날씨 앱</h1>
    
    
    <button onclick="getLocation()">날씨 확인하기</button>
    <div id="weather-container">
        <h2 id="city-name"></h2>
        <p id="current-weather"></p>
        <p id="forecast"></p>
    <div>
  
    <script>
        const API_KEY = "68a1c5134ecb8af7452e8cd0b8c4af85";
        const weatherContainer = document.getElementById("weather-container");
        const cityName = document.getElementById("city-name");
        const currentWeatherElement = document.getElementById("current-weather");
        const forecastElement = document.getElementById("forecast");

        function getLocation() {
            navigator.geolocation.getCurrentPosition((position) => {
                getWeather(position.coords.latitude, position.coords.longitude);
            }, (error) => {
                alert("위치 정보를 가져올 수 없습니다. 브라우저의 위치 서비스를 확인해 주세요.");
            });
        }

        async function getWeather(lat, lon) {
        	const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`);
            const weatherData = await response.json();

            const forecastResponse = await fetch(`https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`);
            const forecastData = await forecastResponse.json();

            displayWeather(weatherData, forecastData);
        }

        function displayWeather(weatherData, forecastData) {
            cityName.innerText = weatherData.name;
            currentWeatherElement.innerText = "현재 날씨: ${weatherData.weather[-1].description}, 온도: ${weatherData.main.temp} ℃";

//             let forecastString = "일주일 날씨 예보:";
//             forecastData.list.slice(0, 7).forEach(day => {
//                 forecastString += ` ${day.dt_txt.split(" ")[0]} - ${day.weather[0].description}, 온도: ${day.main.temp} ℃;`;
//             });
            forecastElement.innerText = forecastString;

//             weatherContainer.style.display = "block";
        }
    </script>
</body>
</html>
</html>