package com.sinau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceCenterController {
	
	@GetMapping("servicecenter_write")//list?pageNum=3
	public String servicecenter() {	

		return "servicecenter/servicecenter_write";
				
	}
}
