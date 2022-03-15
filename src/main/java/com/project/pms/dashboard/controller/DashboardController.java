package com.project.pms.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard/*")
public class DashboardController {

	// ���� ��ú���
	@GetMapping("/general.do")
	public String getDashboardGeneral() {
		System.out.println("getDashboardGeneral getController called...");
		
		return "dashboard/general";
	}
	
	// ���� ��ú��� 
	@GetMapping("/personal.do")
	public String getDashboardPersonal() {
		System.out.println("getDashboardPersonal getController called...");
		
		return "dashboard/personal";
	}
	
	
}
