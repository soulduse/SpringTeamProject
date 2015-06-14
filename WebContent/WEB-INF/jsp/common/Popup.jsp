<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%
	String mainUrl = "/WEB-INF/jsp/common/Main.jsp"; 
	System.out.println("frame.jsp");
	if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
	{
		mainUrl = (String)request.getAttribute("mainUrl");
		System.out.println("mainUrl: "+mainUrl);
	}

	ArrayList noticeList = (ArrayList)request.getAttribute("noticeList");
	String roomname = (String)noticeList.get(0);
	String nickname = (String)noticeList.get(1);
	String email = (String)session.getAttribute("email");
%>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script>

$(function() {
	var roomname = $('#roomname').val();
	var nickname = $('#nickname').val();
	var nickname = $('#email').val();
	window.open("http://106.242.203.67:900/chatting/"+encodeURIComponent(roomname)+"?name="+encodeURIComponent(nickname), '1', 'width=600, height=800, resizable=no');

});
   </script>
   
<HTML>
	<HEAD>
		 <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<INPUT type="hidden" name="roomname" id="roomname" value="<%=roomname %>">
	<INPUT type="hidden" name="nickname" id="nickname" value="<%=nickname %>">
	<INPUT type="hidden" name="email" id="email" value="<%=email %>">
		<TITLE>마음이 따뜻해지는 익명SNS - Listen</TITLE>
		
		 <!-- 부트스트랩 -->
    	<LINK href="/css/bootstrap.css" rel="stylesheet">
    	
    	<!-- Main CSS -->
    	<LINK href="/css/common.css" rel="stylesheet" type="text/css"/>
    	
    	<!-- JQuery -->
		<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
	</HEAD>
	
	<BODY style="margin:0px">
	 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <SCRIPT src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></SCRIPT>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <SCRIPT src="/js/bootstrap.min.js"></SCRIPT>
    
	<center>
		<div id="wrap">
			<div id="header"> 
				<jsp:include page ="Top.jsp"/>
			<div id="middle"> 
				<div id="content">
					<jsp:include page="<%=mainUrl%>" flush="true" />
			<div id="footer"> 
				<jsp:include page ="Bottom.jsp"/>
			</div>
		</div>
	</center>	
	</BODY>

<HTML>

