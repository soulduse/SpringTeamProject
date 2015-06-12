package com.listen.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.admin.dao.AdminDao;
import com.listen.base.controller.BaseController;

@Controller
public class AdminController extends BaseController{
	
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	// 공지사항
	@RequestMapping("/admin/notice.listen")
	public String noticeMenu(HttpServletRequest request, HttpSession session) {

		System.out.println("공지사항 들어옴");
			
		request.setAttribute("page", "admin");
		request.setAttribute("mainUrl", prefix + "admin/Notice.jsp");

		return frame;
	}
	// 의견 게시판
	@RequestMapping("/admin/opinion.listen")
	public String opinionMenu(HttpServletRequest request, HttpSession session) {
		
		System.out.println("의견 게시판 들어옴");
		
		request.setAttribute("page", "admin");
		request.setAttribute("mainUrl", prefix + "admin/Opinion.jsp");
		
		return frame;
	}

	// 배경 관리페이지
	@RequestMapping("/admin/background.listen")
	public String backgroundMenu(HttpServletRequest request, HttpSession session) {

		System.out.println("배경 관리 페이지 들어옴");

		request.setAttribute("page", "admin");
		request.setAttribute("mainUrl", prefix + "admin/Background.jsp");

		return frame;
	}	
	
}






