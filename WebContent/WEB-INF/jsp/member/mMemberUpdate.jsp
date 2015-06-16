<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<SCRIPT type="text/JavaScript" src="/js/jquery-2.1.3.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/join.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/common.js"></SCRIPT>
<SCRIPT type="text/Javascript" src="http://maps.google.com/maps/api/js-sensor=true"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/geolocation.js"></SCRIPT>
<SCRIPT>

function emailChoice()
{  
	i = document.joinForm.email_kind.selectedIndex;
	var mail = document.joinForm.email_kind.options[i].value;
	document.joinForm.email_domain.value = mail;
}

function cancel()
{
	location.href = "/mMain.listen";
}

</SCRIPT>

<CENTER>
   <TABLE border="1" width="700" height="500">
   
   <tr>
   
   <td>
 <CENTER>
   <TABLE>
      <TR>
         <H1>정보 수정</H1>
      </TR>
   </TABLE>

   <TABLE cellspacing="0" cellpadding="0">
      <TR><TD align="center" bgcolor="#FFFFFF" height="10"></TD></TR>
   </TABLE>

   <TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="700">
      <FORM name="joinForm" id="joinForm" action="mUpdate.listen" method="post">

       <DIV class="box">
         <TR>
            <TD width="100" bgcolor="#CFDDFA" align="center"><B>I D(이메일)</B></TD>
            <TD bgcolor="#FFFFFF" colspan="3">
			<%=session.getAttribute("email") %>
			<INPUT type="hidden" name="updateFilter" value="Y">
          <INPUT type="hidden" name="idCheckFilter" value="Y">
        
         </TD>
         </TR>
         <tr>
         	<TD width="100" bgcolor="#CFDDFA" align="center"><B>비밀번호</B></TD>
         	<TD bgcolor="#FFFFFF" colspan="2">
         	 <input type="password" name="password" id="password"  />
         	 </TD>
         </tr>
       	 <TR>
 			<TD width="100" bgcolor="#CFDDFA" align="center"><B>성별</B></TD>
 			<TD bgcolor="#FFFFFF" colspan="2">
 		<input type="radio"  name="gender" value="01">남
 		<input type="radio"  name="gender" value="02">여
 		</TD>
 		</TR>
 		<TR>
 			<TD width="100" bgcolor="#CFDDFA" align="center"><B>출생년도</B></TD>
            <TD bgcolor="#FFFFFF" colspan="2">
            <div data-role="fieldcontain">
            <!-- <label for="birthyear">출생년도</label> 책 예제--> 
         <select name="birthyear" >
 <%
 	for(int i=1930; i<=2015; i++)
 	{
 %>
         	<option value=<%= i %>><%=i %></option>
         	<%} %>
       </select>
       </div>
         </TD>
         </TR>

         
 		
 			
      
      </FORM>
   </TABLE>
   <TABLE cellspacing="0" cellpadding="0" width="700">
      <TR><TD height="10"></TD></TR>
      <TR>
         <TD align="center">
            <INPUT type="button" value="정보수정"  id="joinBtn" style="cursor:pointer">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <INPUT type="reset" value="취소" id="cancelBtn" onclick="cancel();" style="cursor:pointer">
         </TD>
      </TR>
   </TABLE>

   <TABLE cellspacing="0" cellpadding="0">
      <TR><TD align="center" bgcolor="#FFFFFF" height="20"></TD></TR>
   </TABLE>
   </CENTER>
   </td>
   </tr>
 </TABLE>
</CENTER>