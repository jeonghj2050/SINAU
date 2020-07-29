package com.sinau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Service
public class ServiceCenterService {

	@Autowired
	private ServiceCenterDao sDao;

	ModelAndView mv;

	@Autowired
	private HttpSession session;
			
	@Autowired
	private ServiceCenterDao qDao;


	public ModelAndView getQnaList() {
		mv = new ModelAndView();
		MemberDto member = (MemberDto)session.getAttribute("mb");
		
		String email = member.getM_email();

		List<QuestionDto> qList = sDao.getList(email);
		//System.out.println(lmap);
		//System.out.println(qList.get(0).getQ_code()); 

		mv.addObject("qList", qList);

		
		// view name을 지정!
		mv.setViewName("servicecenter/servicecenter_question");

		return mv;
	}

	@Transactional
	public String boardInsert(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = null;

		//Multipart request에서 데이터 추출
		String title = multi.getParameter("p_title");
		String email = multi.getParameter("p_m_email");
		String contents = multi.getParameter("p_content");
		String ctscode = multi.getParameter("p_cts_code");
		
		/*//다음과 같이 세션에서 id값을 꺼내올 수도 있음.
		MemberDto mem = (MemberDto)session.getAttribute("mb");
		String id = mem.getM_id();
		 */

		//일반적으로 textarea에서 들어오는 데이터는
		//본 내용 앞 뒤에 쓸데없는 공백이 포함됨.
		//공백 제거 처리. trim()
		contents = contents.trim();

		QuestionDto Quest = new QuestionDto();
		Quest.setQ_title(title);
		Quest.setQ_m_email(email);
		Quest.setQ_content(contents);
		Quest.setQ_cts_code(ctscode);

		//insert, update, delete를 할 경우
		//웬만하면....... try/catch로 처리해 주세요...
		System.out.println(Quest + "1111111111111111111111111111111");
		try {
			qDao.boardInsert(Quest);

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
