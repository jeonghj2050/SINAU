package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class YoutubeInfoDto {
	private String y_code;
	private String y_title;
	private String y_subtitle;
	private String y_content;
	private String y_profile;
	private String y_url;
	private String y_userurl;
	private Timestamp y_update;
	private String cts_name;
	private String y_videosoure;
	private String f_sysname;
}
