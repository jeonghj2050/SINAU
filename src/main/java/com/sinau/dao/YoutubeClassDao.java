package com.sinau.dao;

import java.util.List;

import com.sinau.dto.FilesDto;
import com.sinau.dto.QuestionDto;
import com.sinau.dto.QuestionInfoDto;
import com.sinau.dto.YoutubeDto;
import com.sinau.dto.YoutubeInfoDto;

public interface YoutubeClassDao {

	List<YoutubeDto> getList();

	List<YoutubeDto> getycList();

	YoutubeInfoDto getContents(String y_code);

	void viewUpdate(String y_code);

	List<FilesDto> getYoutubeList(String y_code);


	
}
