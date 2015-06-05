package com.listen.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.member.dao.MemberDao;
import com.listen.member.vo.MemberVo;


@Controller
public class LoginAction extends BaseController {

	private MemberDao memberDao;
	private MemberVo memberVo;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}


	@RequestMapping("/Login.listen")
	public String mainPage(HttpServletRequest request, HttpSession session) {

		System.out.println("LoginPage 들어옴");
			
		//ArrayList memberList  = memberDao.loginAction();
		
		//request.setAttribute("memberList", memberList); 
		request.setAttribute("page", "main");
		request.setAttribute("mainUrl", prefix + "member/Login.jsp");

		return frame;
	}
	
	@RequestMapping("/loginAction.listen")
	public String login(HttpServletRequest request, HttpSession session) {
		String id = (String)request.getParameter("id");
		System.out.println(id);
		
		ArrayList EmailList = memberDao.getEmailList(id);
		memberVo = new MemberVo();
		if(EmailList.size()!=0)
		{
			MemberVo result = (MemberVo)EmailList.get(0);
			session.setAttribute("email", result.getEmail());
			session.setAttribute("LoginYn", "Y");
			return frame;
		}
		else{
			return "redirect:/member/Login.jsp?error=1";
		}
	}
	
	@RequestMapping("/Logout.listen")
	public String logout(HttpServletRequest request, HttpSession session){
		System.out.println("Logout!!!!!");
		session = request.getSession(false);
		session.setAttribute("LoginYn", "N");
		session.setAttribute("email", null);
		return "redirect:/member/Login.jsp";
	}
}