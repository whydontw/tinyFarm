package com.kh.tinyfarm.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BoardReport {
	private int reportNo;
	private String reportWriter;
	private int refBno;
	private String category;
	private String reportContent;
	private Date createDate;
	private String status;
}
