<%@ page contentType="text/html; charset=utf-8" %>
<%
	String mainUrl = "/WEB-INF/jsp/common/m_poto.jsp"; 
	System.out.println("m_frame.jsp");
	if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
	{
		mainUrl = (String)request.getAttribute("mainUrl");
		System.out.println("mainUrl: "+mainUrl);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<link rel="stylesheet" href="css/jquery-mobile-slide-menu.css" type="text/css" />
</head>
<body>

	<div data-role="page" id="about-the-band" data-title="Page Title" data-theme="b" class="pages">
		<div class="ui-grid-b" data-role="header" data-theme="a"> 
			<div class="ui-block-a" class="ui-grid-b">
				<div class="ui-block-a"><a href="#leftpanel3" data-role="button"  data-shadow="true" data-icon="bars" data-iconpos="notext">Menu</a></div>
				<div class="ui-block-b">
					<a href="#chatting" data-rel="popup" data-role="button" data-role="button"  data-transition="slideup"  class="chaticon" data-iconpos="notext">chatting</a>
				</div>
				<div class="ui-block-c"></div>
			</div>
			<div class="ui-block-b" >
				<h1 style="margin: 0; padding: 0;">			
					<select name="select-h-2b" id="select-h-2b" data-mini="true">
						<option value="standard"><span data-icon="home" data-iconpos="left">LISTEN</span></option>
						<option value="rush">MY STORY</option>
					</select>
				</h1>
			</div>
			<div class="ui-block-c"class="ui-grid-b" >
				<div class="ui-block-a"></div>
				<div class="ui-block-b">
					<a href="#notification" data-rel="popup" data-role="button" class="bellicon" data-transition="slideup" data-iconpos="notext">notification</a>
				
				</div>
				<div class="ui-block-c"><a href="#rightpanel1"  data-role="button" data-shadow="true" data-icon="search" data-iconpos="notext">Search</a></div>
			</div>
			
		</div>
		<div data-role="content" >
		
			<a href="#popupParis" data-rel="popup" data-position-to="window" data-transition="fade"><img class="popphoto" src="../../_assets/img/paris.jpg" alt="Paris, France" style="width:30%"></a>
			<a href="#popupSydney" data-rel="popup" data-position-to="window" data-transition="fade"><img class="popphoto" src="../../_assets/img/sydney.jpg" alt="Sydney, Australia" style="width:30%"></a>
			<a href="#popupNYC" data-rel="popup" data-position-to="window" data-transition="fade"><img class="popphoto" src="../../_assets/img/newyork.jpg" alt="New York, USA" style="width:30%"></a>
			<div data-role="popup" id="popupParis" data-overlay-theme="a" data-theme="d" data-corners="false">
			    <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a><img class="popphoto" src="../../_assets/img/paris.jpg" style="max-height:512px;" alt="Paris, France">
			</div>
			<div data-role="popup" id="popupSydney" data-overlay-theme="a" data-theme="d" data-corners="false">
			    <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a><img class="popphoto" src="../../_assets/img/sydney.jpg" style="max-height:512px;" alt="Sydney, Australia">
			</div>
			<div data-role="popup" id="popupNYC" data-overlay-theme="a" data-theme="d" data-corners="false">
			    <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a><img class="popphoto" src="../../_assets/img/newyork.jpg" style="max-height:512px;" alt="New York, USA">
			</div>
					<jsp:include page="<%=mainUrl%>" flush="true" />
		</div>

	<div  data-role="panel" id="leftpanel3"  data-position="left" data-display="overlay"  data-dismissible="true" >
			<H2>Listen</H2> 
			<ul>
				<li><a href="http://www.naver.com"><span class="icon"></span>인기 있는 이야기</a></li>
				<li><a href="http://www.naver.com"><span class="icon"></span>관심 있는 이야기</a></li>
				<li><a href="/page-3/">의견 보내기</a><span class="icon"></span></li>				
				<li><a href="/page-2/">설정</a><span class="icon"></span></li>
			</ul>
	</div>
		
	<div data-role="popup" id="chatting">
        <ul data-role="listview" data-inset="true" style="min-width:210px;" data-theme="d">
            <li data-role="divider" data-theme="a">Chatting List</li>
            <li><a href="#">채팅</a></li>
            <li><a href="#">댓글</a></li>
            <li><a href="#">클로버</a></li>
            <li><a href="#">공감</a></li>
        </ul>
	</div>
 <%
 	if(session.getAttribute("LoginYn") == "Y")
 	{
 		%>
 		<a href="/mMemberInfo.listen">
 		<font color="white" size="3"><%=session.getAttribute("email") %>님</font> </a>
 	<%
 	}
 %>
	<div data-role="popup" id="notification">
        <ul data-role="listview" data-inset="true" style="min-width:210px;" data-theme="d">
            <li data-role="divider" data-theme="a">알림</li>
            <li><a href="#">채팅</a></li>
            <li><a href="#">댓글</a></li>
            <li><a href="#">클로버</a></li>
            <li><a href="#">공감</a></li>
        </ul>
	</div>
	
	<div data-role="panel" id ="rightpanel1" data-position="right" data-display="overlay" data-dismissible="true" >
		<ul data-role="listview" data-filter="true" data-filter-reveal="true" data-filter-placeholder="Search cars...">
			<li><a href="#">Acura</a></li>
			<li><a href="#">Audi</a></li>
			<li><a href="#">BMW</a></li>
			<li><a href="#">Cadillac</a></li>
			<li><a href="#">Chrysler</a></li>
			<li><a href="#">Dodge</a></li>
			<li><a href="#">Ferrari</a></li>
			<li><a href="#">Ford</a></li>
			<li><a href="#">GMC</a></li>
			<li><a href="#">Honda</a></li>
			<li><a href="#">Hyundai</a></li>
			<li><a href="#">Infiniti</a></li>
			<li><a href="#">Jeep</a></li>
			<li><a href="#">Kia</a></li>
			<li><a href="#">Lexus</a></li>
			<li><a href="#">Mini</a></li>
			<li><a href="#">Nissan</a></li>
			<li><a href="#">Porsche</a></li>
			<li><a href="#">Subaru</a></li>
			<li><a href="#">Toyota</a></li>
			<li><a href="#">Volkswagen</a></li>
			<li><a href="#">Volvo</a></li>
		</ul>
	</div>
	</div>
</body>
</html>