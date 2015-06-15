<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.listen.admin.vo.BackgroundVo"%>

<SCRIPT>
	$(function(){
		// ��� �̹��� ���
		$('#bgWriteBtn').click(function(){
			$('#bgImgForm').submit();
		});
	});
</SCRIPT>

<%
	String userEmail = (String) session.getAttribute("email");
	String userIp = request.getRemoteAddr();

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
<H2 align="center">���׸� ����</H2>
<BR>
<BR>
<BR>
<DIV class="row">
	<DIV class="col-md-6 col-md-offset-3">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#deleteModal" id="imgDeleteModal">����</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#backgroundModal" id="imgModal">�������</button>
	</DIV>
</DIV>
<BR><BR>
<DIV class="row" style="margin-bottom: 150px;">
	<DIV class="col-md-6 col-md-offset-3">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-1">#</th>
					<th class="col-md-1">No.</th>
					<th class="col-md-2">����</th>
					<th class="col-md-1">������</th>
					<th class="col-md-1">�����</th>
					<th class="col-md-1">�����</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (((ArrayList) request.getAttribute("backgroundList")).size() > 0
							&& request.getAttribute("backgroundList") != null) {
						ArrayList backgroundList = (ArrayList) request
								.getAttribute("backgroundList");
						for (int i = 0; i < backgroundList.size(); i++) {
							BackgroundVo backgroundVo = (BackgroundVo) backgroundList
									.get(i);
							int bg_img_seq = backgroundVo.getBg_img_seq();
							String path = backgroundVo.getPath();
							String org_name = backgroundVo.getOrg_name();
							String save_name = backgroundVo.getSave_name();
							int file_size = backgroundVo.getFile_size();
							String reg_email = backgroundVo.getReg_email();
							String reg_date = backgroundVo.getReg_date();
				%>
				<tr>
					<td align="center">
						<div class="checkbox">
							<label> <input type="checkbox" name="noticeCheck"
								value="<%=bg_img_seq%>">
							</label>
						</div>
					</td>
					<th scope="row" align="center"><%=bg_img_seq%></th>
					<td align="center"><A bbs_seq="<%=bg_img_seq%>"
						class="backgroundDetail" style="cursor: pointer"
						data-toggle="modal" data-target="backgroundDetailModal"><IMG
							src="<%=path%>/<%=save_name%>" width=220></A></td>
					<td align="center"><%=file_size%></td>
					<td align="center"><%=reg_email%></td>
					<td align="center"><%=reg_date%></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</DIV>
</DIV>


<!-- Modal -->
<!-- ������� Modal -->
<div class="modal fade" id="backgroundModal" tabindex="-1" role="dialog"
	style="width: 100%" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 200px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">�������</h4>
			</div>
			<div class="modal-body">
				<!-- ������� FORM -->
				<form name="bgImgForm" id="bgImgForm" enctype="multipart/form-data" method="post" action="/admin/bgImgWrite.listen">
					<input id="file-0a" class="file" type="file" name="upload" multiple	data-min-file-count="1"> <br>
					<input type="hidden" name="reg_email" value="<%=userEmail %>">
					<input type="hidden" name="reg_ip" value="<%=userIp %>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="bgWriteBtn">���</button>
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
