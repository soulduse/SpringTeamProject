<!DOCTYPE html> 
<html> 
	<head>
		<title>jQuery Mobile</title>
		<meta charset="euc-kr" /> 	
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		
		<link rel="shortcut icon" href="../image/icon.png">
		<link rel="apple-touch-icon" href="../image/icon.png">
		
		<link href="../framework/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
		<script src="../framework/jquery-1.6.4.js"></script>
		<script src="../framework/jquery.mobile-1.0.js"></script>
	</head> 

	<body>
		<div data-role="page">
			<div data-role="header">
				<h1>header</h1>
			</div>  
			<div data-role="content">	
				<form>
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
							<input type="submit" value="submit" data-icon="arrow-r"/>
							<input type="reset" value="reset" data-icon="delete"/>
						</div>
					</center>
			
				</form>
			</div>
		</div>
	</body>
</html>

