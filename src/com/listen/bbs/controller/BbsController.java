package com.listen.bbs.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.listen.base.controller.BaseController;
import com.listen.base.util.TotalDate;
import com.listen.bbs.dao.BbsAddDao;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.dto.BbsAddWriteDto;
import com.listen.bbs.dto.BbsLikeSwitchDto;
import com.listen.bbs.dto.BbsWriteDto;
import com.listen.bbs.vo.BbsAddVo;
import com.listen.bbs.vo.BbsVo;
import com.listen.bbs.vo.MyBackGroundVo;

@Controller
public class BbsController extends BaseController{
   
   @Autowired
   private ServletContext servletContext;
   
   private BbsDao bbsDao;
   private BbsAddDao bbsAddDao;
   
   public void setBbsDao(BbsDao bbsDao) {
      this.bbsDao = bbsDao;
   }
   
   public void setBbsAddDao(BbsAddDao bbsAddDao) {
      this.bbsAddDao = bbsAddDao;
   }
   
   // 글 보기 
   @RequestMapping("/view.listen")
   public String viewPage(HttpServletRequest request, HttpSession session) {
      System.out.println("viewPage 들어옴");
      
      
      ArrayList bbsList = bbsDao.bbsViewList();
      request.setAttribute("page", "view");
      request.setAttribute("bbsList",  bbsList);
      request.setAttribute("mainUrl", prefix + "bbs/BbsList.jsp");
      
      return frame;
   }
   
   // 글 보기 
   @RequestMapping("/m_bbsView.listen")
   public String m_viewPage(BbsVo bbsVo, HttpServletRequest request, HttpSession session) {
	   String bbs_seq = (String) request.getParameter("bbs_seq");
      System.out.println(bbs_seq);

      ArrayList m_bbsViewList = (ArrayList)bbsDao.m_bbsinit(bbsVo);
      request.setAttribute("m_bbsViewList",  m_bbsViewList);
      request.setAttribute("mainUrl", prefix + "bbs/m_dialogBbsinit.jsp");
      
      return frame;
   }
   
   // 인기 있는 글 보기 
   @RequestMapping("/topStories.listen")
   public String m_topStoriesPage(HttpServletRequest request, HttpSession session) {
      String selectStoryName = "인기 있는 글 보기";
      ArrayList m_bbsViewList = (ArrayList)bbsDao.m_bbsTopStoriesList();
      request.setAttribute("m_bbsViewList",  m_bbsViewList);
      request.setAttribute("selectStoryName",  selectStoryName);
      request.setAttribute("mainUrl", prefix + "bbs/selectStory.jsp");
      
      return m_frame;
   }
   
   // 관심 있는 글 보기 
   @RequestMapping("/interest.listen")
   public String m_interestPage(HttpServletRequest request, HttpSession session) {
	  String selectStoryName = "관심 있는 글 보기";
      ArrayList m_bbsViewList = (ArrayList)bbsDao.m_bbsViewList();
      request.setAttribute("m_bbsViewList",  m_bbsViewList);
      request.setAttribute("selectStoryName",  selectStoryName);
      request.setAttribute("mainUrl", prefix + "bbs/selectStory.jsp");
      
      return m_frame;
   }
   // 글 공감 버튼처리 Ajax
   @RequestMapping("/ajax/bbsLikeCount.listen")
   public void likeCount(BbsLikeSwitchDto bbsLikeSwitchDto)
   {
      bbsDao.likeCountUpdate(bbsLikeSwitchDto);
   }
   
   // 댓글 Ajax 입력
   @RequestMapping("/ajax/bbsAdd.listen")
   public void writeAddPage(BbsAddWriteDto bbsAddWriteDto, HttpServletRequest request, HttpServletResponse response) throws IOException
   {
      if(bbsAddWriteDto.getContent() != "" && bbsAddWriteDto.getContent().length()>0)
      {
         bbsAddDao.bbsAddWrite(bbsAddWriteDto);
      }
      ArrayList bbsAddList = (ArrayList)bbsAddDao.bbsAddList(bbsAddWriteDto);
      response.setCharacterEncoding("utf-8");
      if(bbsAddList.size()>0)
      {
         PrintWriter out = response.getWriter();
         response.setContentType("text/html;charset=UTF-8");
         out.print("<root>");
         for(int i=0; i<bbsAddList.size(); i++)
         {
            BbsAddVo bbsAddVo = (BbsAddVo) bbsAddList.get(i);
            String content = URLDecoder.decode(bbsAddVo.getContent(), "UTF-8");   // 한글처리부분
            String reg_date = bbsAddVo.getReg_date();
            int goodCount = bbsAddVo.getGoodCount();
            out.println("<items>");
            out.println("<content>"+content+"</content>");
            out.println("<reg_date>"+reg_date+"</reg_date>");
            out.println("<goodcount>"+goodCount+"</goodcount>");
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

   // 모바일 댓글 Ajax 입력
   @RequestMapping("/ajax/m_bbsAdd.listen")
   public void m_writeAddPage(BbsAddWriteDto bbsAddWriteDto, HttpServletRequest request, HttpServletResponse response) throws IOException
   {
      if(bbsAddWriteDto.getContent() != "" && bbsAddWriteDto.getContent().length()>0)
      {
         bbsAddDao.bbsAddWrite(bbsAddWriteDto);
      }
      ArrayList bbsAddList = (ArrayList)bbsAddDao.m_bbsAddList(bbsAddWriteDto);
      response.setCharacterEncoding("utf-8");
      if(bbsAddList.size()>0)
      {
         PrintWriter out = response.getWriter();
         response.setContentType("text/html;charset=UTF-8");
         out.print("<root>");
         for(int i=0; i<bbsAddList.size(); i++)
         {
            BbsAddVo bbsAddVo = (BbsAddVo) bbsAddList.get(i);
            String content = URLDecoder.decode(bbsAddVo.getContent(), "UTF-8");   // 한글처리부분
            String reg_date = bbsAddVo.getReg_date();
            int goodCount = bbsAddVo.getGoodCount();
            out.println("<items>");
            out.println("<content>"+content+"</content>");
            out.println("<reg_date>"+reg_date+"</reg_date>");
            out.println("<goodcount>"+goodCount+"</goodcount>");
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
   
	// 모바일 내가 작성 한 글 공개 입력
	@RequestMapping("/m_dispYBbs.listen")
	public String m_dispYBbsPage(BbsVo bbsVo, HttpServletRequest request, HttpServletResponse response,  HttpSession session) throws IOException {
		bbsDao.myStoryDispY(bbsVo);
		System.out.println("안녕 나 여기 들왔졍!!");
		String email = (String)session.getAttribute("email");
		return "redirect:/m_myStory.listen";
	}
   
   
   // 글쓰기 및 그림파일 등록
   @RequestMapping("/writeSave.listen")
   public String writePage(BbsWriteDto bbsWriteDto, HttpServletRequest request) {
      
      // 글쓰기 부분 
      try{
         bbsDao.bbsWrite(bbsWriteDto);
         message="작성완료";
         request.setAttribute("message", message);
      }catch(Exception e){
         e.printStackTrace();
         message="작성에 실패 했습니다.";
         request.setAttribute("message", message);
      }
      
      String confRoot = servletContext.getRealPath("/"); // WebContent경로
      String path = "/upfile/bbs_file/"+TotalDate.getToday("yyyy/MM/dd");
      String bbsFileUploadPath = confRoot + path;
      
      System.out.println("첫번째 경로 : "+bbsFileUploadPath);

      File dayFile = new File(bbsFileUploadPath);
      if (!dayFile.exists()) {
         dayFile.mkdirs();
      }

      String savePath = dayFile.getAbsolutePath();
      
      
      MultipartFile resPic = bbsWriteDto.getUpload();
      if(resPic.getSize() > 0)
      {
         String fileName = resPic.getOriginalFilename();                                          // 파일의 이름
         String imgExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());         // 파일 확장자
         long fileSize = resPic.getSize();      // 파일 사이즈
         
         bbsWriteDto.setOrg_name(fileName);
         bbsWriteDto.setPath(path);
         bbsWriteDto.setSave_name(System.currentTimeMillis() + "_" +bbsWriteDto.getOrg_name());
         bbsWriteDto.setFile_size(fileSize);
         
         // upload 가능한 파일 타입 지정
         // equalsIgnoreCase 의 경우 대소문자 구분하지 않고 비교함
         if(imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("PNG") || imgExt.equalsIgnoreCase("GIF"))
         {
            File outFileName = new File(savePath+"\\"+fileName);
            System.out.println("두번째 경로 : "+savePath+"\\"+fileName);
            try
            {
               resPic.transferTo(outFileName);
               bbsDao.updateRes_pic(bbsWriteDto);
            } catch(IllegalStateException e) {
               e.printStackTrace();
            } catch(IOException e) {
               e.printStackTrace();
            }
         }else {
            System.err.println("파일 형식이 올바르지 않습니다.");
            message = "파일 형식이 올바르지 않습니다.";
         }
      }
      System.out.println("writePage 들어옴");
      System.out.println(bbsWriteDto.getBbs_contents());

      return frame;
   }
   
   // 모바일 글쓰기 및 그림파일 등록
   @RequestMapping("/m_writeSave.listen")
   public String m_writePage(BbsWriteDto bbsWriteDto, HttpServletRequest request) {
      
      // 글쓰기 부분 
      try{
         bbsDao.bbsWrite(bbsWriteDto);
         message="작성완료";
         request.setAttribute("message", message);
      }catch(Exception e){
         e.printStackTrace();
         message="작성에 실패 했습니다.";
         request.setAttribute("message", message);
      }
      
      String confRoot = servletContext.getRealPath("/"); // WebContent경로
      String path = "/upfile/bbs_file/"+TotalDate.getToday("yyyy/MM/dd");
      String bbsFileUploadPath = confRoot + path;
      
      System.out.println("첫번째 경로 : "+bbsFileUploadPath);

      File dayFile = new File(bbsFileUploadPath);
      if (!dayFile.exists()) {
         dayFile.mkdirs();
      }

      return "redirect:/m_main.listen";
   }
   
   @RequestMapping("/bbsPopList.listen")
   public String bbsPopListPage(BbsVo bbsVo, HttpServletRequest request, HttpSession session) {
      
	   String selectItem=(String)session.getAttribute("selectItem");
       if((String)request.getParameter("selectItem")!=null)
       {
          selectItem = (String)request.getParameter("selectItem");
       }
       session.setAttribute("selectItem",selectItem);
       bbsVo.setSelectItem(selectItem);
       ArrayList bbsIntList = bbsDao.bbsDetailView(bbsVo);
       request.setAttribute("page", "interest");
       request.setAttribute("bbsIntList",  bbsIntList);
       request.setAttribute("selectItem", selectItem);
      request.setAttribute("mainUrl", prefix + "bbs/BbsPopList.jsp");
      return frame;
      
   }

	@RequestMapping("/bbsIntList.listen")
	public String bbsIntListPage(BbsVo bbsVo, HttpServletRequest request, HttpSession session) {

		String selectItem = (String) session.getAttribute("selectItem");
		if ((String) request.getParameter("selectItem") != null) {
			selectItem = (String) request.getParameter("selectItem");
		}
		session.setAttribute("selectItem", selectItem);
		bbsVo.setSelectItem(selectItem);
		ArrayList bbsIntList = bbsDao.bbsDetailView(bbsVo);
		request.setAttribute("page", "interest");
		request.setAttribute("bbsIntList", bbsIntList);
		request.setAttribute("selectItem", selectItem);
		request.setAttribute("mainUrl", prefix + "bbs/BbsIntList.jsp");

		return frame;
	}
   
   @RequestMapping("/bbsAgeList.listen")
   public String bbsAgePage(BbsVo bbsVo,HttpServletRequest request, HttpSession session) {
	   
	  String selectAge = (String)request.getParameter("selectAge");
	  String selectItem=(String)session.getAttribute("selectItem");
	  
	  if((String)request.getParameter("selectItem")!=null)
	  {
		  System.out.println("어 있네 셀렉트아이템");
	      selectItem = (String)request.getParameter("selectItem");
	  }
	  session.setAttribute("selectItem",selectItem);
	 
	  System.out.println("요기도 들어왔지 아이템을 찍어라 " +(String)request.getParameter("selectItem"));
	  
	  bbsVo.setSelectItem(selectItem);
	  request.setAttribute("selectItem", selectItem);
	  
	  
	  System.out.println("여기 들어왔다 나이를 찍거라 "+(String)request.getParameter("selectAge"));
	  bbsVo.setSelectAge(selectAge);
	  ArrayList bbsAgeList = bbsDao.bbsAgeList(bbsVo);
	  request.setAttribute("page", "all");
	  request.setAttribute("bbsAgeList",  bbsAgeList);
	  request.setAttribute("selectAge", selectAge);
	 
	  request.setAttribute("mainUrl", prefix + "bbs/BbsAgeList.jsp");
      
      return frame;
   }
   
   @RequestMapping("/myImgSave.listen")
   public String myBgImg(MyBackGroundVo myBackGroundVo, HttpServletRequest request,  HttpSession session) {
      
      String confRoot = servletContext.getRealPath("/"); // WebContent경로
      String path = "/upfile/bbs_file/"+TotalDate.getToday("yyyy/MM/dd");
      String bbsFileUploadPath = confRoot + path;
      
      System.out.println("첫번째 경로 : "+bbsFileUploadPath);

      File dayFile = new File(bbsFileUploadPath);
      if (!dayFile.exists()) {
         dayFile.mkdirs();
      }

      String savePath = dayFile.getAbsolutePath();
      
      String reg_email = (String)session.getAttribute("email");
      MultipartFile resPic = myBackGroundVo.getUpload();
      if(resPic.getSize() > 0)
      {
         String fileName = resPic.getOriginalFilename();                                          // 파일의 이름
         String imgExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());         // 파일 확장자
         long fileSize = resPic.getSize();      // 파일 사이즈
         
         myBackGroundVo.setOrg_name(fileName);
         myBackGroundVo.setPath(path);
         myBackGroundVo.setSave_name(System.currentTimeMillis() + "_" +myBackGroundVo.getOrg_name());
         myBackGroundVo.setFile_size(fileSize);
         myBackGroundVo.setReg_email(reg_email);
         String fName = (String)myBackGroundVo.getSave_name();
         
         // upload 가능한 파일 타입 지정
         // equalsIgnoreCase 의 경우 대소문자 구분하지 않고 비교함
         if(imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("PNG") || imgExt.equalsIgnoreCase("GIF"))
         {
            File outFileName = new File(savePath+"\\"+fName);
            System.out.println("두번째 경로 : "+savePath+"\\"+fileName);
            try
            {
               resPic.transferTo(outFileName);
               bbsDao.update_img(myBackGroundVo);
            } catch(IllegalStateException e) {
               e.printStackTrace();
            } catch(IOException e) {
               e.printStackTrace();
            }
         }else {
            System.err.println("파일 형식이 올바르지 않습니다.");
            message = "파일 형식이 올바르지 않습니다.";
         }
      }
      System.out.println("writePage 들어옴");
      
      
      BbsVo bv = new BbsVo();
      bv.setReg_email(reg_email);
      ArrayList bbsMyViewList = bbsDao.bbsMyViewList(bv);
      
      MyBackGroundVo bbsMybgimg = bbsDao.bbsMybgimg(bv);
      
      request.setAttribute("page", "myStory");
      request.setAttribute("bbsMyViewList",  bbsMyViewList);
      request.setAttribute("bbsMybgimg",  bbsMybgimg);
      
      request.setAttribute("mainUrl", prefix + "myStory/myStory.jsp");

      return frame;
   }
   
   
   @RequestMapping("/ajax/bbsViewListAdd.listen")
   public void bbsViewListAddPage(HttpServletRequest request, HttpServletResponse response) throws IOException
   {
	   
	   System.out.println("여기까찐 되네");
	   
	   /*
      if(bbsAddWriteDto.getContent() != "" && bbsAddWriteDto.getContent().length()>0)
      {
         bbsAddDao.bbsAddWrite(bbsAddWriteDto);
      }
      ArrayList bbsAddList = (ArrayList)bbsAddDao.bbsAddList(bbsAddWriteDto);
      response.setCharacterEncoding("utf-8");
      if(bbsAddList.size()>0)
      {
         PrintWriter out = response.getWriter();
         response.setContentType("text/html;charset=UTF-8");
         out.print("<root>");
         for(int i=0; i<bbsAddList.size(); i++)
         {
            BbsAddVo bbsAddVo = (BbsAddVo) bbsAddList.get(i);
            String content = URLDecoder.decode(bbsAddVo.getContent(), "UTF-8");   // 한글처리부분
            String reg_date = bbsAddVo.getReg_date();
            int goodCount = bbsAddVo.getGoodCount();
            out.println("<items>");
            out.println("<content>"+content+"</content>");
            out.println("<reg_date>"+reg_date+"</reg_date>");
            out.println("<goodcount>"+goodCount+"</goodcount>");
            out.println("</items>");
         }
         out.println("</root>");
         out.close();
      }
      else
      {
         response.setStatus(HttpServletResponse.SC_NO_CONTENT);
      }
      */
   }
}
