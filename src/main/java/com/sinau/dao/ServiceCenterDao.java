package com.sinau.dao;

import java.util.List;
import java.util.Map;

import com.sinau.dto.QuestionDto;

public interface ServiceCenterDao {

	List<QuestionDto> getList(Map<String, String> lmap);

	int getBoardCount();

}
