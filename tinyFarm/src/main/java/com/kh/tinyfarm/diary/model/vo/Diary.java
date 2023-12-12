package com.kh.tinyfarm.diary.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Diary {
	private int diaryNo;
	private int categoryNo;
	private int boardWriter;
	private String startDate;
	private String endDate;
	private String diaryTitle;
	private String diaryContent;
	private String selectOpen;
	private String createDate;
	private String status;
}
