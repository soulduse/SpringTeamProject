<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%
	String code = (String)request.getAttribute("code");
	String id = (String)request.getAttribute("realId");

	if(code.equals("1"))
	{
	%>
	<%= "1^"+id+"^ȸ�� ������ �����մϴ�." %>
	<%
	}
	
	else if(code.equals("2"))
	{
%>
		<%= "2^"+id+"^�̹� ȸ������ ���ԵǾ� �ֽ��ϴ�."%>
<%
	}
%>