<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.listen.admin.vo.AdminNoticeVo"%>

<%
	String reg_email = (String) session.getAttribute("email");
	String reg_ip = request.getRemoteAddr();

	boolean loginYn = false;
	boolean adminYn = false;
	if (session != null && session.getAttribute("LoginYn") != null
			&& ((String) session.getAttribute("LoginYn")).equals("Y")) {
		loginYn = true;
	}
	/*
	if(loginYn && ((String)session.getAttribute("adminYn")).equals("Y"))
	{
		adminYn = true;
	}
	 */
%>
<SCRIPT>
	$(function() {
		var writeForm = $('#writeForm');
		var noticeViewForm = $('#noticeViewForm');
		var noticeSeq = noticeViewForm.find('input:hidden[name=bbs_seq]');
		var noticeHit = noticeViewForm.find('input:hidden[name=hit]');
		//var noticeSection = noticeViewForm.find('input:hidden[name=section]');
		//var noticePageNum = noticeViewForm.find('input:hidden[name=pageNum]');

		// �������� ���
		$('#write-btn').click(function() {
			var titleInput = $('input:text[name=bbs_title]');
			var titleValue = trim(titleInput.val());
			if (titleValue === "") {
				window.alert("�� ������ �Է��ϼ���.");
				titleInput.select();
				return false;
			}
			titleInput.val(titleValue);

			var contentInput = $('[name=bbs_contents]');
			var contentValue = trim(contentInput.val());
			if (contentValue === "") {
				window.alert("�� ������ �Է��ϼ���.");
				contentInput.select();
				return false;
			}
			contentInput.val(contentValue);

			writeForm.submit();
		});

		$('#modalWriteBtn').click(function() {
			textClear();
		});

		// �������� �ۺ���
		$('.noticeView').click(function() {
			var noticeArticle = $(this);
			noticeSeq.val(noticeArticle.attr('bbs_seq'));
			noticeHit.val(noticeArticle.attr('hit'));
			noticeViewForm.submit();
		});

		// �������� ����Ʈ üũ�ڽ� �̿��ѻ���
		$('#noticeListDelete').click(function(){
			var arr_seq = $('#array_bbs_seq');
			var eachObj = document.getElementsByName("noticeCheck");
			var eachObjSize = eachObj.length;  
			var arrFir = new Array();
			var cnt = 0;
			
			for (var i = 0; i < eachObjSize; ++i) 
			{
				if (eachObj[i].checked == true) 
				{
					arrFir[cnt] = eachObj[i].value;
					arr_seq.val(arrFir[cnt]);
					$('#arrayDelForm').submit();
					cnt++;
				}
			}
			if(arrFir.length == null || arrFir.length<=0)
			{
				alert("üũ�� �׸��� �������� �ʽ��ϴ�.");
			}
			
		});
	});

	function textClear() {
		var titleInput = $('input:text[name=bbs_title]');
		var contentInput = $('[name=bbs_contents]');

		titleInput.val("");
		contentInput.val("");
	}

	// üũ�ڽ� ��ü ����
	function selectAllCheckBox(chbox) //chbox selectAll ������ ����.
	{
		var eachObj = document.getElementsByName("noticeCheck"); //
		var eachObjSize = eachObj.length; // 

		if (chbox.checked == true) {
			for (i = 0; i < eachObjSize; ++i) {
				eachObj[i].checked = true; // ��ü ���õ� true�� ��� selectOne���ٰ� ����
			}
		} else {
			for (i = 0; i < eachObjSize; ++i) {
				eachObj[i].checked = false; // ��ü ���õ� true�� ��� selectOne���ٰ� ����
			}
		}
	}
</SCRIPT>

<div class="btn-group" role="group" aria-label="menuGroup">
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/notice.listen'">��������</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/background.listen'">���׸� ����</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/opinion.listen'">�ǰߺ���</button>
</div>

<BR>
<BR>
<BR>
<H2 align="center">��������</H2>
<BR>
<BR>
<BR>

<!-- ���� ���� �� -->
<FORM name="noticeViewForm" id="noticeViewForm"	action="/admin/noticeView.listen" method="post">
	<INPUT type="hidden" name="bbs_seq"> <INPUT type="hidden" name="hit">
</FORM>

<!-- ���� ���� �� -->
<FORM name="arrayDelForm" id="arrayDelForm" action="/admin/noticeDelete.listen" method="post">
	<INPUT type="hidden" name="bbs_seq" id="array_bbs_seq">
</FORM>


<CENTER>
<DIV class="row">
<DIV class="col-md-6 col-md-offset-3">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="col-md-1">#</th>
				<th class="col-md-1">No</th>
				<th class="col-md-5">����</th>
				<th class="col-md-2">�ۼ���</th>
				<th class="col-md-2">�ۼ���</th>
				<th class="col-md-1">��ȸ</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (((ArrayList) request.getAttribute("noticeList")).size() > 0
						&& request.getAttribute("noticeList") != null) {
					ArrayList noticeList = (ArrayList) request	.getAttribute("noticeList");
					for (int i = 0; i < noticeList.size(); i++) {
						AdminNoticeVo noticeVo = (AdminNoticeVo) noticeList.get(i);
						int bbs_seq = (int) noticeVo.getBbs_seq();
						String bbs_title = (String) noticeVo.getBbs_title();
						String name = (String) noticeVo.getReg_email();
						String date = (String) noticeVo.getReg_date();
						int hitCount = (int) noticeVo.getBbs_hitCount();
						if (bbs_title.length() > 22) {
							bbs_title = bbs_title.substring(0, 19) + "...";
						}

						String hit = "Y";
						/*
						if((loginYn && name.equals((String)session.getAttribute("email"))))
						{
							hit = "N";
						}
						 */
			%>
			<tr>
				<td align="center">
					<div class="checkbox">
						<label> <input type="checkbox" name="noticeCheck" value="<%=bbs_seq%>">
						</label>
					</div>
				</td>
				<th scope="row"><%=bbs_seq%></th>
				<td><A bbs_seq="<%=bbs_seq%>" hit="<%=hit%>" class="noticeView"
					style="cursor: pointer" data-toggle="modal"
					data-target="#viewModal"><%=bbs_title%></A></td>
				<td>������</td>
				<td><%=date%></td>
				<td><%=hitCount%></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
</DIV>
</DIV>
</CENTER>
<DIV class="col-md-5">
		<input type="checkbox" name="selectAll" value="selectAll" onclick="selectAllCheckBox(this)">��ü����
</DIV>
<DIV class="col-md-6 col-md-offset-3" style="margin-bottom: 150px;">
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#deleteModal" id="modalDeleteBtn">����</button>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#writeModal" id="modalWriteBtn">�۾���</button>
</DIV>

<!-- �� ���� Modal -->
<div class="modal fade" id="writeModal" style="width: 100%"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">�������� �۾���</h4>
			</div>
			<div class="modal-body">
				<form name="writeForm" id="writeForm"
					action="/admin/noticeWrite.listen" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">����</label> <input
							type="text" class="form-control" id="bbs_title" name="bbs_title"
							placeholder="�� ������ �Է��ϼ���.">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">����</label>
						<textarea class="form-control" id="bbs_contents"
							name="bbs_contents" rows="12" placeholder="�� ������ �Է��ϼ���."></textarea>
					</div>
					<INPUT type="hidden" name="reg_email" value="<%=reg_email%>">
					<INPUT type="hidden" name="reg_ip" value="<%=reg_ip%>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="write-btn">�۾���</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>


<!-- ���� Ȯ��-->
<div class="modal fade" id="deleteModal" style="width: 100%"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-sm" style="margin-top: 200px">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">����Ȯ��</h4>
			</div>
			<div class="modal-body">
				<label for="recipient-name" class="control-label">���� ����
					�Ͻðڽ��ϱ�?</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="noticeListDelete">����</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>