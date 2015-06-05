package com.listen.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public class Logout 
{
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		//System.out.println("LoginAction Controller ����");

		HttpSession session = request.getSession(false);
		session.setAttribute("LoginYn", "N");
		session.setAttribute("ID", null);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("Login");

		return mav;
	}

}