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
		String pass = (String)request.getParameter("pass");
		
		String password ="";
		System.out.println(id + pass);
		ArrayList EmailList = memberDao.getEmailList(id);
		if(EmailList.size() != 0)
		{
			MemberVo mv = (MemberVo)EmailList.get(0);
			String email = (String)mv.getEmail();
			password = (String)mv.getPassword();
		}
		System.out.println(pass);
		System.out.println(password);
		
		System.out.println(EmailList.get(0));
		//System.out.println(passList.get(0));
		memberVo = new MemberVo();
		if(EmailList.size()!=0 && pass.equals(password))
		{
		//	if(EmailList.get(0) == passList.get(0))
			//{
				MemberVo memberVo = (MemberVo)EmailList.get(0);
				session.setAttribute("email", memberVo.getEmail());
				session.setAttribute("pass", memberVo.getPassword()); 
				session.setAttribute("LoginYn", "Y");
				return frame;
			//}
		}
		else{
			session.setAttribute("Error", "N");
			return "member/Login";
		}
	}
	
	@RequestMapping("/Logout.listen")
	public String logout(HttpServletRequest request, HttpSession session){
		System.out.println("Logout!!!!!");
		session = request.getSession(false);
		session.setAttribute("LoginYn", "N");
		session.setAttribute("email", null);
		return "member/Login";
	}
	@RequestMapping("/join.listen") // join.jsp로 진입
	public String join(HttpServletRequest request, HttpSession session)
	{
		return "member/join";
	}
	
	@RequestMapping("/joinResult.listen") //회원가입 결과 보냄
	public String joinResult(HttpServletRequest request, MemberVo memberVo)
	{		
		String email_id = (String)request.getParameter("email_id");
		String email_kind = (String)request.getParameter("email_domain");
		String birthyear = (String)request.getParameter("birthyear");
		String gender = (String)request.getParameter("gender");
		String realId = email_id + "@" + email_kind;
		
		if(gender.equals("01"))
		{
			gender = "1";
		}
		else if(gender.equals("02"))
		{
			gender = "2";
		}		
		
		memberVo.setRealId(realId);
		memberVo.setBirthyear(birthyear);
		memberVo.setGender(gender);
		memberDao.join(memberVo);
		request.setAttribute("page", "main");
		request.setAttribute("mainUrl", prefix + "member/Login.jsp");
		return frame;
	}
	
	@RequestMapping("/emailCheck.listen") //id중복 확인
	public String idCheck(HttpServletRequest request, HttpSession session)
	{		
		String realId = (String)request.getParameter("realId");

		ArrayList EmailList = memberDao.getCheckEmail(realId);
		memberVo = new MemberVo();
		if(EmailList.size()==0)
		{
			request.setAttribute("realId", realId);
			//MemberVo memberVo = (MemberVo)EmailList.get(0);
			//session.setAttribute("email", memberVo.getEmail());

			request.setAttribute("code", "1");
			return "member/idCheck";
			//return "redirect:/member/idCheck.jsp?code=1";
		}
		else{

			request.setAttribute("realId", realId);
			request.setAttribute("code", "2");
			return "member/idCheck";
			//return "redirect:/member/idCheck.jsp?code=2";
		}
	}
	
	
	

}