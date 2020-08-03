package com.sinau.dao;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

import com.sinau.dto.QuestionDto;

public interface ServiceCenterDao {

	List<QuestionDto> getList(String email);

	int getBoardCount();

	void questionInsert(QuestionDto question);

	void boardInsert(QuestionDto question);



}
