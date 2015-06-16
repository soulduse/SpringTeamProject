<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>

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
				        <img class="img imageShadow opacity" name="<%=bbs_seq%>" data-toggle="modal" 
				      data-target="#myModal"  style="cursor:pointer;" src="<%=path%>/<%=save_name%>" 
				      width=100% height=390px contents="<%=bbs_contents%>" bbs_goodCount="<%=bbs_goodCount%>"/>
				   
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
