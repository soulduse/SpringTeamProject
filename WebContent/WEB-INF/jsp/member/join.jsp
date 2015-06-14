<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<SCRIPT type="text/JavaScript" src="/js/jquery-2.1.3.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/join.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="/js/common.js"></SCRIPT>
<SCRIPT>

function emailChoice()
{  
	i = document.joinForm.email_kind.selectedIndex;
	var mail = document.joinForm.email_kind.options[i].value;
	document.joinForm.email_domain.value = mail;
}

function cancel()
{
	location.href = "/Login.listen";
}

</SCRIPT>
<CENTER>
   <TABLE border="1" width="700" height="500">
   
   <tr>
   
   <td>
 <CENTER>
   <TABLE>
      <TR>
         <H1>회원 가입</H1>
      </TR>
   </TABLE>

   <TABLE cellspacing="0" cellpadding="0">
      <TR><TD align="center" bgcolor="#FFFFFF" height="10"></TD></TR>
   </TABLE>

   <TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="700">
      <FORM name="joinForm" id="joinForm" action="joinResult.listen" method="post">
         
       <DIV class="box">
         <TR>
            <TD width="100" bgcolor="#CFDDFA" align="center"><B>I D(이메일)</B></TD>
            <TD bgcolor="#FFFFFF" colspan="3">
         <input type="text" name="email_id" id="email_id" class=""   style="" /> @
         <input type="text" name="email_domain" id="email_domain"  readOnly="true" class="" style="" />
         
         <select name="email_kind" id="email_kind" onChange="emailChoice();"  style="height:20px;border:1px solid #cfcfcf;color:#bfbfbf;">
           <option selected>선택</option>
           <option value="chol.com">chol.com</option>
           <option value="dreamwiz.com">dreamwiz.com</option>
           <option value="empal.com">empal.com</option>
           <option value="freechal.com">freechal.com</option>
           <option value="gmail.com">gmail.com</option>
           <option value="hanafos.com">hanafos.com</option>
           <option value="hanmail.net">hanmail.net</option>
           <option value="hanmir.com">hanmir.com</option>
           <option value="hitel.net">hitel.net</option>
           <option value="hotmail.com">hotmail.com</option>
           <option value="korea.com">korea.com</option>
           <option value="lycos.co.kr">lycos.co.kr</option>
           <option value="nate.com">nate.com</option>
           <option value="naver.com">naver.com</option>
           <option value="netian.com">netian.com</option>
           <option value="paran.com">paran.com</option>
           <option value="yahoo.com">yahoo.com</option>
           <option value="yahoo.co.kr">yahoo.co.kr</option>
         </select>

         </DIV>
          <INPUT type="button" value="중복 검사"  id="idCheckBtn" name="idCheckBtn" style="cursor:pointer">

          <INPUT type="hidden" name="idCheckFilter" value="N">
          
            <SPAN id="idCheckMessage"><br></SPAN>
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
         <select name="birthyear" >
 <%
 	for(int i=1930; i<=2015; i++)
 	{
 %>
         	<option value=<%= i %>><%=i %></option>
         	<%} %>
       </select>
         </TD>
         </TR>

         
 		
 			
      
      </FORM>
   </TABLE>
   <TABLE cellspacing="0" cellpadding="0" width="700">
      <TR><TD height="10"></TD></TR>
      <TR>
         <TD align="center">
            <INPUT type="button" value="회원가입"  id="joinBtn" style="cursor:pointer">
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