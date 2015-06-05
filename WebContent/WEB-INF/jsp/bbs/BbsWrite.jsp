<%@ page contentType="text/html; charset=euc-kr"%>

<% 
	String message = "adfasdfasdf";
	if(request.getAttribute("message") != null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
	
%>

<P>글쓰기 페이지</P>

<SCRIPT>
	$(function() {
		$('#writeBtn').click(function() {
			//var writeForm = $('#writeForm');
			$('#writeForm').submit();
			alert(<%=message%>);
		});
	});
	
</SCRIPT>

<BODY>   
	<FORM name="writeForm" method="post" id="writeForm" enctype="multipart/form-data" action="/writeSave.listen">
		<P>할말 입력해</P>
		<INPUT type="text" name="bbs_contents" id="bbs_contents">
		<P>파일 등록해</P>
		<INPUT type="file" name="upload"/>
		<INPUT type="button" id="writeBtn" value="등록"/>
	</FORM>
</BODY>