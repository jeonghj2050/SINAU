package com.sinau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ServiceCenterDao;
import com.sinau.dto.QuestionDto;
import com.sinau.util.Paging;

@Service
public class ServiceCenterService {

	@Autowired
	private ServiceCenterDao sDao;
	
	ModelAndView mv;
	
	@Autowired
	private HttpSession session;
	
	private int listCount = 5;
	private int pageCount = 2;
		
	public ModelAndView getQnaList(Integer pageNum) {
		System.out.println("1111111111111111111111111111111;jkdfl");
		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		//맵을 만들어서 페이지번호와 글목록 개수를 저장
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));

		List<QuestionDto> qList = sDao.getList(lmap);
		
		System.out.println(qList.get(0).toString());

		mv.addObject("qList", qList);

		String paging = getPaging(num);
		mv.addObject("paging", paging);

		//세션에 페이지 번호 저장.
		session.setAttribute("pageNum", num);

		//view name을 지정!
		mv.setViewName("servicecenter/servicecenter_main");

		return mv;
	}

	private String getPaging(int num) {
		//전체 글 개수 구하기
		int maxNum = sDao.getBoardCount();
		String listName = "list";//게시판 uri

		Paging paging = new Paging(maxNum, num, 
				listCount, pageCount, listName);

		String pagingHtml = paging.makePaging();

		return pagingHtml;
	}
	

}
