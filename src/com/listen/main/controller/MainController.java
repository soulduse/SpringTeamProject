package com.listen.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.vo.BbsVo;
import com.listen.bbs.vo.MyBackGroundVo;
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
		String reg_email = (String)session.getAttribute("email");  
		bbsVo.setReg_email(reg_email);
		System.out.println(bbsVo.getReg_email());
		System.out.println("이밤이 지나면 이대로 우리 해여져야 만");
		ArrayList bbsList = bbsDao.bbsMainList(bbsVo);
		request.setAttribute("page", "main");
		request.setAttribute("bbsList",  bbsList);
		
		System.out.println("이밤이 지나면 이대로 우리 해여져야 만");
		
		   
	      BbsVo bv = new BbsVo();
	      bv.setReg_email(reg_email);      
	      ArrayList mainMyStory = bbsDao.mainMyStory(bv);   
	      request.setAttribute("page", "myStory");
	      request.setAttribute("mainMyStory",  mainMyStory);

		//request.setAttribute("mainUrl", prefix + "~~~.jsp");

		return frame;
	}
	
/*	@RequestMapping("/mMain.listen")
	public String mMainPage(HttpServletRequest request, HttpSession session) {

		System.out.println("mMainPage 들어옴");
			
		ArrayList bbsList = bbsDao.bbsViewList();
		request.setAttribute("page", "mMain");
		request.setAttribute("bbsList",  bbsList);
		
		
		String reg_email = (String)session.getAttribute("email");      
	      BbsVo bv = new BbsVo();
	      bv.setReg_email(reg_email);      
	      ArrayList mainMyStory = bbsDao.mainMyStory(bv);   
	      request.setAttribute("page", "myStory");
	      request.setAttribute("mainMyStory",  mainMyStory);
		//request.setAttribute("mainUrl", prefix + "~~~.jsp");

		return mFrame;
	}
*/
	@RequestMapping("/write.listen")
	public String writePage(HttpServletRequest request, HttpSession session) {
		
		System.out.println("writePage 들어옴");
		
		request.setAttribute("page", "write");
		request.setAttribute("mainUrl", prefix + "bbs/BbsWrite.jsp");
		
		return frame;
	}

	   //메인 마이스토리 부분
    @RequestMapping("/bbsMyViewList.listen")
    public String bbsMyViewList(HttpServletRequest request, HttpSession session) {
       String reg_email = (String)session.getAttribute("email");      
       BbsVo bv = new BbsVo();
       bv.setReg_email(reg_email);      
       ArrayList bbsMyViewList = bbsDao.bbsMyViewList(bv);
       ArrayList myClover = bbsDao.myClover(reg_email);
       MyBackGroundVo bbsMybgimg = bbsDao.bbsMybgimg(bv);
       
       request.setAttribute("page", "myStory");
       request.setAttribute("bbsMyViewList",  bbsMyViewList);
       request.setAttribute("myClover",  myClover);
       request.setAttribute("bbsMybgimg",  bbsMybgimg);
       request.setAttribute("mainUrl", prefix + "myStory/myStory.jsp");

       return frame;
    }
	   
	   
	   ///////////////////////////////모바일
	   
		@RequestMapping("/m_main.listen")
		public String m_mainPage(HttpServletRequest request, HttpSession session) {

			System.out.println("m_mainPage 들어옴");
				
			ArrayList bbsList = bbsDao.m_bbsViewList();
			request.setAttribute("page", "main");
			request.setAttribute("bbsList",  bbsList);

			request.setAttribute("mainUrl", prefix + "common/m_poto.jsp");

			return m_frame;
		}
		
		@RequestMapping("/m_myStory.listen")
		public String m_myStoryPage(BbsVo bbsVo, HttpServletRequest request, HttpSession session) {

			System.out.println("m_myStoryPage 들어옴");
			String email = (String) session.getAttribute("email");
			bbsVo.setReg_email(email);
			ArrayList bbsList = bbsDao.m_myBbsList(bbsVo);
			request.setAttribute("page", "main");
			request.setAttribute("bbsList",  bbsList);

			request.setAttribute("mainUrl", prefix + "myStory/m_myStory.jsp");

			return m_frame;
		}
		
		@RequestMapping("/m_write.listen")
		public String m_writePage(HttpServletRequest request, HttpSession session) {
			
			System.out.println("m_writePage 들어옴");
			
			request.setAttribute("page", "write");
			request.setAttribute("mainUrl", prefix + "bbs/m_BbsWrite.jsp");
			
			return m_frame;
		}	   		
}
