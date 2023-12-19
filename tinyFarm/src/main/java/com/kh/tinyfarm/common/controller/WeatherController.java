package com.kh.tinyfarm.common.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class WeatherController {
	
	
	public static final String SERVICEKEY = "69L52kVDgnIQoRCnUAOTqOVOrVQCm7q%2FgxzjlEheVxS7VMVjjdj0fpreRoCiXo4YAs97AVoEKkXoQHhumgpk1g%3D%3D";
	private static final Logger logger = LoggerFactory.getLogger(WeatherController.class);
	
	
	
	@GetMapping("/weatherView.wv")
	public String weather() {
		return "common/weather/weather_today";
	}
	
	

	@ResponseBody
	@RequestMapping(value = "showTodayWeather.wv", produces = "application/json; charset=UTF-8") /*json 방식 응답*/
	public String weatherView(String baseDate, String numOfRows) throws Exception {
		
		System.out.println(baseDate);
		
		//자바에서 요층 및 응답데이터 추출해보기
		//OPEN API에 요청할 URL 준비하기
		
		//+https를 http로 변경: 사용하는 url 객체와 맞지 않기 때문에
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		
		url += "?serviceKey=" + SERVICEKEY;	//서비스 키 추가하기
		url += "&pageNo=" + 1;
		url += "&numOfRows=" + numOfRows;
		url += "&dataType=JSON";
		url += "&base_date=" + baseDate;
		url += "&base_time=2300";
		url += "&nx=" + 55;				//위도(변수처리 예정)
		url += "&ny=" + 127;			//경도(변수처리 예정)

		//요청하고자 하는 url을 전달하면서 URL 객체 생성
		URL requestUrl = new URL(url);
		
		
		System.out.println(requestUrl);
		
		
		//다운캐스팅
		HttpURLConnection urlCon = (HttpURLConnection)requestUrl.openConnection(); 
		
		
		//요청에 필요한 설정 해주기 (get) header method 설정하기
		//get방식 요청 설정
		urlCon.setRequestMethod("GET");
		
		
		//해당 openApi 서버로 요청 후 연결 스트림을 이용하여 응답 데이터 읽어오기 (추출하기)
		//BufferedReader는 보조스트림이라서 기반스트림이 꼭 필요하다
		BufferedReader br = new BufferedReader(new InputStreamReader/*문자 읽을 때 사용*/(urlCon.getInputStream()));
		
		String responseStr = "";
		String line;
		
		//더 이상 읽을 데이터가 없으면 null을 반환(문자열이므로)
		//null을 읽어올 때까지 문자열 읽어오기 작업
		while((line = br.readLine())/*한줄씩 읽어오기*/ != null) {
			//br.readLine()이 수행되면 한 줄을 읽어버리기 때문에 변수처리해준다.
			responseStr += line;
		}
		
		
		br.close();
		urlCon.disconnect();
		
		return responseStr;
		
		
	}
	
}
