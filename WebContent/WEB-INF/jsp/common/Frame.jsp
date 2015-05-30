<%@ page contentType="text/html;charset=euc-kr" %>
<%
	String mainUrl = "/WEB-INF/jsp/common/Main.jsp"; 
	System.out.println("frame.jsp");
	if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
	{
		mainUrl = (String)request.getAttribute("mainUrl");
		System.out.println("mainUrl: "+mainUrl);
	}

%>
<META charset="utf-8" />
<LINK rel="stylesheet" type="text/css" href="css/main.css" />
<SCRIPT src="js/jquery-2.1.3.min.js"></SCRIPT>

<HTML>
	<HEAD>
		<TITLE>ÄíÆþ</TITLE>
	</HEAD>
	
	<BODY style="margin:0px">
	<center>
		<div id="wrap">
			<div id="header"> 
				<jsp:include page ="Top.jsp"/>
			</div>
			<div id="nav"> 
				<jsp:include page ="Nav.jsp"/>	
			</div>
			<div id="middle"> 
				<div id="content">
					<jsp:include page="<%=mainUrl%>" flush="true" />
				</div>
				<!--
				<div id="sidebar"> 
					<jsp:include page="Right.jsp"/>
				</div>
				-->
			</div>
			<div id="footer"> 
				<jsp:include page ="Bottom.jsp"/>
			</div>
		</div>
	</center>	
	</BODY>

<HTML>

