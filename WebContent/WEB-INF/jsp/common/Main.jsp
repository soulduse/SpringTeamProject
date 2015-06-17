<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
      
      var chatReqForm = $('#chatReqForm');
		$('#chattingRequset').click(function() {
			alert("22");
			chattingRequest();
		});
		
		
   });
</SCRIPT>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
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
    <div class="listen-container">
      <div class="listen-header">
        <img alt="" src="images/logo1.png" height="200" width="700">
      </div>
      
      <div class="listen-big">
       <div class="listen-content1_1">
                             
             <div class="listen-content2" style="color:black; background-image:url(images/back2.png);   " >
                <center>
                <B><p><h2>또래 이야기</h2></p></B>
                <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 30px; cursor:pointer;" onclick="">10대 이야기</div>
                <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 30px; cursor:pointer;" onclick="" >20대 이야기</div>
                <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 30px; cursor:pointer;" onclick="">30대 이야기</div>
                <div class="listen-content2_1" style=" font-weight: 300; font-size: 1em;font-family: 맑은고딕; height: 30px; cursor:pointer;" onclick="">40대이상 이야기</div>
                </center>
             </div>
             
             <div class="listen-content2" style="background-color:#f2f2f2; background-image:url(images/back5.png); height:180;">
              <center><B><p><h2>추천 이야기</h2></p></B>
               <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 35px; cursor:pointer;" onclick="" >공감순 이야기</div>
               <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 35px; cursor:pointer;" onclick="" >댓글순 이야기</div>
               <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 35px; cursor:pointer;" onclick="">인기순 이야기</div>
                </center>
             </div>           
             
             
             
             <div class="listen-content2" style="background-color:#f2f2f2; background-image:url(images/back3.png); height:150;">
            <center> <B><p><h2>베스트 이야기</h2></p></B>
             <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 40px; cursor:pointer;" onclick="" >주간베스트 이야기</div>
             <div class="listen-content2_1" style=" font-weight: 250; font-size: 1em;font-family: 맑은고딕; height: 40px; cursor:pointer;" onclick="" >월간베스트 이야기</div>            
              </center>
             </div>          
      </div>
      
      <div class="listen-content1" style="background-image:url(images/back4.png);">
            <div class="listen-content1_2" style="cursor:pointer;" onclick="">
            <B><h1>MY STORY</h1></B>
             <p><h4>(최근에 내가 올린 이야기)</h4></p>
             </div>
             <div class="listen-content1_3"></div>
             <div class="listen-content1_3"></div>
      </div>
      
      
         <div class="listen-content3">            
             <img alt="" width="370" height="450" src="images/love.png">
             <B><h2>우리들끼리 토론방</h2></B>
           <p>사랑이란?</p>
       </div>       
      </div>
   
   
   <div class="listen-content4_1">  
 <%   
    // 서버의 context 경로 구하기
     String root = request.getSession().getServletContext().getRealPath("/");
     int count=0;
     ArrayList bbsList4 = (ArrayList)request.getAttribute("bbsList");
   for(int i=0; count<=3; i++)
   {  
      
      BbsVo bbsVo = (BbsVo)bbsList4.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
       // 이미지 파일 위치
      String filename = root+path+"/"+save_name ;
   
      // 이미지 읽기
      Image img = new ImageIcon(filename).getImage();
   
      int imgWidth = img.getWidth(null);      //가로 사이즈
      int imgHeight = img.getHeight(null);        //세로 사이즈
   
      
      if(imgWidth > imgHeight)
      {
         if(imgHeight > 235)
         {
            imgHeight = 235;
         }
         count++;
         if(count<=3)
         {     
      
      %>
        <div class="listen-content4"> 
                                               
              <% if(count==2)
              { %> 
            <div class="listen-content5_5">
              <img alt="" width="350"  height=<%=imgHeight%> src="<%=path%>/<%=save_name%>">
               </div>
             <div class="listen-content5" style="background-image:url(images/textimg1.png);"> 
              <B><p><%=bbs_contents %></p></B></div>
              <% }
              else 
              {
              %>
              <div class="listen-content5" style="background-image:url(images/textimg1.png);"> 
              <B><p><%=bbs_contents %></p></B></div>
               <div class="listen-content5_5">
              <img alt="" width="350"  height=<%=imgHeight%> src="<%=path%>/<%=save_name%>">
              </div>
              <%} %>
          </div>
        <%
         } }}%>
                  
  </div>
<%
int count1=0;
ArrayList bbsList5 = (ArrayList)request.getAttribute("bbsList");
for(int i=0; count1<=1; i++)
{  
      
   BbsVo bbsVo = (BbsVo)bbsList5.get(i);
   int bbs_seq = (int)bbsVo.getBbs_seq();
   String bbs_contents = (String)bbsVo.getBbs_contents();
   int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
   String reg_email = (String)bbsVo.getReg_email();
   String path = (String)bbsVo.getPath();
   String save_name = (String)bbsVo.getSave_name();
     // 이미지 파일 위치
   String filename = root+path+"/"+save_name ;

   // 이미지 읽기
   Image img = new ImageIcon(filename).getImage();

   int imgWidth = img.getWidth(null);      //가로 사이즈
   int imgHeight = img.getHeight(null);        //세로 사이즈
   if(imgWidth < imgHeight)
   {
      count1++;
      if(count1<=1)
      {
   %>
   
          <div class="listen-content6"> 
           <div class="listen-content7" >
              <img alt="" width="480" height="360" src="<%=path%>/<%=save_name%>">           
              </div>
             <div class="listen-content8" style="background-image:url(images/textimg2.png);">
                 <center><B><p><%=bbs_contents %></p></B></center>
             </div>
<% } 
      else
   {%>
             <div class="listen-content9">
                <div class="listen-content10" style="background-image:url(images/textimg1.png);">
                 <div class="listen-content11" > 
                   <center><p><%=bbs_contents %></p></center>
                </div> 
                </div>
                <div class="listen-content12">
                   <img alt="" width="309" height="188" src="<%=path%>/<%=save_name%>"></div>
                </div>
                   </div>
 <% } } }%>   
      
  <div class="jb-content">    
                   
   <div class="jb-content1" style="margin-left: 5px;">                 
<%
ArrayList bbsList = (ArrayList)request.getAttribute("bbsList");
   for(int i=0; i<bbsList.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsList.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      int bbs_goodCount = (int) bbsVo.getGoodCount();
      if(i%3==1){
%>
    <div class="image" id="imgRootDiv"  style="margin-left: 15px;">
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=300 contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"/>
   
        <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                    <%=bbs_hitCount%>
                   </TD>
                </TR>
             </table>
             
          </div>
   </div>
      <%
   }
  }
   
%>
</div>


      
 <div class="jb-content1" style="margin-left: 15px;">                 
<% ArrayList bbsList2 = (ArrayList)request.getAttribute("bbsList");
   for(int i=0; i<bbsList.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsList.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      int bbs_goodCount = (int) bbsVo.getGoodCount();
      if(i%3==2){
%>
    <div class="image " id="imgRootDiv" style="margin-left: 23px;" >
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=310 contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"/>
   
        <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                      <%=bbs_hitCount%>
                   </TD>
                </TR>
             </table>
             
          </div>
   </div>
      <%
   }
  }
   
%>
   </div>
      
 <div class="jb-content1" style="margin-left: 15px;">                 
<% ArrayList bbsList3 = (ArrayList)request.getAttribute("bbsList");
   for(int i=0; i<bbsList.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsList.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      int bbs_goodCount = (int) bbsVo.getGoodCount();
      if(i%3==0){
%>
    <div class="image " id="imgRootDiv" style="margin-left: 33px;">
        <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=300 contents="<%=bbs_contents%>"  bbs_goodCount="<%=bbs_goodCount%>"/>
   
        <div class="text2">
           <table>
              <TR height="70%">
                 <TD>
                      <H3><%=bbs_contents%></h3>
                   </TD>
                </TR>
                <TR height="30%">
                   <TD align="left">
                      <%=bbs_hitCount%>
                   </TD>
                </TR>
             </table>
             
          </div>
   </div>
      <%
   }
  }
   
%>
    </div>
    
<!-- Modal 글 List-->
<div class="modal fade" style="width: 100%" id="myModal" tabindex="-1"
   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         <FORM name="chatReqForm" id="chatReqForm" method="post" action="/chattingRequest.listen">
					<INPUT type="hidden" name="bbs_seq" id="bbs_seq" value="">
					<INPUT type="hidden" name="email" id="email"
						value="<%=email%>">
				</FORM>
            <div class="lcard-button-wrapper">
               <div class="lcard-button">
                  <div class="container animation-1">
                     <div class="heartImg" alt="N"></div>
                  </div>
                  <span class="ng-binding">좋아요</span>
               </div>
               <div class="like-label" email=<%=email %>>0</div>
            </div>
            <div id="chattingRequset" class ="glyphicon glyphicon-comment" style="left: 100px; cursor:pointer;" >채팅 요청</div>
				
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