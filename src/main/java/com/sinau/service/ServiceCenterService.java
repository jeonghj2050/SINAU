package com.sinau.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import javax.websocket.Session;*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.ServiceCenterDao;
import com.sinau.dto.FilesDto;
import com.sinau.dto.MemberDto;
import com.sinau.dto.QuestionDto;
import com.sinau.dto.QuestionInfoDto;
import com.sinau.dto.RefundInfoDto;
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
			rttr.addFlashAttribute("check", "2");
			if(fcheck == 1) {
				//업로드할 파일이 있음.
				fileUp(multi, question);
			}
		}catch (Exception e) {
			//DB 삽입 오류 시 글쓰기폼으로 돌아감.
			view = "redirect:servicecenter_question";
			rttr.addFlashAttribute("check","1");
		}

		return view;
	}

	private void fileUp(MultipartHttpServletRequest multi, QuestionDto question) 
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
		fmap.put("q_code", question.getQ_code());
		fmap.put("q_cts_code", question.getQ_cts_code());

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

	public ModelAndView getContents(String q_code) {
		mv = new ModelAndView();
		
		//게시글 번호로 글 내용 검색 결과 받아오기.(DB) 
		QuestionInfoDto question = scDao.getContents(q_code);
		mv.addObject("question", question);

		//게시글 번호에 해당하는 파일 정보 목록(DB)
		List<FilesDto> bfList = scDao.getQuestionList(q_code);
		mv.addObject("bfList", bfList);
		
		mv.setViewName("servicecenter/servicecenter_info");
		
		return mv;
	}

	
	public ModelAndView updateFrm(String q_code, RedirectAttributes rttr) { 
		mv = new ModelAndView(); String view = null;

		QuestionInfoDto question = scDao.getContents(q_code); 
		MemberDto member = (MemberDto)session. getAttribute("mb"); String email = member.getM_email();

		if(question.getQ_m_email().equals(email)) { 
			mv.addObject("question", question); 
			List<FilesDto> bfList = scDao.getBfList(q_code);
				mv.addObject("bfList", bfList); view = "servicecenter/servicecenter_update";
				} else { 
				view = "redirect:contents?q_code=" + q_code;
				rttr.addFlashAttribute("check", 1); }
				mv.setViewName(view);
				return mv; 
				}
	
	
	@Transactional
	public String boardUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {

		String q_code = multi.getParameter("q_code");
		String q_title = multi.getParameter("q_title");
		String q_cts_code = multi.getParameter("q_cts_code");
		String q_content = multi.getParameter("q_content");
		int fcheck = Integer.parseInt(multi.getParameter("fileCheck"));


		q_content = q_content.trim();
		//int check = Integer.parseInt(
		//		multi.getParameter("fileCheck"));

		String m_email = multi.getParameter("m_email");

		QuestionDto question = new QuestionDto();
		question.setQ_code(q_code);
		question.setQ_title(q_title);
		question.setQ_cts_code(q_cts_code);
		question.setQ_m_email(m_email);	
		question.setQ_content(q_content);
		String view = null;
		
		try {
			scDao.boardUpdate(question);
		
			
			if(fcheck == 1) {
				
				String fname = scDao.getFileName(q_code);
				
				sysFileDel(fname);
				
				fileChange(multi, q_code);
			}

			rttr.addFlashAttribute("check", 2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			rttr.addFlashAttribute("check", 3);
		}

		view = "redirect:contents?q_code=" 
				+ q_code;

		return view;
	}

	private void fileChange(MultipartHttpServletRequest multi, String q_code)
			throws IllegalStateException, IOException {
		//저장공간의 물리적 경로 구하기
		String path = multi.getSession()
				.getServletContext()
				.getRealPath("/");

		path += "resources/upload/";

		File dir = new File(path);
		if(dir.isDirectory() == false) {
			//위에 설정한 경로의 폴더가 없다면
			dir.mkdir();//upload 폴더 생성.
		}

		//실제 파일명과 저장 파일명을 함께 관리
		Map<String, String> fmap = 
				new HashMap<String, String>();
		//map이 문자만 저장하도록 만들었기 때문에
		//게시글 번호를 문자열로 변환하여 저장.
		fmap.put("q_code", String.valueOf(q_code));

		boolean fResult = false;

		List<MultipartFile> fList = 
				multi.getFiles("files");

		for(int i = 0; i < fList.size(); i++) {
			//파일 메모리에 저장
			MultipartFile mf = fList.get(i);
			String oriName = mf.getOriginalFilename();
			fmap.put("oriFileName", oriName);
			String sysName = System.currentTimeMillis()
					+ "."
					+ oriName.substring
					(oriName.lastIndexOf(".")+1);
			fmap.put("sysFileName", sysName);

			mf.transferTo(new File(path+sysName));

			scDao.fileUpdate(fmap);
		}
	}
	

	private void sysFileDel(String fname) throws Exception {

		if(fname == null) {
			return;
		}

		String path = session.getServletContext().getRealPath("resources/upload/");

		File file = new File(path + fname);

		if(file.exists()){
			if(file.delete()){
				
			}else{
				throw new Exception("파일삭제 실패");
			}
		}else{
			throw new Exception("파일이 존재하지 않습니다.");
		}
	}

	public String deleteBoard(String q_code, RedirectAttributes rttr) {
		String view = null;

		try {
			// 파일 삭제
			String fname = scDao.getFileName(q_code);
			sysFileDel(fname);
			scDao.fileDelete(q_code);
			// 원글 삭제
			scDao.boardDelete(q_code);

			view = "redirect:servicecenter_question";
			rttr.addFlashAttribute("check", 3);
			
		}catch(Exception e) {
			view = "redirect:contents?q_code=" + q_code;
			rttr.addFlashAttribute("check", 4);
		}

		return view;
	}

	public String fileDelete(String fname) {
		String result = null;

		try {
			sysFileDel(fname);
			scDao.fDelByName(fname);
			result = "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = "fail";
		}
		return result;
	}

	public void fileDown(String sysFileName, HttpServletRequest req, HttpServletResponse resp) {
		//파일 경로 찾기
				String filePath = req.getSession()
						.getServletContext()
						.getRealPath("/") + "resources/upload/";

				//DB에서 sysFileName으로 oriFileName 검색
				String oriName = scDao.getOriName(sysFileName);

				//실제 파일 저장 폴더 경로와 파일 지정
				filePath += sysFileName;

				//서버의 디스크(폴더)에 저장된 파일을 읽어오는 객체
				InputStream is = null;
				//사용자의 컴퓨터에 파일을 보내는 객체
				OutputStream os = null;

				try {
					//파일명의 한글 깨짐 방지(encoding)
					String dFileName = URLEncoder.encode
							(oriName, "UTF-8");

					//파일 객체 생성
					File file = new File(filePath);
					//저장된 파일과 메모리 상의 파일 객체의 연결
					is = new FileInputStream(filePath);

					//응답(response) 객체의 헤더 설정.
					resp.setContentType("application/octet-stream");
					resp.setHeader("content-Disposition",
							"attachment; filename=\"" 
									+ dFileName + "\"");
					//attachment; filename="p2.jpg"

					//사용자 컴퓨터로 통로 연결
					os = resp.getOutputStream();

					//파일 전송
					byte[] buffer = new byte[1024];
					int length;
					while((length = is.read(buffer)) != -1) {
						os.write(buffer, 0, length);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						os.flush();//남아있는 출력 스트림의 데이터를
						//모두 전송해라~~~
						//출력 스트림(os)를 close하기 전에 flush 할것.
						os.close();
						is.close();
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

	public ModelAndView getRefundList() {
		
		mv = new ModelAndView();
		MemberDto member = (MemberDto)session.getAttribute("mb");
	
		String email = member.getM_email();
		
		List<RefundInfoDto> totalList = scDao.totalRefundList(email); 
		//System.out.println(lmap);
		//System.out.println(qList.get(0).getQ_code()); 
		
		mv.addObject("totalList", totalList);
		
		// view name을 지정!
		mv.setViewName("servicecenter/servicecenter_refund");
		
		return mv;
	}


	


	 

}
