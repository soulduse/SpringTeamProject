<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<SCRIPT>
$(function(){
   $('.img').click(function(){
      var d = $(this).attr("src");
      var c = $(this).attr("contents");
      var bbs_seq = $(this).attr("name");
      $("#modalImg").attr("src", d);
      $("#bbs_seq").attr("value", bbs_seq);
      var modalContent = document.getElementById("modalContent");
      modalContent.innerHTML = c;
   });
   
   var addForm = $('#addForm');
   $('#addWriteBtn').click(function()
	{
	   addForm.submit();
	});
   
   $('.chkbox').click(function(){
       alert($(this).attr("value"));
       $('#checkBoxForm').submit();
    })
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
      
   </style>
</head>
<% 
	if(session.getAttribute("email")!=null 
		&& session.getAttribute("LoginYn") != null 
		&&((String)session.getAttribute("LoginYn")).equals("Y"))
		{
		String email = (String)session.getAttribute("email");
		String userIp = request.getRemoteAddr();
		String selectItem = (String)session.getAttribute("selectItem");

%>
<body>
	<FORM name="checkBoxForm"  method="post" id="checkBoxForm" action="/bbsPopList.listen">
   <div class="check" style="margin-left:700px;">
   <input class="chkbox" name="box" type="checkbox" style="width:17px;height:17px;" value="bbs_add" <%if(selectItem.equals("bbs_add")){%> checked<%}%>>&nbsp;<label for="">댓글</label>&nbsp;&nbsp;&nbsp;
   <input class="chkbox" name="box" type="checkbox" style="width:17px;height:17px;" value="공감" <%if(selectItem.equals("bbs_like")){%> checked<%}%>>&nbsp;<label for="">공감</label>&nbsp;&nbsp;&nbsp;
   <input class="chkbox" name="box" type="checkbox" style="width:17px;height:17px;" value="읽은글" <%if(selectItem.equals("bbs_hitCount")){%> checked<%}%>>&nbsp;<label for="">조회수</label>
   </div>
   </FORM>
   <div class="jb-content" style="margin-left: 15px;">    

<%

      int i =0;
      ArrayList bbsPopList = (ArrayList)request.getAttribute("bbsPopList");
       for(i=0; i<10; i++)
       {  
         BbsVo bbsVo = (BbsVo)bbsPopList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         if(i%3==0){
   %>
       <div class="image " id="imgRootDiv" style="margin-left: 15px;">
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
                          
      <div class="jb-content" style="margin-left: 5px;">                 
   <%
      
      for(i=0; i<=10; i++)
      {  
         BbsVo bbsVo = (BbsVo)bbsPopList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         if(i%3==1){
   %>
       <div class="image" id="imgRootDiv"  style="margin-left: 30px;">
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
   
   <nav id="page-nav">
     <a href="pages/2.html"></a>
   </nav>
      
         
    <div class="jb-content" style="margin-left: 15px;">                 
   <%
      for(i=0; i<10; i++)
      {  
         BbsVo bbsVo = (BbsVo)bbsPopList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         if(i%3==2){
   %>
       <div class="image " id="imgRootDiv" style="margin-left: 33px;" >
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
</body>
</html>                    