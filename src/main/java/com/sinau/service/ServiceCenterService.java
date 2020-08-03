package com.sinau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.ServiceCenterDao;
import com.sinau.dto.MemberDto;
import com.sinau.dto.QuestionDto;
import com.sinau.util.Paging;

import lombok.extern.java.Log;

@Log
@Service
public class ServiceCenterService {

	@Autowired
	private ServiceCenterDao scDao;

	ModelAndView mv;

	@Autowired
	private HttpSession session;
			
	@Autowired
	private ServiceCenterDao qDao;


	public ModelAndView getQnaList() {
		mv = new ModelAndView();
		MemberDto member = (MemberDto)session.getAttribute("mb");
		
		String email = member.getM_email();

		List<QuestionDto> qList = scDao.getList(email);
		//System.out.println(lmap);
		//System.out.println(qList.get(0).getQ_code()); 

		mv.addObject("qList", qList);

		
		// view name을 지정!
		mv.setViewName("servicecenter/servicecenter_question");

		return mv;
	}

	@Transactional	
	public String questionInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;

		String title = multi.getParameter("q_title");
		String category = multi.getParameter("q_cts_code");
		String contents = multi.getParameter("q_content");
		String eamil = multi.getParameter("q_m_email");
	

		//일반적으로 textarea에서 들어오는 데이터는
		//본 내용 앞 뒤에 쓸데없는 공백이 포함됨.
		//공백 제거 처리. trim()
		contents = contents.trim();

		QuestionDto question = new QuestionDto();
		question.setQ_title(title);
		question.setQ_cts_code(category);
		question.setQ_content(contents);
		question.setQ_m_email(eamil);

		//insert, update, delete를 할 경우
		//웬만하면....... try/catch로 처리해 주세요...
		try {
			System.out.println(question + " 11111111111111111111111111111111111111111111111111111111111111111111111");
			scDao.questionInsert(question);
			System.out.println(question + "222222222222222222222222222222222222222222222222222222222");
			view = "redirect:servicecenter_question";
			rttr.addFlashAttribute("check", 2);
		}catch (Exception e) {
			//DB 삽입 오류 시 글쓰기폼으로 돌아감.
			view = "redirect:servicecenter_question";
			rttr.addFlashAttribute("check", 1);
		}

		return view;
	}




	 

}
