package com.listen.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.notice.dao.NoticeDao;
import com.listen.notice.vo.NoticeVo;

@Controller
public class NoticeAdd extends BaseController{

	NoticeDao noticeDao;
	
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@RequestMapping("/ajax/chattingRequest.listen")
	public void createPage(NoticeVo noticeVo, HttpServletRequest request, HttpSession session) {
		System.out.println(noticeVo.getBbs_seq());
		System.out.println(noticeVo.getEmail());
		noticeDao.chattingReqAdd(noticeVo);
	}
}
