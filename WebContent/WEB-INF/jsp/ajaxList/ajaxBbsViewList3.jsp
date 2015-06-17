<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>


<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-comment.js"></script>
<script type="text/javascript" src="js/ajax-chattingRequest.js"></script>
<%

ArrayList ajaxBbsViewList = (ArrayList)request.getAttribute("ajaxBbsViewList");
System.out.println("ajax데이터 들어옴: "+ajaxBbsViewList.size());
   for(int i=0; i<9; i++)
   {  
      BbsVo bbsVo = (BbsVo)ajaxBbsViewList.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      int bbs_goodCount = (int) bbsVo.getGoodCount();
      if(i%3==0){
%>

    <div class="image"  style="margin-left: 15px;">
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