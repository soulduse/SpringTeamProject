<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<SCRIPT type="text/JavaScript" src="/js/jquery-2.1.3.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/geolocation.js"></SCRIPT>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>
<!-- <script src="js/login.js"></script>-->
<script>
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      testAPI();
    } else if (response.status === 'not_authorized') {
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '383705378499256',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.3' // use version 2.2
  });

 // FB.logout(function(response) {
  // user is now logged out
	//});

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
		var image_src = 'http://graph.facebook.com/' + response.id + '/picture';
		var email = document.getElementById('email');		
		//email.innerHTML = response.email;
		var gender = document.getElementById('gender');
		var gender2;
		if(response.gender==("male"))
		{
			gender2 = "1";
		}
		else
		{
			gender2 = "2";
		}
		var f = document.facebookJoin; 
		var date = new Date(response.birthday);
		var y = date.getFullYear();
		var email = $('[name=email]').attr("value", response.email);
		var gender = $('[name=gender]').attr("value", gender2);
		var birthyear = $('[name=birthyear]').attr("value", y);
		
		//alert($('[name=email]').attr("value"));
		f.submit();
		
    });
  }
</script>
<FORM name="facebookJoin"  method="post"  action="/facebookJoin.listen">
	<INPUT type="hidden" name="gender" value="">
	<INPUT type="hidden" name="email"  value="">
	<INPUT type="hidden" name="birthyear"  value="">
    <INPUT type="hidden" name="latitude" value="#">
	<INPUT type="hidden" name="longitude"  value="#">
	
</FORM>

<fb:login-button scope="public_profile,email,user_birthday" onlogin="checkLoginState();">
</fb:login-button>
 <!-- <a href="/Logout.listen" onclick="FB.logout();">[logout]</a><br>-->
</body>
</html>