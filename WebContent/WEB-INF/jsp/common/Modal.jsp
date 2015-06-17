<%@ page contentType="text/html; charset=euc-kr"%>

<SCRIPT>
$(function(){
	// 의견 보내기 버튼
	$('#opinionWriteBtn').click(function(){
		$('#opinionWriteForm').submit();
		alert("의견이 전달 되었습니다.");
	});
	
	$('#bbsWriteModalBtn').click(function(){
		inputClear();
	});
	
	$('#bbsWriteBtn').click(function(){
		$('#bbsWriteForm').submit();
		alert("글이 등록 되었습니다.");
	});
});

function inputClear() {
	var contentInput = $('[name=bbs_contents]');
	contentInput.val("");
}

</SCRIPT>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">의견 보내기</h4>
			</div>
			<div class="modal-body">
				<form name="opinionWriteForm" id="opinionWriteForm"	action="/admin/opinionWrite.listen" method="post">
					<div class="form-group">
						<label for="message-text" class="control-label">의견</label>
						<textarea class="form-control" id="bbs_contents"
							name="bbs_contents" rows="12" placeholder="여기에 적어주세요."></textarea>
					</div>
					<INPUT type="hidden" name="reg_email" value="<%=reg_email%>">
					<INPUT type="hidden" name="reg_ip" value="<%=reg_ip%>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="opinionWriteBtn">보내기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 글작성 모달 -->
<div class="modal fade" id="BbswriteModal" tabindex="-1" role="dialog"
	style="width: 100%" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 80px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">글작성</h4>
			</div>
			<div class="modal-body">
				<form name="bbsWriteForm" id="bbsWriteForm" enctype="multipart/form-data" method="post" action="/writeSave.listen">
					<div class="form-group">
						<label for="message-text" class="control-label">내용</label>
						<textarea class="form-control" id="bbs_contents"
							name="bbs_contents" rows="12" placeholder="여기에 적어주세요."></textarea>
					</div>
					<input id="file-0a" class="file" type="file" name="upload" multiple data-min-file-count="1"> <br>
					<input type="hidden" name="reg_email" value="<%=reg_email %>">
					<input type="hidden" name="reg_ip" value="<%=reg_ip %>">
					<input type="hidden" name="state" id="bgWriteState">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="bbsWriteBtn">등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>