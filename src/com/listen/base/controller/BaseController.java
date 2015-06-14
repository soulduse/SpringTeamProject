package com.listen.base.controller;


public class BaseController {
	
	protected final String frame = "/common/Frame";
	protected final String popup = "/common/Popup";
	protected final String prefix = "/WEB-INF/jsp/";
	protected String mainUrl = "/WEB-INF/jsp/common/Main.jsp";
	protected String message = "";
	
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
