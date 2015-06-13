<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.listen.admin.vo.AdminNoticeVo"%>

<%
	String reg_email = (String)session.getAttribute("email");
	String reg_ip = request.getRemoteAddr();
	
	boolean loginYn = false;
	boolean adminYn = false;
	if(session != null && session.getAttribute("LoginYn")!=null &&
			((String)session.getAttribute("LoginYn")).equals("Y"))
	{
		loginYn = true;
	}
	if(loginYn && ((String)session.getAttribute("adminYn")).equals("Y"))
	{
		adminYn = true;
	}
	
%>
<SCRIPT>
	$(function(){
		var writeForm = $('#writeForm');
		var noticeViewForm = $('#noticeViewForm');
		var noticeSeq = noticeViewForm.find('input:hidden[name=bbs_seq]');
		var noticeHit = noticeViewForm.find('input:hidden[name=hit]');
		//var noticeSection = noticeViewForm.find('input:hidden[name=section]');
		//var noticePageNum = noticeViewForm.find('input:hidden[name=pageNum]');
		
		// 공지사항 등록
		$('#write-btn').click(function(){
			var titleInput = $('input:text[name=bbs_title]');
			var titleValue = trim(titleInput.val());
			if(titleValue === "")
			{
				window.alert("글 제목을 입력하세요.");
				titleInput.select();
				return false;
			}
			titleInput.val(titleValue);

			var contentInput = $('[name=bbs_contents]');
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
		
		// 공지사항 글보기
		$('.noticeView').click(function(){
			var noticeArticle = $(this);
			noticeSeq.val(noticeArticle.attr('bbs_seq'));
			noticeHit.val(noticeArticle.attr('hit'));
			noticeViewForm.submit();
		});
	});
	
	function textClear()
	{
		var titleInput = $('input:text[name=bbs_title]');
		var contentInput = $('[name=bbs_contents]');
		
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
	<H2 align="center">공지사항</H2>	
<BR>
<BR>
<BR>

<FORM name="noticeViewForm" id="noticeViewForm" action="/admin/noticeView.listen" method="post">
	<INPUT type="hidden" name="bbs_seq">
	<INPUT type="hidden" name="hit">
</FORM>


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
			<%
				if(((ArrayList)request.getAttribute("noticeList")).size()>0 && request.getAttribute("noticeList")!=null)
				{
					ArrayList noticeList = (ArrayList)request.getAttribute("noticeList");
					for(int i=0; i<noticeList.size(); i++)
					{
						AdminNoticeVo noticeVo = (AdminNoticeVo)noticeList.get(i);
						int bbs_seq = (int)noticeVo.getBbs_seq();
						String bbs_title = (String)noticeVo.getBbs_title();
						String name = (String)noticeVo.getReg_email();
						String date = (String)noticeVo.getReg_date();
						if(bbs_title.length()>22)
						{
							bbs_title = bbs_title.substring(0, 19) + "...";
						}
						
						String hit = "Y";
						if((loginYn && name.equals((String)session.getAttribute("email"))) || adminYn)
						{
							hit = "N";
						}
			%>
			<tr>
				<td>
					<div class="checkbox">
						<label> <input type="checkbox">
						</label>
					</div>
				</td>
				<th scope="row"><%=bbs_seq %></th>
				<td><A bbs_seq="<%=bbs_seq%>" hit="<%=hit%>" class="noticeView" style="cursor:pointer"
				data-toggle="modal"	data-target="#viewModal"><%=bbs_title %></A></td>
				<td>관리자</td>
				<td><%=date %></td>
				<td><%=hit %></td>
			</tr>
			<%
					}
				}
			%>
		</tbody>
	</table>

</CENTER>

<button type="button" class="btn btn-primary"	onclick="location.href='/admin/opinion.listen'">삭제</button>
<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#writeModal" id="modalWriteBtn">글쓰기</button>

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

<!-- 글 보기 Modal --> 
<div class="modal fade" id="viewModal" style="width: 100%" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="margin-top:150px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">공지사항</h4>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">제목</label>
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label" rows="12">내용</label>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="write-btn">글쓰기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

