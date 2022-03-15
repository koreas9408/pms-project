package com.project.pms.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/task/*")
public class TaskController {

	// �� �۾�
	@GetMapping("/list.do")
	public String getTaskList() {
		System.out.println("getTaskList getController called...");
		
		return "task/list";
	}
	
	// �� ����
	@GetMapping("/approval.do")
	public String getApprovalList() {
		System.out.println("getApprovalList getController called...");
		
		return "task/approval";
	}
	
	// ���� ����
	@GetMapping("/calendar.do")
	public String getCalendarList() {
		System.out.println("getCalendarList getController called...");
		
		return "task/calendar";
	}
}
