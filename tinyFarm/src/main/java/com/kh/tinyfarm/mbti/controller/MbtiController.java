package com.kh.tinyfarm.mbti.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.kh.tinyfarm.mbti.model.service.MbtiService;
import com.kh.tinyfarm.mbti.model.vo.GardenFile;
import com.kh.tinyfarm.mbti.model.vo.InGardenMbti;
import com.kh.tinyfarm.publicPlant.model.vo.InGardenPlantList;

@Controller
public class MbtiController {

	@Autowired
	private MbtiService mbtiService;

	@RequestMapping("moveMbtiTest.bo")
	public String moveMbtiTest() {
		return "mbti/mbtiTest";
	}

	@ResponseBody
	@RequestMapping(value = "selectContentNo.mt", produces = "application/json; charset=UTF-8")
	public ArrayList<GardenFile> selectCntntsNo(int pageNo, InGardenMbti igm) throws IOException {
		System.out.println("igm : " + igm);
		ArrayList<InGardenMbti> cnList = mbtiService.selectCntntsNo(igm);
		System.out.println("cnList : " + cnList);
		
		ArrayList<GardenFile> list = new ArrayList();
		
		//각각의 cntntsNo일때 실행해야함
			
		System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
		for(int i=0;i<cnList.size();i++) {
			System.out.println(cnList.get(i).getCntntsNo());
			
			
			
			// 농사로api에서 추천리스트 받아오기
			String apiKey = "20231128LKLLXWVMAXGGYTETEWAOBA";
			String serviceName = "garden";
			String operationNameList = "gardenFileList";

			String parameter = "/" + serviceName + "/" + operationNameList;
			parameter += "?apiKey=" + apiKey;
			parameter += "&cntntsNo="+cnList.get(i).getCntntsNo();  //cnList의 cntntsNo넣기

			URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
			HttpURLConnection urlCon = (HttpURLConnection) apiUrl.openConnection();
			urlCon.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));

			String responseText = "";
			String line;

			while ((line = br.readLine()) != null) {
				responseText += line;
			}
			System.out.println("responseText : "+responseText);
			try {
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();

				Document document = builder.parse(new InputSource(new StringReader(responseText)));
				NodeList cntntsNoList = document.getElementsByTagName("cntntsNo");
				NodeList cntntsSjList = document.getElementsByTagName("cntntsSj");
				NodeList rtnFileUrlList = document.getElementsByTagName("rtnFileUrl");
				NodeList rtnImgSeCodeList = document.getElementsByTagName("rtnImgSeCode");
				
				//for (int j = 0; j < cntntsNoList.getLength(); j++) {
					int j=0;
					Node node = cntntsNoList.item(j);
					Node node2 = cntntsSjList.item(j);
					Node node3 = rtnFileUrlList.item(j);
					Node node4 = rtnImgSeCodeList.item(j);


					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Node childNode = node.getChildNodes().item(0); 
						Node childNode2 = node2.getChildNodes().item(0);
						Node childNode3 = node3.getChildNodes().item(0);
						Node childNode4 = node4.getChildNodes().item(0);
						
						
						
						GardenFile gp = new GardenFile();
						gp.setCntntsNo(Integer.parseInt(childNode.getNodeValue()));
						gp.setCntntsSj(childNode2.getNodeValue());
						gp.setRtnFileUrl(childNode3.getNodeValue().split("\\|"));
						gp.setRtnImgSeCode(childNode4.getNodeValue().split("\\|"));

						
						list.add(gp);
					}
			//	}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		System.out.println("이거나오냐?");
		System.out.println("list : "+list);
		
		
		
		return list;
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="recommendPlantList.mt",
	 * produces="application/json; charset=UTF-8") public
	 * ArrayList<InGardenPlantList>recommendPlantList(InGardenMbti igm){
	 * 
	 * 
	 * return list; }
	 */
}
