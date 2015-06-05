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
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
%>

<LINK href="/css/common.css" rel="stylesheet" type="text/css"/>
	<div class="image">
	<img alt="" class="imageShadow" src="<%=path%>/<%=save_name%>" width=300/>
  		<div class="text">
   	 		<H3><%=bbs_contents%></h3>
   	 	</div>
   	 	<div alian="right" ><%=bbs_hitCount%></div>
	</div>
      <%
   }
   
%>