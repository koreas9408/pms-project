package com.project.pms.myTask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.myTask.repository.CalendarDAO;
import com.project.pms.myTask.vo.Calendar;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO dao;

	// 캘린더 조회
	public List<Calendar> getCalendarList(int empId) {
		return dao.getCalendarList(empId);
	}
	
	// 캘린더 등록
	public void insertCalendar(Calendar calendar) {
		dao.insertCalendar(calendar);
	}

	// 캘린더 수정
	public void updateCalendar(Calendar calendar) {
		dao.updateCalendar(calendar);
	}
	
	// 캘린더 삭제
	public void deleteCalendar(int id) {
		dao.deleteCalendar(id);
	}
}