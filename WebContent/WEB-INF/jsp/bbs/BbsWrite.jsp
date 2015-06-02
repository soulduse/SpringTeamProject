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
	<FORM name="writeForm" method="post" id="writeForm" enctype="multipart/form-data" action="/writePage.listen">
		<INPUT type="file" name="upload"/>
		<INPUT type="button" id="writeBtn" value="등록"/>
	</FORM>
</BODY>