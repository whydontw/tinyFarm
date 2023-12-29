package com.kh.tinyfarm.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Payments {
//	PAYMENT_NO	NUMBER
//	PAYMENT_METHOD	VARCHAR2(100 BYTE)
//	PAYMENT_PRICE	NUMBER
//	PRODUCT_NO	NUMBER
//	USER_NO	NUMBER
//	BUYER_ADDRESS	VARCHAR2(200 BYTE)
//	ORDER_NO	NUMBER
//	BUYER_EMAIL	VARCHAR2(100 BYTE)
//	BUYER_PHONE	VARCHAR2(13 BYTE)
//	BUYER_NAME	VARCHAR2(20 BYTE)
//	ORDER_REQUIRED	VARCHAR2(300 BYTE)
//	ORDER_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
	
	private String paymentNo;
	private String paymentMethod;
	private int paymentPrice;
	private int productNo;
	private int userNo;
	private String buyerAddress;
	private String orderNo;
	private String buyerEmail;
	private String buyerPhone;
	private String buyerName;
	private String orderRequired;
	private String orderDate;
	private String status;
	private String productTitle;
	private String sellerName;
	

}
