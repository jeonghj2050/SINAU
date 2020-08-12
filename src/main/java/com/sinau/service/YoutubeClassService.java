package com.sinau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ServiceCenterDao;
import com.sinau.dao.YoutubeClassDao;
import com.sinau.dto.FilesDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.QuestionDto;
import com.sinau.dto.QuestionInfoDto;
import com.sinau.dto.YoutubeDto;
import com.sinau.dto.YoutubeInfoDto;

@Service
public class YoutubeClassService {
		
		ModelAndView mv;
	
		@Autowired
		private YoutubeClassDao ycDao;
		
	public ModelAndView getYcList() {
		
		mv = new ModelAndView();
	
		
		List<YoutubeDto> yc10List = ycDao.getList();
		List<YoutubeDto> ycList = ycDao.getycList();
		//System.out.println(lmap);
		//System.out.println(qList.get(0).getQ_code()); 
		
		
		mv.addObject("yc10List", yc10List);
		mv.addObject("ycList", ycList);
		
		// view name을 지정!
		mv.setViewName("youtube/youtube_main");
		
		return mv;
	}

	public ModelAndView getContents(String y_code) {
		mv = new ModelAndView();
		
		ycDao.viewUpdate(y_code);
		
		//게시글 번호로 글 내용 검색 결과 받아오기.(DB) 
		YoutubeInfoDto youtube = ycDao.getContents(y_code);
		mv.addObject("youtube", youtube);

		//게시글 번호에 해당하는 파일 정보 목록(DB)
		List<FilesDto> yfList = ycDao.getYoutubeList(y_code);
		mv.addObject("yfList", yfList);
		
		mv.setViewName("youtube/youtube_info");
		
		return mv;
	}
}
