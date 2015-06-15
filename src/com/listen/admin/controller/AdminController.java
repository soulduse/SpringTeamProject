package com.listen.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.listen.admin.dao.AdminDao;
import com.listen.admin.dto.BackgroundDto;
import com.listen.admin.dto.NoticeDto;
import com.listen.admin.dto.OpinionDto;
import com.listen.admin.vo.AdminNoticeVo;
import com.listen.base.controller.BaseController;
import com.listen.base.util.TotalDate;

/*
 *  작업명세
 * BBS TABLE 작성시 ADMIN 공지사항 관련 게시판의 경우
 * BBS_INFO_SEQ = '1'
 * 
 * 의견게시판의 경우
 * BBS_INFO_SEQ = '4'
 */

@Controller
public class AdminController extends BaseController {

	@Autowired
	private ServletContext servletContext;

	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	// 공지사항
	@RequestMapping("/admin/notice.listen")
	public String noticeMenu(HttpServletRequest request, HttpSession session) {

		try {
			ArrayList noticeList = (ArrayList) adminDao.noticeList();
			request.setAttribute("noticeList", noticeList);
			System.out.println("공지사항 목록 가져오는데 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			message = "글 목록을 가져오는데 실패 했습니다. 원인 : " + e.getMessage();
			System.out.println(message);
		}
		request.setAttribute("message", message);
		request.setAttribute("mainUrl", prefix + "admin/Notice.jsp");

		return frame;
	}

	// 공지사항 등록
	@RequestMapping("/admin/noticeWrite.listen")
	public String noticeWrite(NoticeDto noticeDto, HttpServletRequest request) {
		try {
			adminDao.noticeWrite(noticeDto);
			System.out.println("공지사항 등록 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			message = "글 등록에 실패 하였습니다. 원인 : " + e.getMessage();
			System.out.println(message);
		}
		request.setAttribute("message", message);

		return "redirect:/admin/notice.listen";
	}

	// 공지사항 글 보기
	@RequestMapping(value = "/admin/noticeView.listen", method = RequestMethod.POST)
	public String noticeView(@RequestParam(value = "bbs_seq") int bbs_seq,
			@RequestParam(value = "hit") String hit, HttpServletRequest request) {
		System.out.println("hit : " + hit + ", bbs_seq : " + bbs_seq);
		AdminNoticeVo adminNoticeVo = (AdminNoticeVo) adminDao
				.noticeView(bbs_seq);
		if (hit == null || hit.equals("Y")) {
			adminDao.hitPlus(bbs_seq);
		}
		request.setAttribute("adminNoticeVo", adminNoticeVo);
		request.setAttribute("mainUrl", prefix + "admin/NoticeView.jsp");

		return frame;
	}

	// 공지사항 글 수정
	@RequestMapping("/admin/noticeUpdate.listen")
	public String noticeUpdate(NoticeDto noticeDto, HttpServletRequest request) {
		adminDao.noticeUpdate(noticeDto);

		// redirect: url - GET 방식으로 데이터 전송
		// forward: url - POST 방식으로 데이터 전송
		return "forward:/admin/noticeView.listen?bbs_seq="
				+ noticeDto.getBbs_seq() + "&hit='N'";
	}

	// 공지사항 글 삭제
	@RequestMapping("/admin/noticeDelete.listen")
	public String noticeDelete(@RequestParam(value = "bbs_seq") int bbs_seq) {
		adminDao.noticeDelete(bbs_seq);
		System.out.println("글 삭제 성공!");
		return "redirect:/admin/notice.listen";
	}

	// 공지사항 다중글 삭제
	@RequestMapping("/admin/noticeArrayDel.listen")
	public String noticeArrayDelete(
			@RequestParam(value = "bbs_seq") int[] bbs_seq) {
		for (int i = 0; i < bbs_seq.length; i++) {
			adminDao.noticeDelete(bbs_seq[i]);
		}
		System.out.println("글 삭제 성공!");
		return "redirect:/admin/notice.listen";
	}

	// 의견 보기
	@RequestMapping("/admin/opinion.listen")
	public String opinionMenu(HttpServletRequest request, HttpSession session) {

		System.out.println("의견 게시판 들어옴");
		ArrayList opinionList = (ArrayList) adminDao.opinionList();
		request.setAttribute("page", "adminOpinion");
		request.setAttribute("opinionList", opinionList);
		request.setAttribute("mainUrl", prefix + "admin/Opinion.jsp");

		return frame;
	}

	// 의견 작성하기
	@RequestMapping("/admin/opinionWrite.listen")
	public String opinionWrite(OpinionDto opinionDto, HttpServletRequest request) {
		adminDao.opinionWrite(opinionDto);
		System.out.println("의견등록 완료!");
		return "redirect:/main.listen";
	}

	// 배경 관리페이지
	@RequestMapping("/admin/background.listen")
	public String backgroundMenu(HttpServletRequest request, HttpSession session) {

		System.out.println("배경 관리 페이지 들어옴");

		ArrayList backgroundList = (ArrayList) adminDao.backgroundList();

		request.setAttribute("page", "adminBackground");
		request.setAttribute("backgroundList", backgroundList);
		request.setAttribute("mainUrl", prefix + "admin/Background.jsp");

		return frame;
	}

	// 배경 이미지 등록
	@RequestMapping("/admin/bgImgWrite.listen")
	public String backgroundWrite(BackgroundDto backgroundDto) {
		String confRoot = servletContext.getRealPath("/"); // WebContent경로
		String path = "/upfile/background";
		String bbsFileUploadPath = confRoot + path;

		System.out.println("첫번째 경로 : " + bbsFileUploadPath);
		
		// 경로가 없을 경우 해당 경로로 폴더 생성 부분
		File dayFile = new File(bbsFileUploadPath);
		if (!dayFile.exists()) {
			dayFile.mkdirs();
		}

		String savePath = dayFile.getAbsolutePath();

		MultipartFile resPic = backgroundDto.getUpload();
		if (resPic.getSize() > 0) {
			String fileName = resPic.getOriginalFilename(); // 파일의 이름
			String imgExt = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()); // 파일 확장자
			String saveName = System.currentTimeMillis()+"_"+fileName;
			long fileSize = resPic.getSize(); // 파일 사이즈

			backgroundDto.setOrg_name(fileName);
			backgroundDto.setPath(path);
			backgroundDto.setSave_name(saveName);
			backgroundDto.setFile_size(fileSize);

			// upload 가능한 파일 타입 지정
			// equalsIgnoreCase 의 경우 대소문자 구분하지 않고 비교함
			if (imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG")	|| imgExt.equalsIgnoreCase("PNG") || imgExt.equalsIgnoreCase("GIF")) {
				File outFileName = new File(savePath + "\\" + saveName);
				System.out.println("두번째 경로 : " + savePath + "\\" + saveName);
				try {
					resPic.transferTo(outFileName);		// 해당 경로로 파일을 업로드함.
					adminDao.backgroundWrite(backgroundDto);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.err.println("파일 형식이 올바르지 않습니다.");
				message = "파일 형식이 올바르지 않습니다.";
			}
		}
		return "redirect:/admin/background.listen";
	}

}
