<%@ page contentType="text/html; charset=euc-kr"%>

<P>글쓰기 페이지</P>

<SCRIPT>
	$(function() {
		$('#writeBtn').click(function() {
			//var writeForm = $('#writeForm');
			$('#writeForm').submit();
		});
	});
	
</SCRIPT>

<BODY>  
<!--  
	<FORM name="writeForm" method="post" id="writeForm" enctype="multipart/form-data" action="/writePage.listen">
		<INPUT type="file" name="upload"/>
		<INPUT type="button" id="writeBtn" value="등록"/>
	</FORM>
-->
	<FORM name="writeForm" id="writeForm" action="/writeSave.listen" method="post">
		<P>할말 입력해</P>
		<INPUT type="text" name="bbs_contents" id="bbs_contents">
		
		<P><INPUT id="writeBtn" type="button" value="입력"></P>
	</FORM>
</BODY>