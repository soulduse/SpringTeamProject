<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.listen.admin.vo.AdminNoticeVo"%>


<link rel="stylesheet" type="text/css" href="css/notice-view.css">

<SCRIPT>
	$(function(){
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
		
		// ����
		$('#update-btn').click(function(){
			$('#updateForm').submit();
		});
		
		$('#noticeDelBtn').click(function(){
			$('#delForm').submit();
		});
	});
</SCRIPT>
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

	AdminNoticeVo adminNoticeVo = (AdminNoticeVo) request.getAttribute("adminNoticeVo");
	int bbs_seq = adminNoticeVo.getBbs_seq();
	String title = adminNoticeVo.getBbs_title();
	String contents = adminNoticeVo.getBbs_contents();
	contents = contents.replaceAll("\r\n","</P>");
	contents = contents.replaceAll("\u0020"," ");
	int hit = adminNoticeVo.getBbs_hitCount();
	String date = adminNoticeVo.getReg_date();
%>


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

<FORM name="delForm" id="delForm" action="/admin/noticeArrayDel.listen" method="POST">
	<INPUT type="hidden" name="bbs_seq" value="<%=bbs_seq %>">
</FORM>

<CENTER>
	<div class="panel panel-default col-md-6 col-md-offset-3">
		<div class="panel-heading clearfix">
			<div class="avatar avatar-medium clearfix pull-left">
				<img src="//www.gravatar.com/avatar/5fc6278d4ceeb746341f448c03d045b7?d=identicon&amp;s=40">
				<div class="avatar-info">
					<DIV>������</DIV>
					<div class="date-created timeago" title="2015-06-14 11:36:12.0"><%=date %></div>
				</div>
			</div>
			<div class="content-identity pull-center" style="margin-top:15px">
				<h2 class="panel-title"><b><%=title %></b></h2>
			</div>
			<div class="content-identity pull-right">
				<div class="content-identity-count">
					<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> <%=hit+1 %>
				</div>
			</div>
		</div>
		<div class="content-container clearfix">
			<div class="panel-body content-body pull-left">
				<article class="content-text">
						<P><%=contents %>
				</article>
			</div>
		</div>
	</div>
</CENTER>
<BR>

<div class="row" style="margin-bottom:150px;">
  	<div class="col-md-7 col-md-offset-6 pull-right" >
		<button type="button" class="btn btn-primary"	onclick="location.href='/admin/notice.listen'">���</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#updateModal" id="modalUpdateBtn">����</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#deleteModal" id="modalDelBtn">����</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#writeModal" id="modalWriteBtn">�۾���</button>
	</div>
</div>



<!-- �� ���� Modal --> 
<div class="modal fade" id="writeModal" style="width: 100%" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="margin-top:150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">�������� �۾���</h4>
			</div>
			<div class="modal-body">
				<form name="writeForm" id="writeForm" action="/admin/noticeWrite.listen" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">����</label>
						<input type="text" class="form-control" id="bbs_title" name="bbs_title" placeholder="�� ������ �Է��ϼ���." >
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">����</label>
						<textarea class="form-control" id="bbs_contents" name="bbs_contents" rows="12" placeholder="�� ������ �Է��ϼ���."></textarea>
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
<div class="modal fade" id="deleteModal" style="width: 100%" tabindex="-1" role="dialog"
   aria-labelledby="mySmallModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-sm" style="margin-top:200px">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">����Ȯ��</h4>
         </div>
         <div class="modal-body">
         	<% if (title.length() > 10) {
         			title = title.substring(0, 7) + "...";
			} %>
            <label for="recipient-name" class="control-label">"<%=title %>"�� ����</label>
            <label for="recipient-name" class="control-label">���� ���� �Ͻðڽ��ϱ�?</label>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="noticeDelBtn">����</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
         </div>
      </div>
   </div>
</div>


<!-- �� ���� Modal --> 
<div class="modal fade" id="updateModal" style="width: 100%" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="margin-top:150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">�������� �ۼ���</h4>
			</div>
			<div class="modal-body">
				<form name="updateForm" id="updateForm" action="/admin/noticeUpdate.listen" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">����</label>
						<input type="text" class="form-control" id="bbs_title" name="bbs_title" placeholder="�� ������ �Է��ϼ���." value="<%=title%>">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">����</label>
						<textarea class="form-control" id="bbs_contents" name="bbs_contents" rows="12" placeholder="�� ������ �Է��ϼ���."><%=contents%></textarea>
					</div>
					<INPUT type="hidden" name="bbs_seq" value="<%=bbs_seq%>">
					<INPUT type="hidden" name="reg_email" value="<%=reg_email%>">
					<INPUT type="hidden" name="reg_ip" value="<%=reg_ip%>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="update-btn">�ۼ���</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>