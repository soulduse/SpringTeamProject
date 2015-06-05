<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<SCRIPT>
function imgClick(){
	$('#myModal img').attr('src', $(this).attr('data-img-url'));
	var divclassname = $("#img9").attr("data-img-url")
	alert(divclassname);
}


$("#img9").click(function() {
	var divclassname = $("#img9").attr("class")
	alert("¿©±â");
	alert(divclassname);
});
</SCRIPT>
<% ArrayList bbsList = (ArrayList)request.getAttribute("bbsList");
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



<LINK href="/css/common.css" rel="stylesheet" type="text/css"/>


	 
	 <div class="image">
  		<img name="img<%=bbs_seq %>" id="img<%=bbs_seq %>" class="imageShadow" data-toggle="modal" 
		data-target="#myModal" onclick="imgClick();" style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
		width=300 data-img-url="<%=path%>/<%=save_name%>&text=<%=bbs_contents%>"/>
	
  		<div class="text">
   	 		<H3><%=bbs_contents%></h3>
   	 	</div>
   	 	<div alian="right" ><%=bbs_hitCount%></div>
   	 	</a>
	</div>
      <%
   }
%>


<!-- Modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:800px;">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">¡¿</button>
</div>
<div class="modal-body">
    <img src="#"/>
</div>
<div class="modal-footer">
<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>