package com.listen.base.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

public class BaseController {

	/*
	 * - full = /WEB-INF/jsp/common/Full.jsp - frame =
	 * /WEB-INF/jsp/common/Frame.jsp - mainUrl ( prefix+jsp) - 세션 초기화 - mainUrl
	 * = "/WEB-INF/jsp/common/Main.jsp"; - prefix = “/WEB-INF/jsp/”
	 */
	
	//protected HttpSession session;
	protected final String frame = "/common/Frame";
	protected final String prefix = "/WEB-INF/jsp/";
	protected String mainUrl = "/WEB-INF/jsp/common/Main.jsp";
	
	/*
	public void init(HttpServletRequest request)
	{

		session = request.getSession(false);
		if(session==null || session.getAttribute("loginYn")==null)
		{
			session = request.getSession(true);
			session.setAttribute("loginYn", "N");
		}	
	}
	*/

}
