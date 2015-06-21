<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.listen.bbs.vo.*"%>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/modernizr.custom.js"></script>
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-comment.js"></script>
<script type="text/javascript" src="js/ajax-chattingRequest.js"></script>
<script type="text/javascript" src="js/ajax-bbsSelect.js"></script>

<SCRIPT>
	$(function() {
		var addForm = $('#addForm');
		$('#addWriteBtn').click(function() {
			ajaxBbsAdd();
		});
	});
</SCRIPT>


<div class="container" style="margin-bottom: 150px;">
	<ul class="grid effect-2" id="grid">
		<%
			ArrayList ajaxBbsViewList = (ArrayList) request
					.getAttribute("serchList");
			String email = (String) session.getAttribute("email");
			String userIp = request.getRemoteAddr();
			if (ajaxBbsViewList.size() > 0 && ajaxBbsViewList != null) {
				for (int i = 0; i < ajaxBbsViewList.size(); i++) {
					BbsVo bbsVo = (BbsVo) ajaxBbsViewList.get(i);
					int bbs_seq = (int) bbsVo.getBbs_seq();
					String bbs_contents = (String) bbsVo.getBbs_contents();
					bbs_contents = bbs_contents.replaceAll("\r\n","</BR>");
					bbs_contents = bbs_contents.replaceAll("\u0020"," ");
					String mini_contents = bbs_contents;
					if (bbs_contents.length() > 36) {
						mini_contents = bbs_contents.substring(0, 34) + "...";
					}
					int bbs_hitCount = (int) bbsVo.getBbs_hitCount();
					String reg_email = (String) bbsVo.getReg_email();
					String path = (String) bbsVo.getPath();
					String save_name = (String) bbsVo.getSave_name();
					int bbs_goodCount = (int) bbsVo.getGoodCount();
					int goodCount = (int) bbsVo.getGoodCount();
					int add_count = (int) bbsVo.getAdd_count();
		%>
		<li>
			<div class="image img-rounded" style="margin-left: 15px;">
				<img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal"
					data-target="#myModal" style="cursor: pointer"
					src="<%=path%>/<%=save_name%>" width=325
					contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"
					email="<%=email%>"
					onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_goodCount%>','<%=bbs_contents%>','<%=email%>','<%=add_count%>');" />

				<div class="text2">
					<H3><%=mini_contents%></H3>
				</div>
				<div class="text2_1">
					조회수 :
					<%=bbs_hitCount%>
					좋아요 :
					<%=goodCount%>
					댓글수 :
					<%=add_count%></div>
			</div>
		</li>
		<%
			}
		%>
	</ul>
</div>
<%
	} else {
%>
<H2 align="center">검색결과가 없습니다.</H2>
<%
	}
%>


<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.js"></script>
<script src="js/classie.js"></script>
<script src="js/AnimOnScroll.js"></script>
<script>
	new AnimOnScroll(document.getElementById('grid'), {
		minDuration : 0.4,
		maxDuration : 0.7,
		viewportFactor : 0.2
	});
</script>


<!-- Modal 글 List-->
<div class="modal fade" style="width: 100%" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<FORM name="chatReqForm" id="chatReqForm" method="post"
					action="/chattingRequest.listen">
					<INPUT type="hidden" name="bbs_seq" id="bbs_seq" value="">
					<INPUT type="hidden" name="email" id="email" value="<%=email%>">
				</FORM>
				<div class="lcard-button-wrapper">
					<div class="lcard-button">
						<div class="container-title animation-1">
							<div class="heartImg" alt="N" onclick="toggle();"></div>
						</div>
						<span class="ng-binding">좋아요</span>
					</div>
					<div class="like-label">0</div>
				</div>
				<div id="chattingRequset" class="glyphicon glyphicon-comment"
					style="left: 100px; cursor: pointer;">채팅 요청</div>

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body"
				style="background-color: gray; margin-left: 0; border: 30px white solid">
				<img id="modalImg" class="imageShadow" src="#" width="500" />
				<div class="text3">
					<H3>
						<label id="modalContent"></label>
					</H3>
				</div>
			</div>
			<div class="modal-footer">
				<!-- 댓글이 보일 부분 -->
				<DIV id="comment-list">
					<TABLE id="table table-bordered" cellspacing="0" cellpadding="0"
						width=100%>
						<TBODY id="comment_table_body" align="center"
							style="border: 1px solid #ddd;">
							<ul id="list-group">

								<li id="note-title" class="list-group-item note-title"
									style="margin-right: 40;">
									<h3 class="panel-title">
										댓글 <span id="note-count">4</span>
									</h3>
								</li>
							</ul>
						</TBODY>
					</TABLE>
				</DIV>
				<!-- 댓글 쓰기 부분 -->
				<FORM name="addForm" id="addForm" method="post"
					action="ajaxBbsAdd();">
					<div class="comment-textarea">
						<textarea name="content" id="comment"
							class="ng-pristine ng-valid ng-touched" placeholder="어떻게 생각하세요?"
							style="overflow: hidden; word-wrap: break-word; height: 50px;"></textarea>
					</div>
					<INPUT type="hidden" name="bbs_seq" id="bbs_seq"> <INPUT
						type="hidden" name="reg_ip" id="reg_ip" value="<%=userIp%>">
					<INPUT type="hidden" name="reg_email" id="reg_email"
						value="<%=email%>">
				</FORM>
				<BR>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="addWriteBtn">게시</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal 댓글 삭제 확인-->
<div class="modal fade comment-delete-modal" style="width: 100%"
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
				<button type="button" class="btn btn-primary">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>


