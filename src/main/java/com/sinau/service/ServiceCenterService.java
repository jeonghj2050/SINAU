package com.sinau.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
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
	public String boardInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;

		
		//Multipart request에서 데이터 추출
		String title = multi.getParameter("q_title");
		String ctscode = multi.getParameter("q_cts_code");
		String contents = multi.getParameter("q_content");
		int fcheck = Integer.parseInt
				(multi.getParameter("fileCheck"));
		String eamil = multi.getParameter("q_m_email");
		/*//다음과 같이 세션에서 id값을 꺼내올 수도 있음.
		MemberDto mem = (MemberDto)session.getAttribute("mb");
		String id = mem.getM_id();
		 */

		//일반적으로 textarea에서 들어오는 데이터는
		//본 내용 앞 뒤에 쓸데없는 공백이 포함됨.
		//공백 제거 처리. trim()
		contents = contents.trim();

		QuestionDto question = new QuestionDto();
		question.setQ_m_email(eamil);
		question.setQ_cts_code(ctscode);
		question.setQ_title(title);
		question.setQ_content(contents);

		//insert, update, delete를 할 경우
		//웬만하면....... try/catch로 처리해 주세요...
		try {
			scDao.boardInsert(question);
			view = "redirect:servicecenter_question";
			rttr.addFlashAttribute("check", 2);
			if(fcheck == 1) {
				//업로드할 파일이 있음.
				fileUp(multi, question.getQ_code());
			}
		}catch (Exception e) {
			//DB 삽입 오류 시 글쓰기폼으로 돌아감.
			view = "redirect:servicecenter_question";
			rttr.addFlashAttribute("check", 1);
		}

		return view;
	}

	private void fileUp(MultipartHttpServletRequest multi, String q_code) 
			throws IllegalStateException, IOException {
		//파일은 실제 물리 경로를 사용하여 저장해야 함.
		// upload 폴더에 저장하도록 지정.
		// 상대 경로 : resources/upload/
		String filePath = multi.getSession()
				.getServletContext()
				.getRealPath("/") + "resources/upload/";

		//upload 폴더 만들기
		File folder = new File(filePath);
		if(folder.isDirectory() == false) {
			//경로를 설정한 폴더가 없다면
			folder.mkdir();//upload 폴더 생성
		}

		//실제 파일명과 저장 파일명을 함께 관리
		Map<String, String> fmap = 
				new HashMap<String, String>();
		//파일 정보 저장(DB)에 필요한 정보
		//1.게시글 번호, 2.실제파일명, 3.저장파일명
		fmap.put("q_code", q_code);

		//multipart에서 파일 꺼내오기
		//멀티파트는 파일을 배열형태로 저장.
		List<MultipartFile> fList =
				multi.getFiles("files");

		for(int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i);
			//파일의 실제 이름 가져오기
			String oriName = mf.getOriginalFilename();
			//실제 파일명을 맵에 저장
			fmap.put("oriFileName", oriName);
			//저장 파일명 작성(밀리초 값을 사용)
			String sysName = System.currentTimeMillis()
					+ "."
					+ oriName.substring
					(oriName.lastIndexOf(".") + 1);
			fmap.put("sysFileName", sysName);
			//로그에 찍어서 확인

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(filePath+sysName));
			//DB에 파일 정보 저장(dDao)
			scDao.fileInsert(fmap);
		}
	}

	 

}
