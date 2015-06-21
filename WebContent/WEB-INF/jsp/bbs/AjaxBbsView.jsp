<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.listen.bbs.vo.*"%>
<%@ page import="com.listen.base.util.TotalDate"%>
<script type="text/javascript" src="js/ajax-bbsSelect.js"></script>

<%
	if (request.getAttribute("bbsSelectViewVo") != null) {
		BbsSelectViewVo bbsSelectViewVo = (BbsSelectViewVo) request.getAttribute("bbsSelectViewVo");
		int bbs_seq = bbsSelectViewVo.getBbs_seq();
		int bg_img_seq = bbsSelectViewVo.getBg_img_seq();
		int members_seq = bbsSelectViewVo.getMembers_seq();
		int hitCount = bbsSelectViewVo.getBbs_hitcount();
		int goodCount = bbsSelectViewVo.getGoodcount();
		int add_count = bbsSelectViewVo.getAdd_count();
		String contents = bbsSelectViewVo.getBbs_contents();
		String bbs_add_good_yn = bbsSelectViewVo.getBbs_add_good_yn();
		String bbs_good_yn = bbsSelectViewVo.getBbs_good_yn();
		String path = bbsSelectViewVo.getPath();
		String saveName = bbsSelectViewVo.getSave_name();
		String email = bbsSelectViewVo.getReg_email();
		String reg_date = bbsSelectViewVo.getReg_date();

		response.setCharacterEncoding("utf-8");
		PrintWriter outer = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		outer.print("<root>");
		String content = URLDecoder.decode(contents, "UTF-8"); // 한글처리부분
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String msg = "";
		
		try {
			Date date = format.parse(reg_date);
			msg = TotalDate.formatTimeString(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		outer.println("<items>");
		outer.println("<bbs_seq>" + bbs_seq + "</bbs_seq>");
		outer.println("<bg_img_seq>" + bg_img_seq + "</bg_img_seq>");
		outer.println("<members_seq>" + members_seq + "</members_seq>");
		outer.println("<hitcount>" + hitCount + "</hitcount>");
		outer.println("<goodcount>" + goodCount + "</goodcount>");
		outer.println("<add_count>" + add_count + "</add_count>");
		outer.println("<addgoodyn>" + bbs_add_good_yn + "</addgoodyn>");
		outer.println("<goodyn>" + bbs_good_yn + "</goodyn>");
		outer.println("<path>" + path + "</path>");
		outer.println("<savename>" + saveName + "</savename>");
		outer.println("<content>" + content + "</content>");
		outer.println("<reg_date>" + msg + "</reg_date>");
		outer.println("</items>");
		outer.println("</root>");
		outer.close();
	} else {
		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
	}
%>
