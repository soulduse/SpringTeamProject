<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html> 
<html> 
	<head>
		<title>마음이 따뜻해지는 익명SNS - Listen</title>
		<meta charset="UTF-8" /> 	
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		
	<!-- 	<link rel="shortcut icon" href="../image/icon.png">
		<link rel="apple-touch-icon" href="../image/icon.png">
-->
		<link href="/css/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.6.4.js"></script>
		<script src="/js/jquery.mobile-1.0.js"></script>
		<script src="js/geolocation.js"></script>
	</head> 
<%
if(request.getAttribute("Error") == "N")
{
%><SCRIPT>
	window.alert("잘못된 정보입니다");
	</SCRIPT>
<%
	}

%>
	<body>
		<div data-role="page">
			<div data-role="header">
				<h1>header</h1>
			</div>  
			<div data-role="content">	
				<form action="mLoginAction.listen">
				<INPUT type="hidden" name="latitude" value="#">
         		<INPUT type="hidden" name="longitude"  value="#">
					<table style="width:100%">
						<tr>
							<td>아이디(Email)</td>
							<td><input type="text" name="username" class="username" placeholder="Username"/></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password"  name="password" class="password" placeholder="Password" /></td>
						</tr>
					</table>
					<center>
						<div data-role="controlgroup" data-type="horizontal">
							<input type="submit" value="Login" data-icon="arrow-r"/>
							<input type="reset" value="reset" data-icon="delete"/>
							<button onclick="location.replace('/mJoin.listen');">Join</button>
						</div>
					</center>
				
				</form>
			</div>
			<div data-role="footer" data-position="fixed">
				<h1>footer</h1>
			</div>
		</div>
	</body>
</html>

