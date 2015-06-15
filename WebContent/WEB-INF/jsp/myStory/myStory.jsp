<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="com.listen.bbs.vo.*"%>


   <div class="jb-content" style="margin-left: 5px;">                 
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
