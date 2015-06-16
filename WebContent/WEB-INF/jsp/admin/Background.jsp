<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.listen.admin.vo.BackgroundVo"%>

<SCRIPT>
	$(function(){
		
		// 배경 이미지 등록
		var bgImgForm = $('#bgImgForm');
		$('#bgWriteBtn').click(function(){
			var state = $('#bgWriteState');
			state.val("1");
			$('#bgImgForm').submit();
		});
		
		// bg_img_seq 값 가져오기 위한 이벤트
		var updateBgModal = $('.updateBgModal');
		var bg_img_seq;
		updateBgModal.click(function(){
			var th = $(this);
			bg_img_seq = th.attr('bg_img_seq');
		});
		
		// 배경 이미지 수정
		var bgImgUpdateForm = $('#bgImgUpdateForm');
		$('#bgUpdateBtn').click(function(){
			var state = $('#bgUpdateState');
			var imgSeq = bgImgUpdateForm.find('input:hidden[name=bg_img_seq]');
			imgSeq.val(bg_img_seq);
			state.val("2");
			bgImgUpdateForm.submit();
		});
		
		// 배경그림 리스트 체크박스 이용한삭제
		$('#bgImgListDelete').click(function(){
			var arr_seq = $('#array_bbs_seq');
			var eachObj = document.getElementsByName("bgCheck");
			var eachObjSize = eachObj.length;  
			var arrFir = new Array();
			var cnt = 0;
			
			for (var i = 0; i < eachObjSize; ++i) 
			{
				if (eachObj[i].checked == true) 
				{
					arrFir[cnt] = eachObj[i].value;
					cnt++;
				}
			}
			if(arrFir.length > 0 && arrFir.length != null)
			{
				arr_seq.val(arrFir);
				$('#arrayDelForm').submit();
			}
			else
			{
				alert("체크된 항목이 존재하지 않습니다.");
			}
			
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
		onclick="location.href='/admin/notice.listen'">공지사항</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/background.listen'">배경그림 설정</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/opinion.listen'">의견보기</button>
</div>

<BR>
<BR>
<BR>
<H2 align="center">배경그림 관리</H2>
<BR>
<BR>
<BR>

<!-- 삭제 히든 폼 -->
<FORM name="arrayDelForm" id="arrayDelForm" action="/admin/bgImgDel.listen" method="post">
	<INPUT type="hidden" name="bg_img_seq" id="array_bbs_seq">
</FORM>

<DIV class="row">
	<DIV class="col-md-6 col-md-offset-3">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#deleteModal" id="imgDeleteModal">삭제</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#backgroundModal" id="imgModal">사진등록</button>
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
					<th class="col-md-2">사진</th>
					<th class="col-md-1">사이즈</th>
					<th class="col-md-1">등록자</th>
					<th class="col-md-1">등록일</th>
					<th class="col-md-1">수정</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (((ArrayList) request.getAttribute("backgroundList")).size() > 0
							&& request.getAttribute("backgroundList") != null) {
						ArrayList backgroundList = (ArrayList) request.getAttribute("backgroundList");
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
							<label> <input type="checkbox" name="bgCheck"
								value="<%=bg_img_seq%>">
							</label>
						</div>
					</td>
					<th scope="row" align="center"><%=bg_img_seq%></th>
					<!-- 사진 클릭시 상세정보 표시해줌(모달) -->
					<td align="center"><IMG src="<%=path%>/<%=save_name%>" width=220></td>
					<td align="center"><%=file_size%></td>
					<td align="center"><%=reg_email%></td>
					<td align="center"><%=reg_date%></td>
					<td align="center">
						<A class="updateBgModal" bg_img_seq="<%=bg_img_seq%>" style="cursor: pointer" data-toggle="modal" data-target="#bgUpdateModal">
							<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
						</A>
					</td>
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
<!-- 사진등록 Modal -->
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
				<h4 class="modal-title" id="exampleModalLabel">사진등록</h4>
			</div>
			<div class="modal-body">
				<!-- 사진등록 FORM -->
				<form name="bgImgForm" id="bgImgForm" enctype="multipart/form-data" method="post" action="/admin/bgImgWrite.listen">
					<input id="file-0a" class="file" type="file" name="upload" multiple data-min-file-count="1"> <br>
					<input type="hidden" name="reg_email" value="<%=userEmail %>">
					<input type="hidden" name="reg_ip" value="<%=userIp %>">
					<input type="hidden" name="state" id="bgWriteState">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="bgWriteBtn">등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 사진수정 Modal -->
<div class="modal fade" id="bgUpdateModal" tabindex="-1" role="dialog"
	style="width: 100%" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 200px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">사진등록</h4>
			</div>
			<div class="modal-body">
				<!-- 사진등록 FORM -->
				<form name="bgImgUpdateForm" id="bgImgUpdateForm" enctype="multipart/form-data" method="post" action="/admin/bgImgWrite.listen">
					<input id="file-0a" class="file" type="file" name="upload" multiple data-min-file-count="1"> <br>
					<input type="hidden" name="reg_email" value="<%=userEmail %>">
					<input type="hidden" name="reg_ip" value="<%=userIp %>">
					<input type="hidden" name="state" id="bgUpdateState">
					<input type="hidden" name="bg_img_seq">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="bgUpdateBtn">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 삭제 확인-->
<div class="modal fade" id="deleteModal" style="width: 100%"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-sm" style="margin-top: 200px">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">삭제확인</h4>
			</div>
			<div class="modal-body">
				<label for="recipient-name" class="control-label">정말 삭제
					하시겠습니까?</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="bgImgListDelete">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
