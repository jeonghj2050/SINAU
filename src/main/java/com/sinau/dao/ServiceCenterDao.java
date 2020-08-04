package com.sinau.dao;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

import com.sinau.dto.FilesDto;
import com.sinau.dto.QuestionDto;
import com.sinau.dto.QuestionInfoDto;

public interface ServiceCenterDao {

	List<QuestionDto> getList(String email);

	int getBoardCount();

	void boardInsert(QuestionDto question);

	void fileInsert(Map<String, String> fmap);

	QuestionInfoDto getContents(String q_code);

	List<FilesDto> getQuestionList(String q_code);




}
