<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.listen.admin.vo.AdminNoticeVo"%>


<link rel="stylesheet" type="text/css" href="css/notice-view.css">

<SCRIPT>
	$(function(){
		// 공지사항 등록
		$('#write-btn').click(function() {
			var titleInput = $('input:text[name=bbs_title]');
			var titleValue = trim(titleInput.val());
			if (titleValue === "") {
				window.alert("글 제목을 입력하세요.");
				titleInput.select();
				return false;
			}
			titleInput.val(titleValue);

			var contentInput = $('[name=bbs_contents]');
			var contentValue = trim(contentInput.val());
			if (contentValue === "") {
				window.alert("글 내용을 입력하세요.");
				contentInput.select();
				return false;
			}
			contentInput.val(contentValue);

			writeForm.submit();
		});

		$('#modalWriteBtn').click(function() {
			textClear();
		});
		
		
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
		onclick="location.href='/admin/notice.listen'">공지사항</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/background.listen'">배경그림 설정</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/opinion.listen'">의견보기</button>
</div>

<BR>
<BR>
<BR>
<H2 align="center">공지사항</H2>
<BR>
<BR>
<BR>

<FORM name="delForm" id="delForm" action="/admin/noticeDelete.listen" method="POST">
	<INPUT type="hidden" name="bbs_seq" value="<%=bbs_seq %>">
</FORM>

<CENTER>
	<div class="panel panel-default col-md-6 col-md-offset-3">
		<div class="panel-heading clearfix">
			<div class="avatar avatar-medium clearfix pull-left">
				<img src="//www.gravatar.com/avatar/5fc6278d4ceeb746341f448c03d045b7?d=identicon&amp;s=40">
				<div class="avatar-info">
					<DIV>관리자</DIV>
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
		<button type="button" class="btn btn-primary"	onclick="location.href='/admin/notice.listen'">목록</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#updateModal" id="modalUpdateBtn">수정</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#deleteModal" id="modalDelBtn">삭제</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#writeModal" id="modalWriteBtn">글쓰기</button>
	</div>
</div>



<!-- 글 쓰기 Modal --> 
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
				<form name="writeForm" id="writeForm" action="/admin/noticeWrite.listen" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">제목</label>
						<input type="text" class="form-control" id="bbs_title" name="bbs_title" placeholder="글 제목을 입력하세요." >
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">내용</label>
						<textarea class="form-control" id="bbs_contents" name="bbs_contents" rows="12" placeholder="글 내용을 입력하세요."></textarea>
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


<!-- 삭제 확인-->
<div class="modal fade" id="deleteModal" style="width: 100%" tabindex="-1" role="dialog"
   aria-labelledby="mySmallModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-sm" style="margin-top:200px">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">삭제확인</h4>
         </div>
         <div class="modal-body">
         	<% if (title.length() > 10) {
         			title = title.substring(0, 7) + "...";
			} %>
            <label for="recipient-name" class="control-label">"<%=title %>"의 글을</label>
            <label for="recipient-name" class="control-label">정말 삭제 하시겠습니까?</label>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="noticeDelBtn">삭제</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
         </div>
      </div>
   </div>
</div>


<!-- 글 수정 Modal --> 
<div class="modal fade" id="updateModal" style="width: 100%" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="margin-top:150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">공지사항 글수정</h4>
			</div>
			<div class="modal-body">
				<form name="updateForm" id="updateForm" action="/admin/noticeUpdate.listen" method="post">
					<div class="form-group">
						<label for="recipient-name" class="control-label">제목</label>
						<input type="text" class="form-control" id="bbs_title" name="bbs_title" placeholder="글 제목을 입력하세요." value="<%=title%>">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">내용</label>
						<textarea class="form-control" id="bbs_contents" name="bbs_contents" rows="12" placeholder="글 내용을 입력하세요."><%=contents%></textarea>
					</div>
					<INPUT type="hidden" name="bbs_seq" value="<%=bbs_seq%>">
					<INPUT type="hidden" name="reg_email" value="<%=reg_email%>">
					<INPUT type="hidden" name="reg_ip" value="<%=reg_ip%>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="update-btn">글수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>