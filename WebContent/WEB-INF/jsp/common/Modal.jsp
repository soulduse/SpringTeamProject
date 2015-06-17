<%@ page contentType="text/html; charset=euc-kr"%>

<SCRIPT>
$(function(){
	// �ǰ� ������ ��ư
	$('#opinionWriteBtn').click(function(){
		$('#opinionWriteForm').submit();
		alert("�ǰ��� ���� �Ǿ����ϴ�.");
	});
	
	$('#bbsWriteModalBtn').click(function(){
		inputClear();
	});
	
	$('#bbsWriteBtn').click(function(){
		$('#bbsWriteForm').submit();
		alert("���� ��� �Ǿ����ϴ�.");
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
<!-- �ǰߺ����� Modal -->
<div class="modal fade" id="opinionModal" style="width: 100%"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">�ǰ� ������</h4>
			</div>
			<div class="modal-body">
				<form name="opinionWriteForm" id="opinionWriteForm"	action="/admin/opinionWrite.listen" method="post">
					<div class="form-group">
						<label for="message-text" class="control-label">�ǰ�</label>
						<textarea class="form-control" id="bbs_contents"
							name="bbs_contents" rows="12" placeholder="���⿡ �����ּ���."></textarea>
					</div>
					<INPUT type="hidden" name="reg_email" value="<%=reg_email%>">
					<INPUT type="hidden" name="reg_ip" value="<%=reg_ip%>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="opinionWriteBtn">������</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>

<!-- ���ۼ� ��� -->
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
				<h4 class="modal-title" id="exampleModalLabel">���ۼ�</h4>
			</div>
			<div class="modal-body">
				<form name="bbsWriteForm" id="bbsWriteForm" enctype="multipart/form-data" method="post" action="/writeSave.listen">
					<div class="form-group">
						<label for="message-text" class="control-label">����</label>
						<textarea class="form-control" id="bbs_contents"
							name="bbs_contents" rows="12" placeholder="���⿡ �����ּ���."></textarea>
					</div>
					<input id="file-0a" class="file" type="file" name="upload" multiple data-min-file-count="1"> <br>
					<input type="hidden" name="reg_email" value="<%=reg_email %>">
					<input type="hidden" name="reg_ip" value="<%=reg_ip %>">
					<input type="hidden" name="state" id="bgWriteState">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="bbsWriteBtn">���</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>