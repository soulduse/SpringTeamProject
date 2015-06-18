<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="com.listen.bbs.vo.*"%>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>

<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-comment.js"></script>
<script type="text/javascript" src="js/ajax-chattingRequest.js"></script>
<SCRIPT>
  $(function() {
	   $('.img').click(function() {
		   clearTbody();
	         var d = $(this).attr("src");	         
	         var c = $(this).attr("contents");
	         var bbs_seq = $(this).attr("name");
	         var bbs_likeCount = $(this).attr("bbs_goodCount");

	         $('.like-label').text(bbs_likeCount); // 공감 버튼 데이터 DB값 가져오기
	         $("#modalImg").attr("src", d);
	         $("#bbs_seq").attr("value", bbs_seq);
	         var modalContent = document.getElementById("modalContent");
	         modalContent.innerHTML = c;
	         
	         ajaxBbsAdd();
	      });

	      var addForm = $('#addForm');
	      $('#addWriteBtn').click(function() {
	         ajaxBbsAdd();
	      });
	 });
   $(function() {
      $('#fileBtn').click(function() {
         $('#imgForm').submit();      
      });
   });
  
   
</SCRIPT>
<!doctype html>
<html lang="ko">
 <head>
 <% 
   if(session.getAttribute("email")!=null 
      && session.getAttribute("LoginYn") != null 
      &&((String)session.getAttribute("LoginYn")).equals("Y"))
      {
      String email = (String)session.getAttribute("email");
      String userIp = request.getRemoteAddr();
      
 %>
 
 <style type="text/css">
 <% 
 MyBackGroundVo mybgimg = (MyBackGroundVo)request.getAttribute("bbsMybgimg");
 String path1 = "images";
 String save_name1 = "back2.png";
 if(mybgimg != null){
    path1 = (String)mybgimg.getPath();
    save_name1 = (String)mybgimg.getSave_name();
 }
%>

body { 
background-color: #ffffff;
background-image: url('<%=path1%>/<%=save_name1%>'); 
background-repeat : no-repeat; 
background-attachment : fixed; 
background-position : 0% 0%; 
background-size: cover;
}

</style>
   
    <style>
        
      .story {
      
        margin: 0px auto;
        padding: 0px;
       
      }
      .story-header {
        width: 1200px; 
        padding: 20px;
        margin-bottom: 10px;
        
      }
      
      .story_cover1 {
        width: 1300px;
        margin: 0px auto;       
        padding: 10px;
        float: center;      
      }
      
      
      .story_footer {
        clear: both;
        padding: 20px;
        
      }
      .story_cover {
         width: 375px;
        padding: 10px;
        margin-bottom: 5px; 
        margin-left: 30px;         
        float: left;       
      }
      
      .image{
        
        width: 350px;
        padding: 10px;
        margin-bottom: 10px;        
        float: left;
        margin-left: 5px; 
        border: 1px solid #bcbcbc;
       
      }
     
    </style>
  </head>
  
    
  
  <body>
  <div class="story">
  <FORM name="imgForm" method="post" id="imgForm" enctype="multipart/form-data" action="/myImgSave.listen">
   <div class="story-header"><B><H1>MY STORY</H1></B>
   
   <input type="file" name="upload" value="배경편집" style=" float: left;">
   <INPUT type="button" id="fileBtn" value="등록" style=" float: left;">
   </div></FORM>
  
 <div class="story_cover1">
         
<div class="story_cover">                 
<%
ArrayList bbsMyViewList = (ArrayList)request.getAttribute("bbsMyViewList");
   for(int i=0; i<bbsMyViewList.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsMyViewList.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      String dispYn = (String)bbsVo.getDispYn();
      int goodCount = (int)bbsVo.getGoodCount();
		 int add_count = (int)bbsVo.getAdd_count();
      if(i%3==1){
         if(dispYn.equals("Y")){
         
%>
    <div class="image" id="imgRootDiv" style="background-color:gray;">     
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=300 contents="<%=bbs_contents%>"/>
   
        <div class="text2">
              <table>
                 <TR height="70%">
                    <TD>
                         <H3><%=bbs_contents%></h3>
                      </TD>
                   </TR>
                   <TR height="30%">
                      <TD align="left">
                         	조회수 : <%=bbs_hitCount%> / <br>
                         	좋아요 : <%=goodCount %> / <br>
                         	댓글수 : <%=add_count %>
                      </TD>
                   </TR>
                </table>
                
             </div>
   </div>
    <%
   }
         else{
%>
   <div class="image " id="imgRootDiv" style="background-color:white; ">     
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
   
        <div class="text2">
              <table>
                 <TR height="70%">
                    <TD>
                         <H3><%=bbs_contents%></h3>
                      </TD>
                   </TR>
                   <TR height="30%">
                      <TD align="left">
                         	조회수 : <%=bbs_hitCount%> / <br>
                         	좋아요 : <%=goodCount %> / <br>
                         	댓글수 : <%=add_count %>
                      </TD>
                   </TR>
                </table>
                
             </div>
          <form class="dispForm" method="post" id="dispForm1"action="/dispSave.listen">                  
               <input type="hidden" name="seq" id="seq" value="<%=bbs_seq%>" />
               <input type="submit" class="dispBtn" value="공개"/>
               </form>
   </div>
   <%
   }         
%>
      <%
   }
  }
   
%>
    </div>
    
<div class="story_cover">                 
<%
ArrayList bbsMyViewList1 = (ArrayList)request.getAttribute("bbsMyViewList");
   for(int i=0; i<bbsMyViewList1.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsMyViewList1.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      String dispYn = (String)bbsVo.getDispYn();
      int goodCount = (int)bbsVo.getGoodCount();
	  int add_count = (int)bbsVo.getAdd_count();
  	  if(i%3==2){
      if(dispYn.equals("Y")){
      
%>
 <div class="image " id="imgRootDiv" style="background-color:gray;">     
     <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
   data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
   width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>

     <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                      	조회수 : <%=bbs_hitCount%> / <br>
                      	좋아요 : <%=goodCount %> / <br>
                      	댓글수 : <%=add_count %>
                   </TD>
                </TR>
             </table>
             
          </div>
   </div>
    <%
   }
         else{
%>
   <div class="image " id="imgRootDiv" style="background-color:white;">     
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
   
        <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                      	조회수 : <%=bbs_hitCount%> / <br>
                      	좋아요 : <%=goodCount %> / <br>
                      	댓글수 : <%=add_count %>
                   </TD>
                </TR>
             </table>
             
          </div>
          <form class="dispForm" method="post" id="dispForm2"action="/dispSave.listen">                  
               <input type="hidden" name="seq" id="seq" value="<%=bbs_seq%>" />
               <input type="submit" class="dispBtn" value="공개"/>
               </form>
   </div>
   <%
   }         
%>
      <%
   }
  }
   
%>
    </div>
    
<div class="story_cover">                 
<%
ArrayList bbsMyViewList2 = (ArrayList)request.getAttribute("bbsMyViewList");
   for(int i=0; i<bbsMyViewList2.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsMyViewList2.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      String dispYn = (String)bbsVo.getDispYn();
      int goodCount = (int)bbsVo.getGoodCount();
	  int add_count = (int)bbsVo.getAdd_count();
  	  if(i%3==0){
      if(dispYn.equals("Y")){
      
%>
 <div class="image " id="imgRootDiv" style="background-color:gray;">     
     <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
   data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
   width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>

     <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                      	조회수 : <%=bbs_hitCount%> / <br>
                      	좋아요 : <%=goodCount %> / <br>
                      	댓글수 : <%=add_count %>
                   </TD>
                </TR>
             </table>
             
          </div>
   </div>
    <%
   }
         else{
%>
   <div class="image " id="imgRootDiv" style="background-color:white;">     
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
   
        <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                      	조회수 : <%=bbs_hitCount%> / <br>
                      	좋아요 : <%=goodCount %> / <br>
                      	댓글수 : <%=add_count %>
                   </TD>
                </TR>
             </table>
             
          </div>
          <form class="dispForm" method="post" id="dispForm3"action="/dispSave.listen">                  
               <input type="hidden" name="seq" id="seq" value="<%=bbs_seq%>" />
               <input type="submit" class="dispBtn" value="공개"/>
          </form>
   </div>
   <%
   }         
%>
      <%
   }
  }
   
%>
    
     



</div>
   </div>

 <div class="story_footer"></div> 
    
 </div>
 <!-- Modal 글 List-->
<div class="modal fade" style="width: 100%" id="myModal" tabindex="-1"
   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         
            <div class="lcard-button-wrapper">
               <div class="lcard-button">
                  <div class="container animation-1">
                     <div class="heartImg" alt="0"></div>
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

<%
   }
%>
 </body>
</html>   
