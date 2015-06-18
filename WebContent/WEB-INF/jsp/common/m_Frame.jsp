<%@ page contentType="text/html; charset=utf-8"%>
<%
	String mainUrl = "/WEB-INF/jsp/common/m_poto.jsp";
	int change = 1;
	System.out.println("m_frame.jsp");
	if (request.getAttribute("mainUrl") != null
			&& ((String) request.getAttribute("mainUrl")).length() > 0) {
		mainUrl = (String) request.getAttribute("mainUrl");
		System.out.println("mainUrl: " + mainUrl);
		change = 0;
	}
%>

<script src="js/jquery-1.8.2.min.js"></script>
<script>
	$(function() {
		$.mobile.ajaxEnabled = false;
		 	
		$('#select-h-2b').change(function() {
			var selectvar = $('#select-h-2b').val();
			if (selectvar == "m_main")
				location.href = "/m_main.listen";
			else
				location.href = "/m_myStory.listen?reg_email=houng9065@hanmail.net";

		});
	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<link rel="stylesheet" href="css/jquery-mobile-slide-menu.css"
	type="text/css" />
</head>
<body>

	<div data-role="page" id="about-the-band" data-title="Page Title"
		data-theme="b" class="pages">
		<div class="ui-grid-b" data-role="header" data-theme="a">
			<div class="ui-block-a" class="ui-grid-b">
				<div class="ui-block-a">
					<a href="#leftpanel3" data-role="button" data-shadow="true"
						data-icon="bars" data-iconpos="notext">Menu</a>
				</div>
				<div class="ui-block-b">
					<a href="#chatting" data-rel="popup" data-role="button"
						data-role="button" data-transition="slideup" class="chaticon"
						data-iconpos="notext">chatting</a>
				</div>
				<div class="ui-block-c"></div>
			</div>
			<div class="ui-block-b">
				<h1 style="margin: 0; padding: 0;">
					<select name="select-h-2b" id="select-h-2b" data-mini="true">
						<option value="m_main" class="standard" <%if(!mainUrl.equals("/WEB-INF/jsp/myStory/m_myStory.jsp")){  %>selected="selected"<%} %>><span
								data-icon="home" data-iconpos="left" >LISTEN</span></option>
						<option value="m_mystroy" class="mystroy" <%if(mainUrl.equals("/WEB-INF/jsp/myStory/m_myStory.jsp")){  %>selected="selected"<%} %>>MY STORY</option>

					</select>
				</h1>
			</div>
			<div class="ui-block-c" class="ui-grid-b">
				<div class="ui-block-a"></div>
				<div class="ui-block-b">
					<a href="#notification" data-rel="popup" data-role="button"
						class="bellicon" data-transition="slideup" data-iconpos="notext">notification</a>

				</div>
				<div class="ui-block-c">
					<a href="#rightpanel1" data-role="button" data-shadow="true"
						data-icon="search" data-iconpos="notext">Search</a>
				</div>
			</div>

		</div>
		<div data-role="content">
			<jsp:include page="<%=mainUrl%>" flush="true" />
		</div>


		<div data-role="panel" id="leftpanel3" data-position="left"
			data-display="overlay" data-dismissible="true">
			<H2>Listen</H2>
			<ul>
				<li><a href="/topStories.listen"><span class="icon"></span>인기
						있는 이야기</a></li>
				<li><a href="/interest.listen"><span class="icon"></span>관심
						있는 이야기</a></li>
				<li><a href="#opinion" data-rel="popup"
					data-position-to="window" data-transition="pop">의견 보내기</a><span
					class="icon"></span></li>
				<li><a href="/page-2/">설정</a><span class="icon"></span></li>
			</ul>
		</div>

		<div data-role="popup" id="opinion" data-theme="a">
			<form name="opinionWriteForm" id="opinionWriteForm"
				action="/admin/m_opinionWrite.listen" method="post">
				<div style="padding: 10px 20px;">
					<h3>의견 보내기</h3>
					<label for="bbs_contents">의견:</label>
					<textarea data-mini="true" cols="40" rows="8" name="bbs_contents"
						id="bbs_contents"></textarea>
					<button type="submit" data-theme="b" data-icon="check">보내기</button>
				</div>
				<INPUT type="hidden" name="reg_email" value="houng9065@hanmail.net">
				<INPUT type="hidden" name="reg_ip" value="127.0.0.1">
			</form>
		</div>



		<div data-role="popup" id="chatting">
			<ul data-role="listview" data-inset="true" style="min-width: 210px;"
				data-theme="d">
				<li data-role="divider" data-theme="a">Chatting List</li>
				<li><a href="#">체팅</a></li>
				<li><a href="#">뎃글</a></li>
				<li><a href="#">클로버</a></li>
				<li><a href="#">공감</a></li>
			</ul>
		</div>

		<div data-role="popup" id="notification">
			<ul data-role="listview" data-inset="true" style="min-width: 210px;"
				data-theme="d">
				<li data-role="divider" data-theme="a">알림</li>
				<li><a href="#">체팅</a></li>
				<li><a href="#">뎃글</a></li>
				<li><a href="#">클로버</a></li>
				<li><a href="#">공감</a></li>
			</ul>
		</div>

		<div data-role="panel" id="rightpanel1" data-position="right"
			data-display="overlay" data-dismissible="true">
			<ul data-role="listview" data-filter="true" data-filter-reveal="true"
				data-filter-placeholder="Search cars...">
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