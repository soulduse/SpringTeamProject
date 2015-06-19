<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.listen.chatting.vo.*"%>
<%@ page import="com.listen.notice.vo.*"%>

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
	ArrayList chatList = (ArrayList) session.getAttribute("chatList");
	ArrayList noticeList = (ArrayList) session
			.getAttribute("noticeList");
	String email = "houng9065@hanmail.net";
	email = (String) session.getAttribute("email");
%>

<script src="js/jquery-1.8.2.min.js"></script>
<script>
	$(function() {
		$.mobile.ajaxEnabled = false;

		var email = $('#email').val();

		$('#select-h-2b').change(function() {
			var selectvar = $('#select-h-2b').val();
			if (selectvar == "m_main")
				location.href = "/m_main.listen";
			else
				location.href = "/m_myStory.listen";

		});

		//방만들기 
		$(".room_make").click(
				function() {
					alert();
					var roomname = $('#roomname' + num).val();
					var nickname = $('#nickname' + num).val();
					var email = $('#email' + num).val();
					window.open("http://106.242.203.67:900/m_chatting/"
							+ encodeURIComponent(roomname) + "?name="
							+ encodeURIComponent(nickname), '1',
							'width=600, height=800, resizable=no');
					var num = $(this).attr("id");
					var CreateRoomForm = "#CreateRoomForm" + num;
					alert();
					$(CreateRoomForm).submit();
				});

		// 방 입장
		$(".chattingroom").click(
				function() {
					var num = $(this).attr("id");
					var roomname = $('#roomname' + num).val();
					var nickname = $('#nickname' + num).val();
					var email = $('#email' + num).val();
					window.open("http://106.242.203.67:900/m_chatting/"
							+ encodeURIComponent(roomname) + "?name="
							+ encodeURIComponent(nickname), '1',
							'width=600, height=800, resizable=no');
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

	<INPUT type="hidden" name="email" id="email" value="<%= email %>">
	<div data-role="page" id="about-the-band" data-title="Page Title"
		data-theme="b" class="pages">
		<div class="ui-grid-b" data-role="header" data-theme="a" data-position="fixed">
			<div class="ui-block-a" class="ui-grid-b">
				<div class="ui-block-a">
					<a href="#leftpanel3" data-role="button" data-shadow="true"
						data-icon="bars" data-iconpos="notext">Menu</a>
				</div>
				<div class="ui-block-b">
					<a href="#chatting" data-rel="popup" data-role="button"
						data-role="button" data-transition="pop" class="chaticon"
						data-iconpos="notext">chatting</a>
				</div>
				<div class="ui-block-c"></div>
			</div>
			<div class="ui-block-b">
				<h1 style="margin: 0; padding: 0;">
					<select name="select-h-2b" id="select-h-2b" data-mini="true">
						<option value="m_main" class="standard"
							<%if (!mainUrl.equals("/WEB-INF/jsp/myStory/m_myStory.jsp")) {%>
							selected="selected" <%}%>><span data-icon="home"
								data-iconpos="left">LISTEN</span></option>
						<option value="m_mystroy" class="mystroy"
							<%if (mainUrl.equals("/WEB-INF/jsp/myStory/m_myStory.jsp")) {%>
							selected="selected" <%}%>>MY STORY</option>

					</select>
				</h1>
			</div>
			<div class="ui-block-c" class="ui-grid-b">
				<div class="ui-block-a"></div>
				<div class="ui-block-b">
					<a href="#notification" data-rel="popup" data-role="button"
						class="bellicon" data-transition="pop" data-iconpos="notext">notification</a>

				</div>
				<div class="ui-block-c">
					<a href="#popupWirth" data-role="button" data-rel="popup"
						data-position-to="window" data-transition="pop"
						class="pen" data-iconpos="notext">글쓰기</a>
				</div>
			</div>

		</div>
		<div data-role="content" style="background: transparent url('../images/back4.png') 0 0 no-repeat; ">
			<jsp:include page="<%=mainUrl%>" flush="true" />
			
	<div data-role="popup" id="popupWirth" data-theme="a"
		class="ui-corner-all">
		<FORM name="writeForm" method="post" id="writeForm"
			enctype="multipart/form-data" action="/m_writeSave.listen">
			<div style="padding: 10px 20px;">
				<h3>글쓰기</h3>
				<label for="bbs_contents">Textarea:</label>
				<textarea data-mini="true" cols="40" rows="8" name="bbs_contents"
					id="bbs_contents"></textarea>
				<label for="upload">File</label> <input type="file"
					data-clear-btn="false" name="upload" id="upload" value="">
				<button type="submit" data-theme="b" data-icon="check">글등록</button>
			</div>
		</form>
	</div>
	
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
				
				<li><a href="#rightpanel1" data-shadow="true">Search</a>
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
				<INPUT type="hidden" name="reg_email" value="<%= email %>">
				<INPUT type="hidden" name="reg_ip" value="127.0.0.1">
			</form>
		</div>



		<div data-role="popup" id="chatting">
			<ul data-role="listview" data-inset="true" style="min-width: 210px;"
				data-theme="d">
				<li data-role="divider" data-theme="a">Chatting List</li>
				<%
					if (session.getAttribute("email") != null) {
						for (int i = 0; i < chatList.size(); i++) {
							ChattingVo chattingVo = (ChattingVo) chatList.get(i);
							String roomname = (String) chattingVo.getChatting_name();
							String nickname = (String) chattingVo.getRamdom_name();
							
							if (chatList.size() > 0) {
				%>
				<INPUT type="hidden" name="roomname<%=i%>" id="roomname<%=i%>"
					value="<%=roomname%>">
				<INPUT type="hidden" name="nickname<%=i%>" id="nickname<%=i%>"
					value="<%=nickname%>">
				<INPUT type="hidden" name="email<%=i%>" id="email<%=i%>"
					value="<%=email%>">
				<li><a href="#" class="chattingroom" id="<%=i%>"><%=roomname%></a></li>

				<%
					} else {
				%>


				<li><a href="#">회원자의 개설된 채팅 방이 없습니다.</a></li>
				<%
					}
						}
					}
				%>
			</ul>
		</div>

		<div data-role="popup" id="notification">
			<ul data-role="listview" data-inset="true" style="min-width: 210px;"
				data-theme="d">
				<li data-role="divider" data-theme="a">알림</li>
				<%
					if (session.getAttribute("email") != null) {
						for (int i = 0; i < noticeList.size(); i++) {
							NoticeVo noticeVo = (NoticeVo) noticeList.get(i);
							int notifications_seq = (int) noticeVo
									.getNotifications_seq();
							int send_seq = (int) noticeVo.getMembers_seq();
							int rec_seq = (int) noticeVo.getRec_seq();
							int noti_state_seq = (int) noticeVo.getNoti_state_seq();
							String content = (String) noticeVo.getContent();
							if (noticeList.size() > 0) {
				%>
				<FORM name="CreateRoomForm<%=i%>>" method="post"
					id="CreateRoomForm<%=i%>" action="/m_createRoom.listen">
					<INPUT type="hidden" name="notifications_seq"
						value="<%=notifications_seq%>"> <INPUT type="hidden"
						name="send_seq" value="<%=send_seq%>"> <INPUT
						type="hidden" name="rec_seq" value="<%=rec_seq%>">
					<%
						if (noti_state_seq == 1) {
					%>
					<li><img src="/images/message.png"><%=content%>&nbsp;&nbsp;<input
						class="room_make" id="<%=i%>" type="button" value="수락"></li>
					<%
						}
									if (noti_state_seq == 2) {
					%>
					<li><img src="/images/clover.png"></li>
					<%
						}
									if (noti_state_seq == 4) {
					%>
					<li><img src="/images/heart.png"><a><%=content%></a>&nbsp;&nbsp;
					</li>
					<%
						}
									if (noti_state_seq == 5) {
					%>
					<li><img src="/images/port.png"><a><%=content%></a>&nbsp;&nbsp;
					</li>
					<%
						}
									if (noti_state_seq == 6) {
					%>
					<li><img src="/images/notice.png"><a><%=content%></a>&nbsp;&nbsp;
					</li>
					<%
						}
								} else {
					%>

					<li><a href="#">회원자의 개설된 채팅 방이 없습니다.</a></li>

					<%
						}
					%>
				</FORM>
				<%
					}
					}
				%>
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