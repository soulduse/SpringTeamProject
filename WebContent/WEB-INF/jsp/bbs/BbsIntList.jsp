<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>

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
      
      $('.radiobox').click(function(){
          $('#radioForm').submit();
       })
       $('.img').click(function(){
  		var th = $(this);
  		var bbsGoodYn = th.attr('bbs_good_yn');
  	});
       
     /*//무한스크롤 안쓸거같음
      $(window).scroll(          
      function() { // ① 스크롤 이벤트 최초 발생
         if ($(window).scrollTop() + windowHeight > ($(document).height() - 50)) {
            ajaxBbsList1(rownum2);
            rownum2 = rownum2 + 9;
         }
      });
      */
   });
</SCRIPT>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Listen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      .jb-content {
           width: 375px;
           padding: 5px;
           margin-bottom: 25px;        
           float: left;
      }
      
      .image{
           width: 350px;
           padding: 10px;
           margin-bottom: 10px;        
           float: left;
           border: 1px solid #bcbcbc;
           background-color:gray;
      }
       
       .chkbox{
             width:13px;
             height:13px;
             vertical-align:text-top
      }
      
      label{
            vertical-align:-3px
      }
      .dd{
      top: 0;
  right:50%;
  bottom: 0;
  left: 0;
  z-index: 1040;
      }
      
   </style>
</head>
<% 
   if(session.getAttribute("email")!=null 
      && session.getAttribute("LoginYn") != null 
      &&((String)session.getAttribute("LoginYn")).equals("Y"))
      {
      String email = (String)session.getAttribute("email");
      String userIp = request.getRemoteAddr();
      String selectInt = (String)session.getAttribute("selectInt");
      if((String)request.getAttribute("selectInt")!=null)
      {
    	  selectInt = (String)request.getAttribute("selectInt");
      }

%>
<body>
	<br><BR><BR><BR>
	<div>관심 있는 이야기</div>	
   <FORM name="radioForm"  method="post" id="radioForm" action="/bbsIntList.listen">
   <div class="check" style="margin-left:700px;">
   <input class="radiobox" name="selectInt" type="radio" style="width:17px;height:17px;" value="bbs_add_count" <%if(selectInt.equals("bbs_add_count")){%> checked<%}%>>&nbsp;<label for="">댓글단글</label>&nbsp;&nbsp;&nbsp;
   <input class="radiobox" name="selectInt" type="radio" style="width:17px;height:17px;" value="bbs_like" <%if(selectInt.equals("bbs_like")){%> checked<%}%>>&nbsp;<label for="">공감한글</label>&nbsp;&nbsp;&nbsp;
   <input class="radiobox" name="selectInt" type="radio" style="width:17px;height:17px;" value="viewed" <%if(selectInt.equals("viewed")){%> checked<%}%>>&nbsp;<label for="">읽은글</label>
   </div>
   </FORM>
   
 
 <!-- 메인 하단 부분 글 보여주기 -->
         <div class="container">
         <ul class="grid effect-2" id="grid">
               <%
               int forCount = 0;
                  ArrayList bbsIntList = (ArrayList) request.getAttribute("bbsIntList");
		   			if(bbsIntList.size()>30)
		   			{
		   				forCount = 30;
		   			}
		   			else
		   			{
		   				forCount = bbsIntList.size();
		   			}
                     for (int i = 0; i < forCount; i++) {

                        BbsVo bbsVo = (BbsVo) bbsIntList.get(i);
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
                        String bbs_good_yn = (String)bbsVo.getBbs_good_yn();

               %>
               <li>
               <div class="image img-rounded" style="margin-left: 15px;">
                  <img class="img imageShadow" name="<%=bbs_seq%>"
                     data-toggle="modal" data-target="#myModal"
                     style="cursor: pointer" src="<%=path%>/<%=save_name%>" width=325
                     contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"bbs_good_yn="<%=bbs_good_yn %>"
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
