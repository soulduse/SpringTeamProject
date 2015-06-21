<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.listen.bbs.vo.*"%>
<%@ page import="java.awt.Image"%>
<%@ page import="javax.swing.ImageIcon"%>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-comment.js"></script>
<script type="text/javascript" src="js/ajax-chattingRequest.js"></script>
<script type="text/javascript" src="js/ajax-bbsSelect.js"></script>


<SCRIPT>
	var windowHeight = $(window).height();
	var rownum2 = 9;
	$(function() {
		var addForm = $('#addForm');
		$('#addWriteBtn').click(function() {
			ajaxBbsAdd();
		});

		var chatReqForm = $('#chatReqForm');
		$('#chattingRequset').click(function() {
			chattingRequest();
		});
		
		$(window).scroll(
			    
		function() { // ① 스크롤 이벤트 최초 발생
			if ($(window).scrollTop() + windowHeight > ($(document).height() - 50)) {
				ajaxBbsList1(rownum2);
				rownum2 = rownum2 + 9;
			}
		});
	});
</SCRIPT>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<title>Listen</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<%
	if (session.getAttribute("email") != null
			&& session.getAttribute("LoginYn") != null
			&& ((String) session.getAttribute("LoginYn")).equals("Y")) {
		String email = (String) session.getAttribute("email");
		String userIp = request.getRemoteAddr();
%>
<body>
	<INPUT type="hidden" name="viewEmail" value="<%=email%>">


	<div class="listen-container">
		<div class="listen-header">
			<img alt="" src="images/logo1.png" height="200" width="700">
		</div>

		<div class="listen-container1">
			<div class="listen-big">
				<div class="listen-content1_1">

					<div class="listen-content2"
						style="color: black; background-image: url(images/back2.png);">
						<center>
							<B><p>
								<h2>또래 이야기</h2>
								</p></B>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 30px; cursor: pointer;"
								onclick="location.href='/bbsAgeList.listen?selectAge=10&?selectItem=bbs_hitCount'">10대
								이야기</div>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 30px; cursor: pointer;"
								onclick="location.href='/bbsAgeList.listen?selectAge=20&?selectItem=bbs_hitCount'">20대
								이야기</div>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 30px; cursor: pointer;"
								onclick="location.href='/bbsAgeList.listen?selectAge=30&?selectItem=bbs_hitCount'">30대
								이야기</div>
							<div class="listen-content2_1"
								style="font-weight: 300; font-size: 1em; font-family: 맑은고딕; height: 30px; cursor: pointer;"
								onclick="location.href='/bbsAgeList.listen?selectAge=40&?selectItem=bbs_hitCount'">40대이상
								이야기</div>
						</center>
					</div>

					<div class="listen-content2"
						style="background-color: #f2f2f2; background-image: url(images/back5.png); height: 180;">
						<center>
							<B><p>
								<h2>추천 이야기</h2>
								</p></B>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 35px; cursor: pointer;"
								onclick="location.href='/bbsPopList.listen?selectItem=goodCount'">공감순
								이야기</div>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 35px; cursor: pointer;"
								onclick="location.href='/bbsPopList.listen?selectItem=bbs_add_count'">댓글순
								이야기</div>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 35px; cursor: pointer;"
								onclick="location.href='/bbsPopList.listen?selectItem=bbs_hitCount'">인기순
								이야기</div>
						</center>
					</div>



					<div class="listen-content2"
						style="background-color: #f2f2f2; background-image: url(images/back3.png); height: 150;">
						<center>
							<B><p>
								<h2>베스트 이야기</h2>
								</p></B>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 40px; cursor: pointer;"
								onclick="location.href='/bbsPopList.listen?selectItem=weekBest'">주간베스트
								이야기</div>
							<div class="listen-content2_1"
								style="font-weight: 250; font-size: 1em; font-family: 맑은고딕; height: 40px; cursor: pointer;"
								onclick="location.href='/bbsPopList.listen?selectItem=monthBest'">월간베스트
								이야기</div>
						</center>
					</div>
				</div>

				<div class="listen-content1"
					style="background-image: url(images/back4.png);">
					<div class="listen-content1_2" style="cursor: pointer;">
						<B><a href="/bbsMyViewList.listen"><h1>MY STORY</h1></a></B>
						<p>
						<h4>(최근에 내가 올린 이야기)</h4>
						</p>
					</div>

					<%
						ArrayList mainMyStory = (ArrayList) request.getAttribute("mainMyStory");
							for (int i = 0; i < mainMyStory.size(); i++) {
								BbsVo bbsVo = (BbsVo) mainMyStory.get(i);
								int bbs_seq = (int) bbsVo.getBbs_seq();
								String bbs_contents = (String) bbsVo.getBbs_contents();

								String mini_contents = bbs_contents;
								if (bbs_contents.length() > 36) {
									mini_contents = bbs_contents.substring(0, 34) + "...";
								}

								int bbs_hitCount = (int) bbsVo.getBbs_hitCount();
								String reg_email = (String) bbsVo.getReg_email();
								String path = (String) bbsVo.getPath();
								String save_name = (String) bbsVo.getSave_name();
								int goodCount = (int) bbsVo.getGoodCount();
								int add_count = (int) bbsVo.getAdd_count();
					%>
					<div class="listen-content1_3">
						<div class="image" id="imgRootDiv"
							style="width: 325px; height: 222px; background-color: gray; padding: 8px; margin-bottom: 7px;">
							<img class="img imageShadow" name="<%=bbs_seq%>"
								data-toggle="modal" data-target="#myModal"
								style="cursor: pointer" src="<%=path%>/<%=save_name%>" width=300
								height=200 contents="<%=bbs_contents%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=goodCount%>','<%=bbs_contents%>','<%=email%>');"/>

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
					</div>
					<%
						}
					%>

				</div>



				<div class="listen-content3" style="cursor: pointer;" onclick="">
					<img alt="" width="370" height="450" src="images/love.png"> <B><h2>우리들끼리
							토론방</h2></B>
					<p>사랑이란?</p>
				</div>
			</div>


			<div class="listen-content4_1">
				<%
					// 서버의 context 경로 구하기
						String root = request.getSession().getServletContext()
								.getRealPath("/");
						int count = 0;
						ArrayList bbsList4 = (ArrayList) request
								.getAttribute("bbsList");
						for (int i = 0; count <= 3; i++) {

							BbsVo bbsVo = (BbsVo) bbsList4.get(i);
							int bbs_seq = (int) bbsVo.getBbs_seq();
							String bbs_contents = (String) bbsVo.getBbs_contents();
							int bbs_hitCount = (int) bbsVo.getBbs_hitCount();
							String reg_email = (String) bbsVo.getReg_email();
							int bbs_goodCount = (int) bbsVo.getGoodCount();
							String path = (String) bbsVo.getPath();
							String save_name = (String) bbsVo.getSave_name();
							// 이미지 파일 위치
							String filename = root + path + "/" + save_name;

							// 이미지 읽기
							Image img = new ImageIcon(filename).getImage();

							int imgWidth = img.getWidth(null); //가로 사이즈
							int imgHeight = img.getHeight(null); //세로 사이즈

							if (imgWidth > imgHeight) {
								if (imgHeight > 235) {
									imgHeight = 235;
								}
								count++;
								if (count <= 3) {
				%>
				<div class="listen-content4">

					<%
						if (count == 2) {
					%>
					<div class="listen-content5_5">
						<img class="img" data-toggle="modal" data-target="#myModal"
							name="<%=bbs_seq%>"
							style="cursor: pointer" alt="" width="350" height=<%=imgHeight%>
							src="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"
							bbs_goodCount="<%=bbs_goodCount%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_goodCount%>','<%=bbs_contents%>','<%=email%>');"/>
					</div>
					<div class="listen-content5"
						style="background-image: url(images/textimg1.png);">
						<B><p><%=bbs_contents%></p></B>
					</div>
					<%
						} else {
					%>
					<div class="listen-content5"
						style="background-image: url(images/textimg1.png);">
						<B><p><%=bbs_contents%></p></B>
					</div>
					<div class="listen-content5_5">
						<img class="img" data-toggle="modal" data-target="#myModal"
							name="<%=bbs_seq%>"
							style="cursor: pointer" alt="" width="350" height=<%=imgHeight%>
							src="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"
							bbs_goodCount="<%=bbs_goodCount%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_goodCount%>','<%=bbs_contents%>','<%=email%>');"/>
					</div>
					<%
						}
					%>
				</div>
				<%
					}
							}
						}
				%>

			</div>
			<%
				int count1 = 0;
					ArrayList bbsList5 = (ArrayList) request
							.getAttribute("bbsList");
					for (int i = 0; count1 <= 1; i++) {

						BbsVo bbsVo = (BbsVo) bbsList5.get(i);
						int bbs_seq = (int) bbsVo.getBbs_seq();
						String bbs_contents = (String) bbsVo.getBbs_contents();
						int bbs_hitCount = (int) bbsVo.getBbs_hitCount();
						String reg_email = (String) bbsVo.getReg_email();
						int bbs_goodCount = (int) bbsVo.getGoodCount();
						String path = (String) bbsVo.getPath();
						String save_name = (String) bbsVo.getSave_name();
						// 이미지 파일 위치
						String filename = root + path + "/" + save_name;

						// 이미지 읽기
						Image img = new ImageIcon(filename).getImage();

						int imgWidth = img.getWidth(null); //가로 사이즈
						int imgHeight = img.getHeight(null); //세로 사이즈
						if (imgWidth < imgHeight) {
							count1++;
							if (count1 <= 1) {
			%>

			<div class="listen-content6">
				<div class="listen-content7">
					<img class="img" data-toggle="modal" data-target="#myModal"
						style="cursor: pointer" alt="" width="480" height="360" name="<%=bbs_seq%>"
						src="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"
						bbs_goodCount="<%=bbs_goodCount%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_goodCount%>','<%=bbs_contents%>','<%=email%>');"/>
				</div>
				<div class="listen-content8"
					style="background-image: url(images/textimg2.png);">
					<center>
						<B><p><%=bbs_contents%></p></B>
					</center>
				</div>
				<%
					} else {
				%>
				<div class="listen-content9">
					<div class="listen-content10"
						style="background-image: url(images/textimg1.png);">
						<div class="listen-content11">
							<center>
								<p><%=bbs_contents%></p>
							</center>
						</div>
					</div>
					<div class="listen-content12">
						<img class="img" data-toggle="modal" data-target="#myModal"
							style="cursor: pointer" alt="" width="309" height="188"
							src="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"
							bbs_goodCount="<%=bbs_goodCount%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_goodCount%>','<%=bbs_contents%>','<%=email%>');"/>
					</div>
				</div>
			</div>
			<%
				}
						}
					}
			%>

			<!-- 메인 하단 부분 글 보여주기 -->
			<div class="container">
			<ul class="grid effect-2" id="grid">
					<%
						ArrayList bbsList = (ArrayList) request.getAttribute("bbsList");
							for (int i = 0; i < 9; i++) {

								BbsVo bbsVo = (BbsVo) bbsList.get(i);
								int bbs_seq = (int) bbsVo.getBbs_seq();
								String bbs_contents = (String) bbsVo.getBbs_contents();

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
						<img class="img imageShadow" name="<%=bbs_seq%>"
							data-toggle="modal" data-target="#myModal"
							style="cursor: pointer" src="<%=path%>/<%=save_name%>" width=325
							contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"
							email="<%=email%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_goodCount%>','<%=bbs_contents%>','<%=email%>');"/>

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
			<script src="js/masonry.pkgd.min.js"></script>
			<script src="js/imagesloaded.js"></script>
			<script src="js/classie.js"></script>
			<script src="js/AnimOnScroll.js"></script>
			<script>
				new AnimOnScroll( document.getElementById( 'grid' ), {
					minDuration : 0.4,
					maxDuration : 0.7,
					viewportFactor : 0.2
				} );
			</script>
					
				<!-- Modal 글 List-->
				<div class="modal fade" style="width: 100%" id="myModal"
					tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
					aria-hidden="true">
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
									<TABLE id="comment_table" bgcolor="#FFFAFA" border="2"
										cellspacing="0" cellpadding="0">
										<TBODY id="comment_table_body"></TBODY>
									</TABLE>
								</DIV>
								<!-- 댓글 쓰기 부분 -->
								<FORM name="addForm" id="addForm" method="post"
									action="/bbsAdd.listen">
									<div class="comment-textarea">
										<textarea name="content" id="comment"
											class="ng-pristine ng-valid ng-touched"
											placeholder="어떻게 생각하세요?"
											style="overflow: hidden; word-wrap: break-word; height: 50px;"></textarea>
									</div>
									<INPUT type="hidden" name="bbs_seq" id="bbs_seq"> <INPUT
										type="hidden" name="reg_ip" id="reg_ip" value="<%=userIp%>">
									<INPUT type="hidden" name="reg_email" id="reg_email"
										value="<%=email%>">
								</FORM>
								<BR>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
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
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>

				<%
					}
				%>
			</div>
		</div>
		<div class="listen-footer"></div>


	</div>
</body>
</html>
