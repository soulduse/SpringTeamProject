<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta name="keywords" content="button styles, css3, modern, flat button, subtle, effects, hover, web design" />
<link rel="stylesheet" type="text/css" href="css/join.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
<SCRIPT>
function overLap()
{
	location.href = "/memberUpdate.listen";	
}
function cancel()
{
	location.href	= "/main.listen";
}
</SCRIPT>

<CENTER>
<TABLE cellspacing="1" cellpadding="5" bgcolor="#E5E5E5" width="250" >
		<TR>
			<TD align="center" bgcolor="#f9f9f9" width="250">
			<CENTER>
				<FONT color="Black" size="3"><B>내 정보</B></FONT>
			</CENTER></TD>
		</TR>
	</TABLE>
	<BR>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#000000" width="500">
		<TR>
			<TD width="100" bgcolor="#E5E5E5" align="center"><B>I D(Email)</B></TD>
			<TD bgcolor="#FFFFFF" colspan="2"><%= request.getAttribute("email")%></TD>
		</TR>
		<TR>
			<TD bgcolor="#E5E5E5" align="center"><B>비밀번호</B></TD>
			<TD bgcolor="#FFFFFF" colspan="2"><B><%= request.getAttribute("password")%></B></TD>
		</TR>
		<TR>
			<TD bgcolor="#E5E5E5" align="center"><B>성 별</B></TD>
			<TD bgcolor="#FFFFFF" colspan="2"><%= request.getAttribute("gender")%> </TD>
		</TR>
		<TR>
			<TD bgcolor="#E5E5E5" align="center"><B>출생년도</B></TD>
			<TD bgcolor="#FFFFFF" colspan="2"><%= request.getAttribute("birthyear")%>년 </TD>
		</TR>
	</TABLE>
<br><br><!-- 
	<input type="button" value="정보수정하기"  onclick=overLap();>
	<input type="button" value="전으로"  onclick=cancel();>
	-->
	<section clas="color-7" id="btn-click">
	 <button class ="btn btn-7 btn-7h icon-envelope" id="joinBtn" style="cursor:pointer" onclick="overLap();">정보수정하기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class ="btn btn-7 btn-7h icon-envelope" id="cancelBtn" onclick="cancel();" style="cursor:pointer">취소</button>
		</section>
		</CENTER>
		<script src="js/classie.js"></script>
		<SCRIPT>
		var buttons7Click = Array.prototype.slice.call( document.querySelectorAll( '#btn-click button' ) ),
		buttons9Click = Array.prototype.slice.call( document.querySelectorAll( 'button.btn-8g' ) ),
		totalButtons7Click = buttons7Click.length,
		totalButtons9Click = buttons9Click.length;

	buttons7Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
	buttons9Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );

		
		function activate() {
			var self = this, activatedClass = 'btn-activated';

			if( classie.has( this, 'btn-7h' ) ) {
				// if it is the first of the two btn-7h then activatedClass = 'btn-error';
				// if it is the second then activatedClass = 'btn-success'
				activatedClass = buttons7Click.indexOf( this ) === totalButtons7Click-2 ? 'btn-error' : 'btn-success';
			}
			else if( classie.has( this, 'btn-8g' ) ) {
				// if it is the first of the two btn-8g then activatedClass = 'btn-success3d';
				// if it is the second then activatedClass = 'btn-error3d'
				activatedClass = buttons9Click.indexOf( this ) === totalButtons9Click-2 ? 'btn-success3d' : 'btn-error3d';
			}

			if( !classie.has( this, activatedClass ) ) {
				classie.add( this, activatedClass );
				setTimeout( function() { classie.remove( self, activatedClass ) }, 1000 );
			}
		}

		document.querySelector( '.btn-7i' ).addEventListener( 'click', function() {
			classie.add( document.querySelector( '#trash-effect' ), 'trash-effect-active' );
		}, false );
	</script>
		</SCRIPT>
