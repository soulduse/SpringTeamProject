<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%
	String code = (String)request.getAttribute("code");
	String id = (String)request.getAttribute("realId");

	if(code.equals("1"))
	{
	%>
	<%= "1^"+id+"^회원 가입이 가능합니다." %>
	<%
	}
	
	else if(code.equals("2"))
	{
%>
		<%= "2^"+id+"^이미 회원으로 가입되어 있습니다."%>
<%
	}
%>