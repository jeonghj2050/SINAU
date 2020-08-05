package com.sinau.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sinau.dao.ClassDao;
import com.sinau.dao.CommonDao;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.OrderDto;

import lombok.extern.java.Log;

@Service
@Log
public class CommonService {
	ModelAndView mv;
	
	@Autowired
	ClassDao cDao;
	@Autowired
	CommonDao cmDao;
	
	public void fileUp(MultipartHttpServletRequest multi, int f_pcode,String sort) throws IllegalStateException, IOException {
		//파일을 실제 물리 경로에 저장
		//upload폴더에 저장
		//"/src/main/webapp/resources/upload
		String path=multi.getSession().getServletContext().getRealPath("/")+"resources/upload/";
		log.info(path);

		//upload 폴더 만들기
		File folder=new File(path);
		//folder가 디렉토리가 아니거나 존재하지 않는다면
		if(folder.isDirectory()==false) {
			folder.mkdir();
		}
		//실제 파일명과 저장 파일명을 저장하기 위한 hashmap
		Map<String , String> fmap=new HashMap<String, String>();
		//파일 정보 저장(db)에 필요한 정보
		//강의 번호,실제파일명,저장파일명
		fmap.put("f_pcode",String.valueOf(f_pcode));

		//multi에서 파일 가져오기(여러개의 파일이 넘어 올 수도 있다.)
		List<MultipartFile> fList=multi.getFiles("files");

		for(int i=0;i<fList.size();i++) {
			MultipartFile mf=fList.get(i);
			//실제 파일명 가져오기
			String oriName=mf.getOriginalFilename();
			//실제 파일명을 map에 저장
			fmap.put("oriName",oriName);

			//저장 파일명 만들기
			String sysName=System.currentTimeMillis()+oriName.substring(oriName.lastIndexOf("."));
			//저장 파일명 map에 저장
			fmap.put("sysName",sysName);

			log.info("fileup() - oriName : "+oriName);
			log.info("fileup() - sysName : "+sysName);

			//저장 위치로 파일 전송
			//새로 만든 파일이름으로 지정된 경로에 전송
			mf.transferTo(new File(path+sysName));

//			if(sort.equals("insert")) {
//				//db에 파일 저장
//				cmDao.fileInsert(fmap);
//			}else if(sort.equals("update")) {
//				//db에 내용을 수정한다.
//				cmDao.updateFile(fmap);
//			}

		}

	}

	/*
	 * public ModelAndView getClassList() { mv = new ModelAndView();
	 * 
	 * Map<String, String> lmap = new HashMap<String, String>();
	 * 
	 * List<OnlineClassDto> bList = cDao.getList(lmap);
	 * 
	 * 
	 * mv.addObject("bList", bList);
	 * 
	 * 
	 * mv.setViewName("home");
	 * 
	 * return mv; }
	 */
}
