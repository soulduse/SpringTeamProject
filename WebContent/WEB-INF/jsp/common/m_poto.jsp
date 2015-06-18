<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>
<script type="text/javascript" src="js/ajax-comment.js"></script>

<SCRIPT>

$(function() {

    var addForm = $('#addForm');
    $('#addWriteBtn').click(function() {
    	alert();
       ajaxBbsAdd();
    });
});
</SCRIPT>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Elastic Stack</title>
		<meta name="description" content="Elastic Stack - Elastic dragging interaction" />
		<meta name="keywords" content="elastic thumnails, draggabilly, navigate, touch, " />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>  
		<div class="container">
		        
			<ul id="elasticstack" class="elasticstack">
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
      int bbs_goodCount = (int) bbsVo.getGoodCount();
%>
				<li>
				    <div class="image" id="imgRootDiv" >
				      <a href="#<%=bbs_seq%>" data-rel="popup" data-position-to="window" data-transition="pop">
				        
				        <img class="img imageShadow opacity" name="<%=bbs_seq%>" data-toggle="modal" 
				      data-target="#myModal"  style="cursor:pointer;" src="<%=path%>/<%=save_name%>" 
				      width=100% height=390px contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"/>
				      
				      </a>
				   
				        <div class="text2" style="position: relative; top: -400px;">
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
				   <h5 style="position: relative; top: -430px;"	>Listen</h5>
				   <a href="/m_bbsView.listen?bbs_seq=<%=bbs_seq %>" class="buttonClick" data-rel="dialog" data-role="button" data-inline="true" data-transition="slidedown" 
				   data-theme="a" style="position: relative; top: -110px; left:200px;">글보기</a>				   
				</li>
				
<%
  }
%>
<%
bbsList = (ArrayList)request.getAttribute("bbsList");
   for(int i=0; i<bbsList.size(); i++)
   {  
      BbsVo bbsVo = (BbsVo)bbsList.get(i);
      int bbs_seq = (int)bbsVo.getBbs_seq();
      String bbs_contents = (String)bbsVo.getBbs_contents();
      int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
      String reg_email = (String)bbsVo.getReg_email();
      String path = (String)bbsVo.getPath();
      String save_name = (String)bbsVo.getSave_name();
      int bbs_goodCount = (int) bbsVo.getGoodCount();
%>

<%
  }
%>
			
</ul>   	

               
<a href="#popupWirth" data-rel="popup" data-position-to="window" data-inline="true" data-icon="check" data-theme="a" data-transition="pop" style="position: relative; top: -70px; left : 140px"><img class="img" src="images/mobile_write.jpg"></a>
<div data-role="popup" id="popupWirth" data-theme="a" class="ui-corner-all">
	<FORM name="writeForm" method="post" id="writeForm" enctype="multipart/form-data" action="/m_writeSave.listen">
        <div style="padding:10px 20px;">
            <h3>글쓰기</h3>
		    <label for="bbs_contents">Textarea:</label>
		    <textarea data-mini="true" cols="40" rows="8" name="bbs_contents" id="bbs_contents"></textarea>
		     <label for="upload">File</label>
		     <input type="file" data-clear-btn="false" name="upload" id="upload" value="">
            <button type="submit" data-theme="b" data-icon="check">글등록</button>
        </div>
    </form>
</div>

	
		</div><!-- /container -->
		<script src="js/draggabilly.pkgd.min.js"></script>
		<script src="js/elastiStack.js"></script>
		<script>
			new ElastiStack( document.getElementById( 'elasticstack' ) );
		</script>
