<%@ page contentType="text/html; charset=euc-kr"%>
<SCRIPT>
</SCRIPT>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/main.listen"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">pageChange <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">LISTEN ALL</a></li>
            <li class="divider"></li>
            <li><a href="#">MY STORY</a></li>
            <li class="divider"></li>
            <li><a href="#">LISTEN</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></button>
      </form>
 <%
 	if(session.getAttribute("LoginYn") == "Y")
 	{
 		%>
 		<a href="/mMemberInfo.listen">
 		<font color="white" size="3"><%=session.getAttribute("email") %>��</font> </a>
 	<%
 	}
 %>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/mMain.listen"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-comment" aria-hidden="true"></a></li>
        <li><a href="/write.listen"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-bell" aria-hidden="true"></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-option-vertical" aria-hidden="true"> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
          	<P><H3 align="center"><font color="#4C4C4C">Listen</font></H3></P><BR>
            <li><a href="#"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true"> ��������</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-wrench" aria-hidden="true"> �� Ŭ�ι� Ȯ��</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-stats" aria-hidden="true"> �α� �ִ� �̾߱�</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"> ���� �ִ� �̾߱�</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"> Ž��ȯ�� ����</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"> ����</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-send" aria-hidden="true"> �ǰ� ������</a></li>
            <li class="divider"></li>
            <% 	
            	if (session.getAttribute("LoginYn") != null && ((String) session.getAttribute("LoginYn")).length() > 0
					&& ((String) session.getAttribute("LoginYn")).equals("Y"))
					{  
			%>
            			<li><a href="mLogout.listen"><span class="glyphicon glyphicon-send" aria-hidden="true"> �α׾ƿ�</a></li>
            <% 	
            		} 
            %>
            <li class="divider"></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- 
glyphicon glyphicon-home Ȩ
glyphicon glyphicon-search �˻�
glyphicon glyphicon-pencil �۾���
glyphicon glyphicon-bell �˸�
glyphicon glyphicon-comment ä��
glyphicon glyphicon-option-vertical �޴�
glyphicon glyphicon-bullhorn ����
glyphicon glyphicon-stats �α�
glyphicon glyphicon-eye-open ����
glyphicon glyphicon-wrench ��ġ�� ����
glyphicon glyphicon-cog ����
glyphicon glyphicon-send �ǰߺ�����
glyphicon glyphicon-camera ����
glyphicon glyphicon-picture �׸�
glyphicon glyphicon-map-marker ����ġ��
glyphicon glyphicon-edit �ۼ���
glyphicon glyphicon-user ������
 -->
