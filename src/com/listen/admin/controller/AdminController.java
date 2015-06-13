package com.listen.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.listen.admin.dao.AdminDao;
import com.listen.admin.dto.NoticeDto;
import com.listen.admin.vo.AdminNoticeVo;
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
		
		try{
			ArrayList noticeList = (ArrayList)adminDao.noticeList();
			request.setAttribute("noticeList", noticeList);
			System.out.println("공지사항 목록 가져오는데 성공!");
		}catch(Exception e){
			e.printStackTrace();
			message = "글 목록을 가져오는데 실패 했습니다. 원인 : "+e.getMessage();
			System.out.println(message);
		}
		request.setAttribute("message", message);
		request.setAttribute("mainUrl", prefix + "admin/Notice.jsp");
		
		return frame;
	}
	
	// 공지사항 등록
	@RequestMapping("/admin/noticeWrite.listen")
	public String noticeWrite(NoticeDto noticeDto, HttpServletRequest request)
	{
		try{
			adminDao.noticeWrite(noticeDto);
			System.out.println("공지사항 등록 완료!");
		}catch(Exception e){
			e.printStackTrace();
			message = "글 등록에 실패 하였습니다. 원인 : "+e.getMessage();
			System.out.println(message);
		}
		request.setAttribute("message", message);
		
		return "redirect:/admin/notice.listen";
	}
	
	// 공지사항 글 보기
	@RequestMapping("/admin/noticeView.listen")
	public String noticeView(@RequestParam(value="bbs_seq") int bbs_seq, 
			@RequestParam(value="hit") String hit, HttpServletRequest request)
	{
		AdminNoticeVo adminNoticeVo = (AdminNoticeVo)adminDao.noticeView(bbs_seq);
		if(hit == null || hit.equals("Y"))
		{
			adminDao.hitPlus(bbs_seq);
		}
		request.setAttribute("adminNoticeVo", adminNoticeVo);
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






