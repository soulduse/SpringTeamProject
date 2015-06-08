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
});
</SCRIPT>

<% 
	if(session.getAttribute("email")!=null 
		&& session.getAttribute("LoginYn") != null 
		&&((String)session.getAttribute("LoginYn")).equals("Y"))
	{
		String email = (String)session.getAttribute("email");
		String userIp = request.getRemoteAddr();
	

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
%>
    <div class="image " id="imgRootDiv" >
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
                      <%=bbs_hitCount%>
                   </TD>
                </TR>
             </table>
             
          </div>
   </div>
      <%
   }
%>

<!-- Modal -->
<div class="modal fade"  style="width:100%" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body image" style="margin-left:34">
      <img id="modalImg" class="imageShadow" src="#" width="500"/>
       <div class="text3">
       <H3><label id="modalContent"></label></H3>
       </div>
      </div>
      <FORM name="addForm" id="addForm" method="post" action="/bbsAdd.listen">
	      <div class="comment-textarea">
	         <textarea name="content" class="ng-pristine ng-valid ng-touched" placeholder="어떻게 생각하세요?" style="overflow: hidden; word-wrap: break-word; height: 50px;"></textarea>
	      </div>
	      <INPUT type="hidden" name="bbs_seq" id="bbs_seq" value="">
	      <INPUT type="hidden" name="reg_ip" id="reg_ip" value="<%=userIp%>">
	      <INPUT type="hidden" name="reg_email" id="reg_email" value="<%=email%>">
      </FORM>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="addWriteBtn">게시</button>
      </div>
    </div>
  </div>
</div>
<%}%>