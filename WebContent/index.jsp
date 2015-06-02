<%@ page contentType="text/html; charset=euc-kr"%>
<HTML>
	<HEAD>
		<TITLE>쿡퐁</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<SCRIPT type="text/javascript">
			 var filter = "win16|win32|win64|mac";
	
			 if( navigator.platform  )
			 {
			 	if( filter.indexOf(navigator.platform.toLowerCase())<0 )
			 	{
			   		alert("모바일 기기에서 접속");
			   		// 아래 주소로 이동한다.
			   		//location.href = "http://m.daum.net/";
			  	}else{
			   		//alert("PC에서 접속");
			   		location.href = "/main.listen";
			  	}
			}
		</SCRIPT>
	</HEAD>
		<BODY>
		</BODY>
</HTML>