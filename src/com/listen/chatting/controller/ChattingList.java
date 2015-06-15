package com.listen.chatting.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.chatting.dao.ChattingDao;
import com.listen.chatting.vo.ChattingVo;

@Controller
public class ChattingList extends BaseController{

	private ChattingDao chattingDao;
	
	public void setChattingDao(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}


	@RequestMapping("/chattingList.listen")
	public String writePage(HttpServletRequest request, HttpSession session) {
		
		
		return frame;
	}
}
