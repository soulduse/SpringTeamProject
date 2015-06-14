<%@ page contentType="text/html; charset=euc-kr"%>

<%
	String reg_email = (String) session.getAttribute("email");
	String reg_ip = request.getRemoteAddr();
%>
<!-- 의견보내기 Modal -->
<div class="modal fade" id="opinionModal" style="width: 100%"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">의견 보내기</h4>
			</div>
			<div class="modal-body">
				<form name="writeForm" id="writeForm"
					action="/admin/opinionWrite.listen" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">제목</label> <input
							type="text" class="form-control" id="bbs_title" name="bbs_title"
							placeholder="글 제목을 입력하세요.">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">내용</label>
						<textarea class="form-control" id="bbs_contents"
							name="bbs_contents" rows="12" placeholder="글 내용을 입력하세요."></textarea>
					</div>
					<INPUT type="hidden" name="reg_email" value="<%=reg_email%>">
					<INPUT type="hidden" name="reg_ip" value="<%=reg_ip%>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="write-btn">글쓰기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>