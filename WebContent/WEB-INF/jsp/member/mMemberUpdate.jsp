<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Simple ideas for enhancing text input interactions" />
<meta name="keywords" content="button styles, css3, modern, flat button, subtle, effects, hover, web design, animated checkbox, svg, radio button, styled checkbox, css, pseudo element, form, animated svg" />
<SCRIPT type="text/JavaScript" src="/js/jquery-2.1.3.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/join.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/common.js"></SCRIPT>
<SCRIPT type="text/Javascript" src="http://maps.google.com/maps/api/js-sensor=true"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/geolocation.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="css/join.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/cs-select.css" />
<link rel="stylesheet" type="text/css" href="css/cs-skin-slide.css" />
<script src="js/svgcheckbx.js"></script>
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<SCRIPT>

function emailChoice()
{  
	i = document.joinForm.email_domain.selectedIndex;
	var mail = document.joinForm.email_domain.options[i].value;
	document.joinForm.email_kind.value = mail;
}

function cancel()
{
	location.href = "/mMain.listen";
}

</SCRIPT>

 <CENTER>
 	<H1>정보 수정</H1>

   <TABLE cellspacing="1" cellpadding="5" bgcolor="#000" width="700">
      <FORM name="joinForm" id="joinForm" action="mUpdate.listen" method="post">
<section class="content">
       <span class="input input--hoshi">
         <input type="text" name="email_id" id="email_id" class="input__field input__field--hoshi"   style="" /> 
         
        
		<span class="input__label-content input__label-content--hoshi"><%=session.getAttribute("email")  %></span>
	
	</label>
	</span>
	
	</section>
	

			<section class="color-7" id="btn-click">
				<p>
					<!-- <button class="btn btn-7 btn-7b icon-envelope" name="idCheckBtn" id="idCheckBtn" style="cursor:pointer">Check</button>-->
				</p>
			</section>
          <INPUT type="hidden" name="latitude" value="#">
          <INPUT type="hidden" name="longitude"  value="#">
  		<input type="hidden" name="updateFilter" value="Y">        
     
         <span class="input input--hoshi">
        
         	 <input type="password" name="password" id="password"  class="input__field input__field--hoshi"/>
         	 <label class="input__label input__label--hoshi input__label--hoshi-color-2" for="input-5">
			<span class="input__label-content input__label-content--hoshi">Password</span>
	</label>
</span>
  
<div>
<B>성별&nbsp;&nbsp;</B></TD>
		<input type="radio"  id="gender" name="gender" value="01">남
 		<input type="radio"  id="gender" name="gender" value="02">여<br><br>

</div>
<div>
        		출생년도 <select name="birthyear" >
 <%
 	for(int i=1930; i<=2015; i++)
 	{
 %>
         		<option value=<%= i %>><%=i %></option>
         		<%} %>
       		</select>
	
	</div>
		<script src="js/classie.js"></script>
		<script src="js/selectFx.js"></script>
		<script>
			(function() {
				[].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {	
					new SelectFx(el);
				} );
			})();
		</script>

      </FORM>
   </TABLE>
   <TABLE cellspacing="0" cellpadding="0" width="700">
      <TR><TD height="10"></TD></TR>
      <TR>
         <TD align="left">
            <button class ="btn btn-7 btn-7h icon-envelope" id="joinBtn" style="cursor:pointer">Submit</button>
            &nbsp;&nbsp;&nbsp;&nbsp;<br><br>
            <button class ="btn btn-7 btn-7h icon-envelope" id="cancelBtn" onclick="cancel();" style="cursor:pointer">Cancel</button>
         </TD>
      </TR>
   </TABLE>

   </td>
   </tr>

</CENTER>

<script src="js/classie.js"></script>
		<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
		</script>
		<script>
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

		</script>