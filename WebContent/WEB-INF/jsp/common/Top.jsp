<%@ page contentType="text/html; charset=euc-kr"%>
<SCRIPT>
   // 선택한 메뉴의 페이지 이름으로 바꿔주는 Script
   $(function(){
      $(".dropdown-menu li a").click(function(){
           $(this).parents(".dropdown").find('.selection').text($(this).text());
           $(this).parents(".dropdown").find('.selection').val($(this).text());
         });
   });
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="selection">LISTEN ALL</span><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/main.listen">LISTEN ALL</a></li>
            <li class="divider"></li>
            <li><a href="#">MY STORY&nbsp</a></li>
            <li class="divider"></li>
            <li><a href="#">LISTEN&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
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
 System.out.println("Top.jsp진입");
 	if(session.getAttribute("LoginYn") == "Y")
 	{
 		%>
 		<a href="/memberInfo.listen">
 		<font color="white" size="3"><%=session.getAttribute("email") %>님</font> </a>
 	<%
 	}
 %>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/view.listen"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-comment" aria-hidden="true"></a></li>
        <li><a href="/write.listen"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-bell" aria-hidden="true"></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-option-vertical" aria-hidden="true"> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
             <P><H3 align="center"><font color="#4C4C4C">Listen</font></H3></P><BR>
            <li><a href="#"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true"> 공지사항</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-wrench" aria-hidden="true"> 내 클로버 확인</a></li>
            <li class="divider"></li>
            <li><a href="/bbsPopList.listen"><span class="glyphicon glyphicon-stats" aria-hidden="true"> 인기 있는 이야기</a></li>
            <li class="divider"></li>
            <li><a href="/bbsIntList.listen"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"> 관심 있는 이야기</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"> 탐색환경 설정</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"> 설정</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-send" aria-hidden="true"> 의견 보내기</a></li>
            <li class="divider"></li>
            <%    
               if (session.getAttribute("LoginYn") != null && ((String) session.getAttribute("LoginYn")).length() > 0
               && ((String) session.getAttribute("LoginYn")).equals("Y"))
               { 
         %>
                     <li><a href="/Logout.listen"><span class="glyphicon glyphicon-off" aria-hidden="true"> 로그아웃</a></li>
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
glyphicon glyphicon-home 홈
glyphicon glyphicon-search 검색
glyphicon glyphicon-pencil 글쓰기
glyphicon glyphicon-bell 알림
glyphicon glyphicon-comment 채팅
glyphicon glyphicon-option-vertical 메뉴
glyphicon glyphicon-bullhorn 공지
glyphicon glyphicon-stats 인기
glyphicon glyphicon-eye-open 관심
glyphicon glyphicon-wrench 위치값 설정
glyphicon glyphicon-cog 설정
glyphicon glyphicon-send 의견보내기
glyphicon glyphicon-camera 사진
glyphicon glyphicon-picture 그림
glyphicon glyphicon-map-marker 내위치값
glyphicon glyphicon-edit 글수정
glyphicon glyphicon-user 사람모양
 -->
