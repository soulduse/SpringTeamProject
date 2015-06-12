package com.listen.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.vo.BbsVo;
import com.listen.main.dao.ItemDao;


@Controller
public class MainController extends BaseController {

	private ItemDao itemDao;
	private BbsDao bbsDao;
	
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}


	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}


	@RequestMapping("/main.listen")
	public String mainPage(BbsVo bbsVo, HttpServletRequest request, HttpSession session) {

		System.out.println("mainPage 들어옴");
		String selectItem=(String)session.getAttribute("selectItem");
		bbsVo.setSelectItem(selectItem);
		
		ArrayList bbsList = bbsDao.bbsDetailView(bbsVo);
		request.setAttribute("page", "interest");
	
		request.setAttribute("page", "main");
		request.setAttribute("bbsList",  bbsList);
		//request.setAttribute("mainUrl", prefix + "~~~.jsp");

		return frame;
	}
	
	@RequestMapping("/write.listen")
	public String writePage(HttpServletRequest request, HttpSession session) {
		
		System.out.println("writePage 들어옴");
		
		request.setAttribute("page", "write");
		request.setAttribute("mainUrl", prefix + "bbs/BbsWrite.jsp");
		
		return frame;
	}
}
