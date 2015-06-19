<%@ page contentType="text/html;charset=utf-8"%>
<%
	String mainUrl = "/WEB-INF/jsp/common/Main.jsp";
	System.out.println("frame.jsp");
	//if (request.getAttribute("mainUrl") != null
		//	&& ((String) request.getAttribute("mainUrl")).length() > 0) {
		//mainUrl = (String) request.getAttribute("mainUrl");
		//System.out.println("mainUrl: " + mainUrl);
	//}
	System.out.println("2");
%>

<HTML>
<HEAD>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<TITLE>마음이 따뜻해지는 익명SNS - Listen</TITLE>

<!-- 부트스트랩 -->
<LINK href="/css/bootstrap.css" rel="stylesheet">

<!-- Main CSS -->
<LINK href="/css/common.css" rel="stylesheet" type="text/css" />

<!-- JQuery -->
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>

<!-- 기본 Js -->
<SCRIPT src="/js/common.js"></SCRIPT>

</HEAD>

<BODY style="margin: 0px">
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<SCRIPT
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></SCRIPT>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<SCRIPT src="/js/bootstrap.min.js"></SCRIPT>

	<center>
		<div id="wrap">
			<div id="header">
				<jsp:include page="Top.jsp" />
			</div>
			<div id="content">
				<jsp:include page="<%=mainUrl%>" flush="true" />
			</div>
			
			<div id="modal">
				<jsp:include page="Modal.jsp" />
			</div>
		</div>
	</center>
</BODY>
<HTML>

