package com.listen.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.chatting.dao.ChattingDao;
import com.listen.chatting.vo.ChattingMemberVo;
import com.listen.chatting.vo.ChattingVo;
import com.listen.notice.dao.NoticeDao;

@Controller
public class CreateChatting extends BaseController{
	
	@Autowired
	private ServletContext servletContext;

	private ChattingDao chattingDao;
	
	private NoticeDao noticeDao;
	
	public void setChattingDao(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}


	@RequestMapping("/createRoom.listen")
	public String createPage(ChattingVo chattingVo, HttpServletRequest request, HttpSession session) {
		String email = (String) session.getAttribute("email");
		String notifications_seq = (String) request.getParameter("notifications_seq");
		System.out.println("notification :"+notifications_seq);
		String send_seq = (String) request.getParameter("send_seq");
		String rec_seq = (String) request.getParameter("rec_seq");
		String reg_ip = request.getRemoteAddr();
		System.out.println(send_seq+"durl");
		System.out.println(rec_seq);
		ArrayList nickname = (ArrayList)chattingDao.RandomName(rec_seq ,send_seq);
		ChattingMemberVo send = (ChattingMemberVo)nickname.get(0);
		ChattingMemberVo send2 = (ChattingMemberVo)nickname.get(1);
		ChattingMemberVo rec = (ChattingMemberVo)nickname.get(2);
		ChattingMemberVo rec2 = (ChattingMemberVo)nickname.get(3);
		String send_nickname = (String)send.getRandom_name1()+" "+(String)send2.getRandom_name2();
		String rec_nickname = (String)rec.getRandom_name1()+" "+(String)rec2.getRandom_name2();
		String chatting_name = (String)send.getRandom_name1()+" "+(String)send2.getRandom_name2() + "  "+ (String)rec.getRandom_name1()+" "+(String)rec2.getRandom_name2();
		System.out.println(chatting_name);
		chattingVo.setChatting_name(chatting_name);
		chattingVo.setEmail(email);
		chattingVo.setReg_ip(reg_ip);
		HashMap map = new HashMap();
		map.put("send_seq", send_seq);
		map.put("rec_seq", rec_seq);
		map.put("send_nickname", send_nickname);
		map.put("rec_nickname", rec_nickname);
		map.put("reg_ip", reg_ip);
		
		chattingDao.createRoom(map, chattingVo);
		noticeDao.UpdateNotification(notifications_seq);
		System.out.println("여기");
		ArrayList noticeList = new ArrayList();
		noticeList.add(chatting_name);
		noticeList.add(rec_nickname);
		noticeList.add(rec_seq);
		request.setAttribute("noticeList",  noticeList);
		return popup;
	}

	@RequestMapping("/deleteChat.listen")
	public String deletePage(HttpServletRequest request, HttpSession session) {
		String chatting_name = (String) request.getParameter("room");
		String email = (String) session.getAttribute("email");
		System.out.println("방이읆 :" +chatting_name);
		System.out.println("방이읆 :" +email);
		HashMap map = new HashMap();
		map.put("chatting_name", chatting_name);
		map.put("email", email);
		chattingDao.deletChat(map);
		return frame;
	}
}
