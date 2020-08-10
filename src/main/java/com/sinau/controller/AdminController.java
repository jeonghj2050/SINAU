package com.sinau.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.AdminDto;
import com.sinau.dto.MemberDto;
import com.sinau.service.AdminService;
import com.sinau.service.CommonService;
import com.sinau.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
public class AdminController {
	ModelAndView mv;

	@Autowired
	private AdminService aServ;

	//이 메소드는 나중에 BoardController로 이전할 예정임.
	@GetMapping("list")//list?pageNum=3
	public ModelAndView AdmemberList(Integer pageNum) {
		log.info("AdmemberList()"+pageNum);

		mv = aServ.getAdminList(pageNum);		

		return mv;
	}

	//회원관리 (가입승인(메인))
	@GetMapping("adMApproval")
	public ModelAndView adMApproval(String tabId, Integer pageNum) {
		log.info("sfgsfdgsdfgsdfgf");

		mv = aServ.adMemList(tabId);

		return mv;
	}


	//회원관리 (정보수정)
	@GetMapping("adMList")
	public ModelAndView adMList(String tabId) {
		//return "admin/ad_mem_list";
		mv = aServ.adMList(tabId);

		return mv;

	}
	//게시글관리 (강의)
	@GetMapping("adPLecture")
	public ModelAndView adPLecture() {

		mv = aServ.adPLecture();

		return mv;
		//return "admin/ad_post_lecture";
	}
	//게시글관리 (판매)
	@GetMapping("adPStore")
	public ModelAndView adPStore() {
		//return "admin/ad_post_sale";
		mv = aServ.adPStore();

		return mv;
	}
	//게시글관리 (댓글리뷰)
	@GetMapping("adPReview")
	public ModelAndView adPReview() {
		//return "admin/ad_post_review";
		mv = aServ.adPReview();

		return mv;
	}
	//고객센터 (
	@GetMapping("adSQna")
	public ModelAndView adSQna() {
		//return "admin/ad_serv_qna";
		mv = aServ.adSQna();

		return mv;
	}
	//게시글관리 (댓글리뷰)
	@GetMapping("adSWarning")
	public ModelAndView adSWarning() {
		//return "admin/ad_serv_warning";
		mv = aServ.adSWarning();

		return mv;
	}
	//회원 비승인(삭제)
	@GetMapping("delNAp")
	public ModelAndView delNoApproval(String email, String tabId) {
		mv = aServ.appDelete(email, tabId);

		return mv;
	}
	//회원 삭제
	@GetMapping("delTemp")
	public ModelAndView delMethod(String email, String tabId) {
		System.out.println(email + "," + tabId);
		//삭제
		mv = aServ.memberDelete(email, tabId);

		//		//리스트
		//		mv = aServ.adMList();

		return mv;
	}
	//강의 삭제
	@GetMapping("delLec")
	public ModelAndView delLecture(String code) {

		mv = aServ.lecDelete(code);

		return mv;
	}
	//판매 삭제
	@GetMapping("delSale")
	public ModelAndView delSale(String code) {

		mv = aServ.saleDelete(code);

		return mv;
	}
	//리뷰 삭제
	@GetMapping("delRe")
	public ModelAndView delReview(String code) {

		mv = aServ.reviewDelete(code);

		return mv;
	}
	
	
//	//회원 삭제
//	@PostMapping(value = "memberDelete",produces = "application/json; charset=utf-8")
//	@ResponseBody
//    public Map<String, List<AdminDto>> 
//    getMemStateNm(String m_email){
//     int result =0;
//     AdminDto memDel = new AdminDto();
//     
//     Map<String, List<AdminDto>> rMap =aServ.deleteMember(m_email);   
//     
//     
//     return rMap;
//	}
}
