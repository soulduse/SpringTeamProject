<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<SCRIPT>
function overLap()
{
	location.href = "/memberUpdate.listen";	
}
function cancel()
{
	location.href	= "/view.listen";
}
</SCRIPT>


<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#E4F2FC" width="250">
			<CENTER>
				<FONT color="blue" size="3"><B>회원 정보</B></FONT>
			</CENTER></TD>
		</TR>
	</TABLE>
	<BR>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="700">
		<TR>
			<TD width="100" bgcolor="#CFDDFA" align="center"><B>I D(Email)</B></TD>
			<TD bgcolor="#FFFFFF" colspan="3"><%= request.getAttribute("email")%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>비밀번호</B></TD>
			<TD bgcolor="#FFFFFF" colspan="3"><B><%= request.getAttribute("password")%></B></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>성 별</B></TD>
			<TD bgcolor="#FFFFFF" colspan="3"><%= request.getAttribute("gender")%> </TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>출생년도</B></TD>
			<TD bgcolor="#FFFFFF" colspan="3"><%= request.getAttribute("birthyear")%>년 </TD>
		</TR>
	</TABLE>
	<input type="button" value="정보수정하기" onclick=overLap();>
	<input type="button" value="전으로" onclick=cancel();>