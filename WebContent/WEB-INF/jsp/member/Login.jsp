<%@ page contentType="text/html;charset=euc-kr"%>
<!DOCTYPE html>
<html class="no-js">

    <head>
        <meta charset="utf-8">
        <title>마음이 따뜻해지는 익명SNS - Listen</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/login.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

		<SCRIPT type="text/javascript">
			 var loginFrom = dcument.loginFrom;
			 var filter = "win16|win32|win64|mac";
			
			 if( navigator.platform  )
			 {
			 	if( filter.indexOf(navigator.platform.toLowerCase())<0 )
			 	{
			   		alert("모바일 기기에서 접속");
			   		// 아래 주소로 이동한다.
			   		loginFrom.action = "/m_loginAction.listen";
			  
			  	}else{
			   		//alert("PC에서 접속");
			   		 loginFrom.action = "/loginAction.listen";
			  	}
			}
		</SCRIPT>
    <body>

        <div class="page-container">
            <h1>Login</h1>
            
            <form name="loginFrom" action="loginAction.listen" method="post">
                <INPUT type="hidden" name="latitude" value="#">
         		<INPUT type="hidden" name="longitude"  value="#">
                <input type="text" name="username" class="username" placeholder="Username">
                <input type="password" name="password" class="password" placeholder="Password">
                <button type="submit" class="basicBtn">Sign me in</button>
                <button type="button"  class="basicBtn" onclick="location.href='/join.listen'"> Join </button>
					<button type="button"  id="facebookBtn"> Facebook </button>      
                <div class="error"><span>+</span></div>
            </form>
            
        </div>

        <!-- Javascript -->
        <script src="js/geolocation.js"></script>
        <script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
        <script src="js/scripts.js"></script>


    </body>

</html>


