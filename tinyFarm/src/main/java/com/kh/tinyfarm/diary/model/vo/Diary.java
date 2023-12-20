package com.kh.tinyfarm.diary.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Diary {
	private int diaryNo;
	private int categoryNo;
	private int diaryWriter;
	private Date selectDate;
	private String diaryTitle;
	private String diaryContent;
	private String selectOpen;
	private String createDate;
	private String status;
}
