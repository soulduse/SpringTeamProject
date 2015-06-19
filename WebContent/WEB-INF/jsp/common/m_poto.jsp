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
		<meta name="description" content="Elastic Stack - Elastic dragging interaction" />
		<meta name="keywords" content="elastic thumnails, draggabilly, navigate, touch, " />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/m-component.css" />
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

			<h5 style="position: relative; top: -40px;">Listen</h5>
			<div class="image" id="imgRootDiv"
				style="position: relative; top: -60px">
				<a href="#<%=bbs_seq%>" data-rel="popup" data-position-to="window"
					data-transition="pop"> <img class="img imageShadow opacity"
					name="<%=bbs_seq%>" data-toggle="modal" data-target="#myModal"
					style="cursor: pointer;" src="<%=path%>/<%=save_name%>" width=100%
					height=390px contents="<%=bbs_contents%>"
					bbs_goodCount="<%=bbs_goodCount%>" />

				</a>

				<div class="text2" height="390px"
					style="position: relative; top: -390px;">
					<table width="100%" style="position: relative; top: -30px;">
						<TR height="320px">
							<TD valign=top>
								<span><%=bbs_contents%></span>
							</TD>
						</TR>
						<TR height="10px">
							<TD align="left"><%=bbs_hitCount%></TD>
						</TR>
						<a href="/m_bbsView.listen?bbs_seq=<%=bbs_seq%>"
							class="buttonClick" data-rel="dialog" data-role="button"
							data-inline="true" data-transition="slidedown" data-theme="a"
							style="left: 200px; top: 350px;">글보기</a>
					</table>
				</div>
			</div>

		</li>

		<%
			}
		%>

			
</ul>   	


	
		</div><!-- /container -->
		<script src="js/draggabilly.pkgd.min.js"></script>
		<script src="js/elastiStack.js"></script>
		<script>
			new ElastiStack( document.getElementById( 'elasticstack' ) );
		</script>
