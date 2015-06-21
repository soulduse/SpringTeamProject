package com.listen.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.bbs.vo.BbsAddVo;
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
	
	@RequestMapping("/ajax/notificationList.listen")
	public void notificationListPage(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException
	{
		String email = (String) session.getAttribute("email");
		ArrayList noticeList = noticeDao.getNoticelist(email);
        session.setAttribute("noticeList",  noticeList);
        System.out.println(noticeList.size());
        response.setCharacterEncoding("utf-8");
        if(noticeList.size()>0)
        {
           PrintWriter out = response.getWriter();
           response.setContentType("text/html;charset=UTF-8");
           out.print("<root>");
           for(int i=0; i<noticeList.size(); i++)
           {
        	  NoticeVo noticeVo = (NoticeVo) noticeList.get(i);
        	  int notifications_seq = noticeVo.getNotifications_seq();
              int send_seq = noticeVo.getMembers_seq();
              int rec_seq = noticeVo.getRec_seq();
              int noti_state_seq = noticeVo.getNoti_state_seq();
              String content = URLDecoder.decode(noticeVo.getContent(), "UTF-8");   // 한글처리부분
              out.println("<items>");
              out.println("<count>"+i+"</count>");
              out.println("<notifications_seq>"+notifications_seq+"</notifications_seq>");
              out.println("<send_seq>"+send_seq+"</send_seq>");
              out.println("<rec_seq>"+rec_seq+"</rec_seq>");
              out.println("<noti_state_seq>"+noti_state_seq+"</noti_state_seq>");
              out.println("<content>"+content+"</content>");
              out.println("</items>");
           }
           out.println("</root>");
           out.close();
        }
        else
        {
           response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
	}
}
