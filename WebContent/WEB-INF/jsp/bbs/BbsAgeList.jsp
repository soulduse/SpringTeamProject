<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>

<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-comment.js"></script>
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-bbsSelect.js"></script>

<SCRIPT>
$(function() {
    var addForm = $('#addForm');
    $('#addWriteBtn').click(function() {
       ajaxBbsAdd();
    });
   
   $('.radiobox').click(function(){
       $('#radioForm').submit();
    })
});
</SCRIPT>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<style>
	.jb-content {
		width: 375px;
		padding: 5px;
		margin-bottom: 25px;
		float: left;
	}
	
	.image {
		width: 350px;
		padding: 10px;
		margin-bottom: 10px;
		float: left;
		border: 1px solid #bcbcbc;
		background-color: gray;
	}
	
	.chkbox {
		width: 13px;
		height: 13px;
		vertical-align: text-top
	}
	
	label {
		vertical-align: -3px
	}
	
	.dd {
		top: 0;
		right: 50%;
		bottom: 0;
		left: 0;
		z-index: 1040;
	}
</style>
</head>
<%
	if (session.getAttribute("email") != null
			&& session.getAttribute("LoginYn") != null
			&& ((String) session.getAttribute("LoginYn")).equals("Y")) {
		String email = (String) session.getAttribute("email");
		String userIp = request.getRemoteAddr();
		String selectItem = (String) session.getAttribute("selectItem");
		String selectAge = "";

		if ((String) request.getAttribute("selectItem") != null) {
			System.out.println("여기여기"
					+ (String) request.getAttribute("selectItem")
					+ "ㅇㅇㅇ");
			selectItem = (String) request.getAttribute("selectItem");
			session.setAttribute("selectItem", selectItem);
			request.setAttribute("selectItem", selectItem);
		}

		if ((String) request.getAttribute("selectAge") != null) {
			selectAge = (String) request.getAttribute("selectAge");
			session.setAttribute("selectAge", selectAge);
			request.setAttribute("selectAge", selectAge);
		}
%>
<body>
	<INPUT type="hidden" name="viewEmail" value="<%=email%>">
	<div><%=selectAge%>대 또래 이야기</div>
   <FORM name="radioForm"  method="post" id="radioForm" action="/bbsAgeList.listen">
   <div class="check" style="margin-left:700px;">
   
   <input class="radiobox" name="selectAge" type="radio" style="width:17px;height:17px;" value="10" <%if(selectAge.equals("10")){%> checked<%}%>>&nbsp;<label for="">10대</label>
   <input class="radiobox" name="selectAge" type="radio" style="width:17px;height:17px;" value="20" <%if(selectAge.equals("20")){%> checked<%}%>>&nbsp;<label for="">20대</label>
   <input class="radiobox" name="selectAge" type="radio" style="width:17px;height:17px;" value="30" <%if(selectAge.equals("30")){%> checked<%}%>>&nbsp;<label for="">30대</label>
   <input class="radiobox" name="selectAge" type="radio" style="width:17px;height:17px;" value="40" <%if(selectAge.equals("40")){%> checked<%}%>>&nbsp;<label for="">40대이상</label>
   <input class="radiobox" name="selectItem" type="radio" style="width:17px;height:17px;" value="bbs_add_count" <%if(selectItem.equals("bbs_add_count")){%> checked<%}%>>&nbsp;<label for="">댓글</label>&nbsp;&nbsp;&nbsp;
   <input class="radiobox" name="selectItem" type="radio" style="width:17px;height:17px;" value="goodCount" <%if(selectItem.equals("goodCount")){%> checked<%}%>>&nbsp;<label for="">공감</label>&nbsp;&nbsp;&nbsp;
   <input class="radiobox" name="selectItem" type="radio" style="width:17px;height:17px;" value="bbs_hitCount" <%if(selectItem.equals("bbs_hitCount")){%> checked<%}%>>&nbsp;<label for="">조회수</label>
   
   
   </div>
   </FORM>
  <div class="divAll"  style="width: 1250px; margin: 0px auto; padding: 5px; ">
  <div class="container">
			<ul class="grid effect-2" id="grid">

<%
      ArrayList bbsAgeList = (ArrayList)request.getAttribute("bbsAgeList");
       for(int i =0; i<20; i++)
       {  
         BbsVo bbsVo = (BbsVo)bbsAgeList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         String mini_contents = bbs_contents;
 		if (bbs_contents.length() > 36) {
 			mini_contents = bbs_contents.substring(0, 34) + "...";
 		}
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         int goodCount = (int)bbsVo.getGoodCount();
		 int add_count = (int)bbsVo.getAdd_count();
   %>
   <li>
       <div class="image img-rounded" id="imgRootDiv" style="margin-left: 5px;">
           <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
         data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
         width=325 contents="<%=bbs_contents%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=goodCount%>','<%=bbs_contents%>','<%=email%>');"/>
      
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
       </div>      
      

<!-- Modal 글 List-->
<div class="modal fade" style="width: 100%" id="myModal" tabindex="-1"
   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <div class="lcard-button-wrapper">
               <div class="lcard-button">
                  <div class="container-title animation-1">
                     <div class="heartImg" alt="N" onclick="toggle();"></div>
                  </div>
                  <span class="ng-binding">좋아요</span>
               </div>
               <div class="like-label">0</div>
            </div>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body" style="background-color:gray;margin-left:0;border:30px white solid">
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
                     class="ng-pristine ng-valid ng-touched" placeholder="어떻게 생각하세요?"
                     style="overflow: hidden; word-wrap: break-word; height: 50px;"></textarea>
               </div>
               <INPUT type="hidden" name="bbs_seq" id="bbs_seq" value="">
               <INPUT type="hidden" name="reg_ip" id="reg_ip" value="<%=userIp%>">
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
<div class="modal fade comment-delete-modal" style="width: 100%" tabindex="-1" role="dialog"
   aria-labelledby="mySmallModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-sm" style="margin-top:200px">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">삭제확인</h4>
         </div>
         <div class="modal-body">
            <label for="recipient-name" class="control-label">정말 삭제 하시겠습니까?</label>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">삭제</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
         </div>
      </div>
   </div>
</div>
</body>
</html>         

<%} %>