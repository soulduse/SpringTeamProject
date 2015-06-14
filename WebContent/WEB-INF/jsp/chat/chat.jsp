<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.chatting.vo.*" %>
<%@ page import="com.listen.notice.vo.*" %>
<html>
<head>
<title>Chatting</title>
<script>
<% 
	ArrayList chatList = (ArrayList)request.getAttribute("chatList");
	ArrayList noticeList = (ArrayList)request.getAttribute("noticeList");
%>
$(function() {
	//방만들기 
	$(".room_make").click(function() {
		var num = $(this).attr("id");
		alert(num);
		var CreateRoomForm = "#CreateRoomForm" + num;
		alert(CreateRoomForm);
		$(CreateRoomForm).submit();
	});
	$("#chattingroom").click(function() {
		var num =  $(this).attr("class");
		var url = $('#roomname'+num).val();
		alert(url);
		window.open(url, '1');
	});
});


</script>
</head>

<body>

<h1>채팅</h1>
		<fieldset id = "roommake">
			<legend>알림</legend>
<% 
for(int i=0; i < noticeList.size(); i++)
{
	NoticeVo noticeVo = (NoticeVo) noticeList.get(i);
	int send_seq = (int)noticeVo.getMembers_seq();
	int rec_seq = (int)noticeVo.getRec_seq();
	String content = (String)noticeVo.getContent();
	String state_name = (String)noticeVo.getState_name();
			
%>
	
	<FORM name="CreateRoomForm<%=i %>>" method="post" id="CreateRoomForm<%=i %>" action="/createRoom.listen">
				<INPUT type="hidden" name="send_seq" value="<%= send_seq%>">
				<INPUT type="hidden" name="rec_seq" value="<%= rec_seq%>">
			<%= state_name%>     <%= content%><br>			
	<input class= "room_make" id="<%=i %>" type = "button" value = "수락">
	</FORM>
<%
}
%>
		</fieldset>
<fieldset id = "room" >
	<legend>개설된 방목록 </legend>
	<div id = "roomlist">
<% 
for(int i=0; i < chatList.size(); i++)
{
	ChattingVo chattingVo = (ChattingVo) chatList.get(i);
	String roomname = (String)chattingVo.getChatting_name();
	String nickname = (String)chattingVo.getRamdom_name();
	
	%>
	<A href="#" id = "chattingroom" class="<%=i %>"><%= roomname %></A><BR/>
	
	<INPUT type="hidden" name="roomname<%=i %>" id="roomname<%=i %>" value="http://localhost:900/chatting/<%=roomname %>?name=<%=nickname %>">
	
<%
}
%>
</div>
</fieldset>

</body>
</html>