<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<script>
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
});
</script>
<%
ArrayList ajaxBbsViewList = (ArrayList)request.getAttribute("ajaxBbsViewList");

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
      int goodCount = (int)bbsVo.getGoodCount();
	  int add_count = (int)bbsVo.getAdd_count();
      if(i%3==1){
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
  }
   
%>