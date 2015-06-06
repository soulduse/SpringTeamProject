<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<SCRIPT>
$(function(){
	function imgClick(){
		var divclassname = $(this).attr("data-img-url");
		$('#myModal img').attr('src',divclassname);
		//$('#myModal img').attr('src', $(this).attr('data-img-url'));
		alert(divclassname);
	};
	
	$('.img').click(function(){
		var d = $(this).attr("src");
		var c = $(this).attr("contents");
		$("#modalImg").attr("src", d);
		var modalContent = document.getElementById("modalContent");
		modalContent.innerHTML = c;
	});
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
	 <div class="image " id="imgRootDiv" >
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
%>


<!-- Modal -->
<CENTER>
<div id="myModal" style="width:100%" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-header" style="margin-left:25%;text-align: center; vertical-align:middle;">
			<div class="modal-body image" >
				<img id="modalImg" class="imageShadow " src="#" width="500"/>
				<div class="text3">
			  			<table >
			  				<TR>
			  					<TD >
						   	 		<H3><label id="modalContent"></label></H3>
						   	 	</TD>
						   	 </TR>
						   	 <TR>
						   	 	<TD align="left">
			   	 				<h3></h3>	
			   	 				</TD>
			   	 			</TR>
			   	 		</table>
			   	 	</div>
			   	 	</div>		   	 	
</div>
<div class="modal-footer">

</div>
</div>
</CENTER>