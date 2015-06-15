<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="com.listen.bbs.vo.*"%>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>


<!doctype html>
<html lang="ko">
 <head>
 
 
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
        padding: 5px;
       
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
  
  <SCRIPT>
   $(function() {
      $('#fileBtn').click(function() {
         //var writeForm = $('#writeForm');
         $('#imgForm').submit();      
      });
   });
   $(function() {
      $('#dispBtn').click(function() {
         //var writeForm = $('#writeForm');
         $('#dispForm').submit();      
      });
   });
   
</SCRIPT>
    
  
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
      if(i%3==1){
         if(dispYn.equals("Y")){
         
%>
    <div class="image " id="imgRootDiv" style="background-color:gray;">     
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
         else{
%>
   <div class="image " id="imgRootDiv" style="background-color:white; ">     
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
          <form class="dispForm" method="post" id="dispForm" action="/dispSave.listen">
          <input type="button" id="dispBtn" value="공개" "></form>
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
      if(i%3==2){
if(dispYn.equals("Y")){
         
%>
    <div class="image " id="imgRootDiv" style="background-color:gray;">     
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
         else{
%>
   <div class="image " id="imgRootDiv" style="background-color:white;">     
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
          <input type="button" id="dispBtn" value="공개" ">
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
      if(i%3==0){
if(dispYn.equals("Y")){
         
%>
    <div class="image " id="imgRootDiv" style="background-color:gray;">     
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
         else{
%>
   <div class="image " id="imgRootDiv" style="background-color:white;">     
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
          <input type="button" id="dispBtn" value="공개" ">
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
 
 </body>
</html>   