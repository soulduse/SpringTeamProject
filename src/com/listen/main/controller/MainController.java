package com.listen.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.main.dao.ItemDao;


@Controller
public class MainController extends BaseController {

	private ItemDao itemDao;

	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}


	@RequestMapping("/main.listen")
	public String mainPage(HttpServletRequest request, HttpSession session) {

		System.out.println("mainPage 들어옴");
			
		ArrayList itemList  = itemDao.getItemList();
		System.out.println(itemList.get(0)+"!!!!");
		
		//request.setAttribute("itemList", itemList); 
		request.setAttribute("page", "main");
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
