package com.sinau.dto;
import java.sql.Date;
import lombok.Data;

@Data
public class AdSQnaDto {
	private int q_num;
	private String title;
	private String content;
	private String email;
	private String name;
	private Date dates;
	private String q_code;
}
