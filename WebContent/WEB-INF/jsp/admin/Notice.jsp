<%@ page contentType="text/html; charset=euc-kr"%>

<%
	String name = 

%>
<SCRIPT>
	$(function(){
		var writeForm = $('#writeForm');
		
		$('#write-btn').click(function(){
			var titleInput = $('input:text[name=noti-title]');
			var titleValue = trim(titleInput.val());
			if(titleValue === "")
			{
				window.alert("글 제목을 입력하세요.");
				titleInput.select();
				return false;
			}
			titleInput.val(titleValue);

			var contentInput = $('[name=noti-content]');
			var contentValue = trim(contentInput.val());
			if(contentValue === "")
			{
				window.alert("글 내용을 입력하세요.");
				contentInput.select();
				return false;
			}
			contentInput.val(contentValue);
			
			writeForm.submit();
		});
		
		$('#modalWriteBtn').click(function(){
			textClear();
		});
	});
	
	function textClear()
	{
		var titleInput = $('input:text[name=noti-title]');
		var contentInput = $('[name=noti-content]');
		
		titleInput.val("");
		contentInput.val("");
	}
	
</SCRIPT>
	
<div class="btn-group" role="group" aria-label="menuGroup">
  <button type="button" class="btn btn-success" onclick="location.href='/admin/notice.listen'">공지사항</button>
  <button type="button" class="btn btn-success" onclick="location.href='/admin/background.listen'">배경그림 설정</button>
  <button type="button" class="btn btn-success" onclick="location.href='/admin/opinion.listen'">의견보기</button>
</div>

<BR>
<BR>
<BR>
<CENTER>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="col-md-1">#</th>
				<th class="col-md-1">No</th>
				<th class="col-md-5">제목</th>
				<th class="col-md-2">작성자</th>
				<th class="col-md-2">작성일</th>
				<th class="col-md-1">조회</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="checkbox">
						<label> <input type="checkbox">
						</label>
					</div>
				</td>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>@mdo</td>
			</tr>
		</tbody>
	</table>

</CENTER>

<button type="button" class="btn btn-primary"	onclick="location.href='/admin/opinion.listen'">삭제</button>
<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#writeModal" id="modalWriteBtn">글쓰기</button>


<div class="modal fade" id="writeModal" style="width: 100%" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="margin-top:150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">공지사항 글쓰기</h4>
			</div>
			<div class="modal-body">
				<form name="writeForm" id="writeForm" action="/bbsServlet.mo" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">제목</label>
						<input type="text" class="form-control" id="noti-title" name="noti-title" placeholder="글 제목을 입력하세요." >
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">내용</label>
						<textarea class="form-control" id="noti-content" name="noti-content" rows="12" placeholder="글 내용을 입력하세요."></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="write-btn">글쓰기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

