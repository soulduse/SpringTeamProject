<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.listen.bbs.vo.*"%>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<script type="text/javascript" src="js/ajax-bbsview.js"></script>

<SCRIPT>
$('.img').click(function(){
      var th = $(this);
      var bbsGoodYn = th.attr('bbs_good_yn');
   });
</script>



<%
   ArrayList ajaxBbsViewList = (ArrayList) request.getAttribute("ajaxBbsViewList");
   String email = (String) session.getAttribute("email");
   for (int i = 0; i < 9; i++) {
      BbsVo bbsVo = (BbsVo) ajaxBbsViewList.get(i);
      int bbs_seq = (int) bbsVo.getBbs_seq();
      String bbs_contents = (String) bbsVo.getBbs_contents();
      bbs_contents = bbs_contents.replaceAll("\r\n","</BR>");
      bbs_contents = bbs_contents.replaceAll("\u0020"," ");
      bbs_contents = bbs_contents.replaceAll("'", "''");
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
         contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>" bbs_good_yn="<%=bbs_good_yn %>"
         email="<%=email%>" onclick="imgClick('<%=bbs_seq%>','<%=path%>','<%=save_name%>','<%=bbs_contents%>','<%= (String) session.getAttribute("email") %>>','<%=email%>');" />

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