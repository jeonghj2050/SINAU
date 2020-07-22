package com.sinau.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dao.MemberDao;
import com.sinau.dto.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	private ModelAndView mv;
	
	
	
	public String idCheck(String memail) {
		String result = null;

		try {
			
			//cnt : �ߺ� id�� ���� ��� 1, ���� ��� 0
			int cnt = mDao.idCheck(memail);
			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	public ModelAndView memberInsert(Member member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;
		
		//��й�ȣ ��ȣȭ ó��
		//������ ��ť��Ƽ�� ��ȣȭ�� ����.
		//��ȣȭ�� ������.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();
		
		//���� ���ڴ��� ����Ͽ� �� ��й�ȣ�� 
		//��ȣ ��й�ȣ�� ����
		String encPwd = pwdEncoder.encode(member.getM_pwd());
		//��ȣȭ�� ��й�ȣ�� member�� �ٽ� ����
		member.setM_pwd(encPwd);
		
		try {
			//member�� �����͸� DB ����(insert)
			mDao.memberInsert(member);
			//ȸ�� ��� ���� -> �α��� ȭ������ ��ȯ
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "���� ����");
		} catch (Exception e) {
			// ȸ�� ��� ���� -> ���� ȭ�鿡 ���� �޽��� ����
			//e.printStackTrace();
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("msg", "���̵� �ߺ�");
		}
		
		mv.setViewName(view);
		return mv;
	}




}
