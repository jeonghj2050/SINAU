package com.sinau.dto;
import java.sql.Date;
import lombok.Data;

@Data
public class AdSWDto {
	private int w_num;
	private String contents;
	private String contentnum;
	private String states;
	private String name;
	private Date dates;
	private String code;
	private String prv_content;
}
