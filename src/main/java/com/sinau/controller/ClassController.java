package com.sinau.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dto.LikesDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.VideoListDto;
import com.sinau.service.ClassService;

import lombok.extern.java.Log;

@Controller
@Log
public class ClassController {
	ModelAndView mv;
	@Autowired
	ClassService cServ = new ClassService();
	
	@GetMapping("online")
	public ModelAndView online() {
		
		mv = cServ.getOnList();
		
		return mv;
	}
	
	@GetMapping("onlineInfo")
	public ModelAndView onlineInfo(String onc_code) {
		
		mv = cServ.getOnlineInfo(onc_code);
		
		return mv;
	}
	
	@PostMapping(value = "likes", produces = "application/json; charset = utf-8")
	@ResponseBody
	public LikesDto likeAjax(String onc_code,String l_cts_code){
		log.info(onc_code + l_cts_code);

		LikesDto likes = cServ.updateLikes(onc_code,l_cts_code);
	
		return likes;
	}
	     
	@PostMapping(value = "dislikes", produces = "application/json; charset = utf-8")
	@ResponseBody
	public LikesDto dislikeAjax(String onc_code, String l_cts_code){
		log.info(onc_code+ l_cts_code);

		LikesDto dislikes = cServ.updatedisLikes(onc_code, l_cts_code);
	
		return dislikes;
	}
	
	@GetMapping("classroom")
	public ModelAndView classroom(String onc_code) {
		
		mv = cServ.classroom(onc_code);
		
		return mv;
	}
	
	@PostMapping(value = "videoChange", produces = "application/json; charset = utf-8")
	@ResponseBody
	public VideoListDto videoChange(String vf_code, String onc_code){
		log.info(vf_code+ onc_code);

		VideoListDto videoChange = cServ.videoChange(vf_code, onc_code);
			return videoChange;
	}

	@PostMapping(value = "getFilter", produces = "application/json; charset = utf-8")
	@ResponseBody
	public Map<String, List<OffListDto>> getOffCateFilterList(String cts_code, String filter){
		OffListDto offCateFilter = new OffListDto();
		
		Map<String, List<OffListDto>> fMap = cServ.getOffCateFilter(cts_code, filter);
		
		return fMap;
	}
	
	//코드에 따라 강의 정보를 가져오는 메소드
	@GetMapping("info")
	public ModelAndView offClass(String ofc_code) {
		log.info("ofc_code : " + ofc_code);
		
		//DB에서 offcode(오프라인 강의 코드)에 해당하는 게시글 정보를 가져와서 model에 추가
		
		mv = cServ.getOffInfo(ofc_code);
		
		return mv;
	}
	
	//카테고리 코드에 따라 강의 리스트를 가져오는 메소드
		@GetMapping("cate")
		public ModelAndView offCate(String cts_code) {
			log.info("cts_code : " + cts_code);
			
			mv = cServ.getOffCateList(cts_code);
			
			
			return mv;
		}
		
	//오프라인 카테고리에 따라 강의 목록 가져오는 메소드
	@GetMapping("offline")
	public ModelAndView offline() {
		log.info("offlineInfo()");
		mv = cServ.getOffList();
		
		
		return mv;
	}
	
	//강좌 상세 화면에서 회원 m_email를 포함한채 강좌 ofc_code에 해당하는 scList 출력하는 메소드 
	@GetMapping("apply")
	public ModelAndView offApply(String pay_pcode) {
		log.info("offlineApply()" + pay_pcode);
		mv = cServ.getOffApply(pay_pcode);
		
		return mv;
	}
	
	@PostMapping(value = "offlikes", produces = "application/json; charset = utf-8")
	@ResponseBody
	public LikesDto offlikeAjax(String ofc_code,String l_cts_code){
		log.info(ofc_code + l_cts_code);

		LikesDto likes = cServ.offupdateLikes(ofc_code,l_cts_code);
	
		return likes;
	}
	     
	@PostMapping(value = "offdislikes", produces = "application/json; charset = utf-8")
	@ResponseBody
	public LikesDto offdislikeAjax(String ofc_code, String l_cts_code){
		log.info(ofc_code+ l_cts_code);

		LikesDto dislikes = cServ.offupdatedisLikes(ofc_code, l_cts_code);
	
		return dislikes;
	}
}












