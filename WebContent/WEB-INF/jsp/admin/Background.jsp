<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.listen.admin.vo.BackgroundVo" %>


<div class="btn-group" role="group" aria-label="menuGroup">
  <button type="button" class="btn btn-success" onclick="location.href='/admin/notice.listen'">공지사항</button>
  <button type="button" class="btn btn-success" onclick="location.href='/admin/background.listen'">배경그림 설정</button>
  <button type="button" class="btn btn-success" onclick="location.href='/admin/opinion.listen'">의견보기</button>
</div>

<BR>
<BR>
<BR>
	<H2 align="center">배경그림 관리</H2>	
<BR>
<BR>
<BR>

<DIV class="row" style="margin-bottom:150px;">
<DIV class="col-md-6 col-md-offset-3">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="col-md-1">#</th>
				<th class="col-md-1">No.</th>
				<th class="col-md-2">사진</th>
				<th class="col-md-1">사이즈</th>
				<th class="col-md-1">등록자</th>
				<th class="col-md-1">등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (((ArrayList)request.getAttribute("backgroundList")).size() > 0
						&& request.getAttribute("backgroundList") != null) {
					ArrayList backgroundList = (ArrayList)request.getAttribute("backgroundList");
					for (int i = 0; i < backgroundList.size(); i++) {
						BackgroundVo backgroundVo = (BackgroundVo) backgroundList.get(i);
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
						<label> <input type="checkbox" name="noticeCheck" value="<%=bg_img_seq%>">
						</label>
					</div>
				</td>
				<th scope="row" align="center"><%=bg_img_seq%></th>
				<td align="center"><A bbs_seq="<%=bg_img_seq%>" class="backgroundDetail"
					style="cursor: pointer" data-toggle="modal"
					data-target="backgroundDetailModal"><IMG src="<%=path%>/<%=save_name%>" width=300></A></td>
				<td align="center"><%=file_size %></td>
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
