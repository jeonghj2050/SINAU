package com.sinau.dto;

import lombok.Data;

@Data
public class ProductListDto {
	private int rnum;
	private String p_code;
	private String p_title;
	private String f_code;
	private String f_sysname;
	private String cts_name;
	private int l_count;
	private int p_price;
}

