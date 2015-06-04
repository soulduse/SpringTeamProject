<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>

<% ArrayList bbsList = (ArrayList)request.getAttribute("bbsList");
	System.out.println(bbsList);
	
	for(int i=0; i<bbsList.size(); i++)
	{
		
		BbsVo bbsVo = (BbsVo)bbsList.get(i);
		int bbs_seq = (int)bbsVo.getBbs_seq();
		String bbs_contents = (String)bbsVo.getBbs_contents();
		%>
		<%=bbs_contents%>
		<%
	}
	
%>
