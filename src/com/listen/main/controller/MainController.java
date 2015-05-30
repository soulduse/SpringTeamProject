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


	@RequestMapping("/main.com")
	public String mainPage(HttpServletRequest request, HttpSession session) {

		System.out.println("mainPage 들어옴");
			
		ArrayList itemList  = itemDao.getItemList();
		
		//request.setAttribute("itemList", itemList); // 이렇게 보내고 jsp에서 getAttribute로 받습니다.
		request.setAttribute("page", "main");
		//request.setAttribute("mainUrl", prefix + "메인컨텐츠로 보낼 페이지.jsp");

		return frame;
	}

	

}
