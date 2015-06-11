<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>


<script src="js/jquery.masonry.min.js"></script>
<script src="js/jquery.infinitescroll.min.js"></script>


<SCRIPT>
$(function(){      
   $('.img').click(function(){
      var d = $(this).attr("src");
      var c = $(this).attr("contents");
      $("#modalImg").attr("src", d);
      var modalContent = document.getElementById("modalContent");
      modalContent.innerHTML = c;
   });
});  //글 상세보기 창


</SCRIPT>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Listen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      .listen-container {
        background: #f6f6f6;
        margin: 0px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      .listen-header {
         
        padding: 20px;
        margin-bottom: 20px;
        
      }
      .listen-big {
        background: #454545;
        width: 1160px;
        height: 620px; 
        padding: 10px;
        margin-bottom: 20px;
        margin-left: 20px;
        float: left;
        border: 1px solid #bcbcbc;
        
       
      }
      .listen-content1 {
      background: #f6f6f6;
        width: 410px;
        height: 600px; 
        padding: 10px;
        margin-bottom: 10px;
        margin-left: 16px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      .listen-content1_1 {
      background: #f6f6f6;
        width: 280px;
        height: 600px; 
        padding: 10px;
        margin-bottom: 10px;
        margin-left: 10px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      
      .listen-content2 {
         
        width: 260px;        
        padding:5px;
        margin-bottom: 10px;        
        float: left;               
      }
      
      .listen-content2_1 {             
        width: 250px;                  
        padding:5px;
        margin-bottom: 5px;        
        float: left; 
        border: 1px solid #bcbcbc;              
      }
      
       .listen-content3 {
       background: #f6f6f6;
        width: 400px;
        height: 600px; 
        padding: 10px;
        margin-bottom: 10px;
        margin-left: 18px;
        float: left; 
         border: 1px solid #bcbcbc;         
      }
       .listen-content4 {
        width: 367px;
         height: 400px;
        padding: 10px;
        margin-bottom: 20px;
        margin-left: 23px;
        float:left; 
        border: 5px solid #454545;        
      }
      .listen-content5 {
        width: 335px;
        height: 130px;
        padding: 10px;
        margin-bottom: 10px;
        margin-left: 5px;
        float:left;          
      }
      .listen-content5_5 {
        width: 335px;
        height: 245px;
        padding: 10px;
        margin-bottom: 10px;
       
        float:left; 
        
      }
      .listen-content6 {
        width: 1190px;
        height:410px;             
        margin-left: 15px;
        float:left; 
            
      }
      .listen-content7 {
       background: #454545;
        width: 490px;
        height:375px;            
        margin-left: 5px;          
        float:left;
        border: 3px solid #454545;  
            
      }
       .listen-content8 {
       padding:10px;
        width: 670px;
        height:175px;            
        float:left; 
        border: 3px solid #454545;        
      }
      .listen-content9 {
        width: 670px;
        height:200px;            
        float:left;         
        border: 3px solid #454545;       
      }
      .listen-content10 {
        width: 350px;
        height:193px;            
        float:left; 
              
      }
      .listen-content11 {
      padding:10px;
        width: 350px;
        height:195px;            
        float:left;        
        margin-bottom: 5px;                
        border: 1px solid #454545; 
         
      }
      .listen-content12 {
        width: 314px;
        height:195px;            
        float:left;
        border: 1px solid #454545;
                   
      }
      
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
      
      
      .listen-footer {
        clear: both;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
     
    </style>
  </head>
  <body>
      <div class="listen-container">
      <div class="listen-header">
        <img alt="" src="images/logo1.png" height="200" width="700">
      </div>
      
      <div class="listen-big">
       <div class="listen-content1_1">
                             
             <div class="listen-content2" style="color:black; background-image:url(images/back2.png); height:220;  " >
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
      <B><h1>MY STORY</h1></B>
       <p><h4>(최근에 내가 올린 이야기)</h4></p>
      </div>
      
      
         <div class="listen-content3">            
             <img alt="" width="370" height="450" src="images/love.png">
             <B><h2>우리들끼리 토론방</h2></B>
           <p>사랑이란?</p>
       </div>       
      </div>
     
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
         if(imgHeight > 220)
         {
            imgHeight = 220;
         }
         count++;
         if(count<=3)
         {            	 
      
      %>
        <div class="listen-content4"> 
                                               
              <%
                if(count==2)
              { %> 
            <div class="listen-content5_5">
              <img alt="" width="320"  height=<%=imgHeight%> src="<%=path%>/<%=save_name%>">
               </div>
             <div class="listen-content5"> 
              <p><%=bbs_contents %></p></div>
              <% }
              else 
              %>
              {
              <div class="listen-content5"> 
              <p><%=bbs_contents %></p></div>
               <div class="listen-content5_5">
              <img alt="" width="320"  height=<%=imgHeight%> src="<%=path%>/<%=save_name%>">
              </div>
              <%} %>
          </div>
        <%
         } 
         }
   
      %>
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
              <img alt="" width="482" height="368" src="<%=path%>/<%=save_name%>">           
              </div>
             <div class="listen-content8" style="background-color:#e6e6e6;">
                 <center><p><%=bbs_contents %></p></center>
             </div>
<% } 
      else
   {
   %>
             <div class="listen-content9">
                <div class="listen-content10">
                 <div class="listen-content11"> 
                   <center><p><%=bbs_contents %></p></center>
                </div> 
                </div>
                <div class="listen-content12">
                   <img alt="" width="312" height="189" src="<%=path%>/<%=save_name%>"></div>
                </div>
                   </div>
 <% } } }%>   
                   
   <div class="jb-content" style="margin-left: 5px;">                 
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
      if(i%3==1){
%>
    <div class="image" id="imgRootDiv"  style="margin-left: 15px;">
        <img class="img imageShadow" name="bbs<%=bbs_seq%>" data-toggle="modal" 
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


      
 <div class="jb-content" style="margin-left: 15px;">                 
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
      if(i%3==2){
%>
    <div class="image " id="imgRootDiv" style="margin-left: 23px;" >
        <img class="img imageShadow" name="bbs<%=bbs_seq%>" data-toggle="modal" 
      data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
      width=310 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
   
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
      
 <div class="jb-content" style="margin-left: 15px;">                 
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
      if(i%3==0){
%>
    <div class="image " id="imgRootDiv" style="margin-left: 33px;">
        <img class="img imageShadow" name="bbs<%=bbs_seq%>" data-toggle="modal" 
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
    
<!-- Modal -->
<div class="modal fade"  style="width:100%" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body " style="background-color:gray; margin-left:0; padding: 10px;">
      <img id="modalImg" class="imageShadow" src="#" width="500"/>
       <div class="text3">
       <H3><label id="modalContent"></label></H3>
       </div>
      </div>
      <div class="comment-textarea">
         
         <textarea ng-attr-placeholder="{{ comments.length > 0 ? '어떻게 생각하세요?' : &quot;\ucc98\uc74c\uc73c\ub85c \ub313\uae00\uc744 \ub2ec\uc544\ubcf4\uc138\uc694.&quot; }}" ng-focus="showCommentButton()" ng-keypress="addCommentOnEnter($event)" ng-model="newComment.content" vi-autosize="{ append: false }" class="ng-pristine ng-valid ng-touched" placeholder="어떻게 생각하세요?" style="overflow: hidden; word-wrap: break-word; height: 50px;"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
           <div class="modal-footer">

</div>                             
    </div>
  </body>
</html>