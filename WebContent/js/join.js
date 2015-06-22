$(function(){
	var joinForm = $("#joinForm");
	var idCheckM = $("#idCheckMessage");
	var latitude;
	var longitude;
	var emailId;
	var emailDomain;
	var realId = emailId + "@" + emailDomain;
	

/*	if(emailId !== "")
	{
		emailId = $('#email_id').val();
		emailDomain = $('#email_domain').find(':selected').val();
		var realId = emailId + "@" + emailDomain;
	}
*/
	$( function(){

		 $( "#email_id" ).keydown(function(event) {

		  if( event.shiftKey) 
			 {
			  alert("특수문자x");
			 }
		 });

		});

	$('#idCheckBtn').click(function(){
		idCheckAction();		
	});
	
	function idCheckAction(){
	      // id값 체크
		emailId = $('#email_id').val();
		emailDomain = $('#email_domain').find(':selected').val();
		realId = emailId + "@" + emailDomain;
		$('input:hidden[name=realId]').val(realId);
		if(emailId == "" || emailDomain == "")
		{
			alert("입력된 값이 없습니다");
			return false;
		}
		

		
	      $.ajax({
	         type: "POST",
	         url: "/emailCheck.listen",
	         dataType: "text",
	         data: "realId=" + realId, 
	         success: function(text)
	         {
	            var resultText = trim(text);
	            var resultArr = resultText.split("^");
	            var resultCode = resultArr[0];
	            var resultId = resultArr[1];
	            var resultMessage = "'<FONT color='red'>" + resultId + "</FONT>' 는 " + resultArr[2];
	            
	            if(resultCode=="1")
	            {
	        		$("input:hidden[name=idCheckFilter]").val("Y");
	            }
	            else
	            {
	            	$("input:hidden[name=idCheckFilter]").val("F");
	            }
	            alert(resultId + "는 " + resultArr[2])
	         }
	      }); 
	   }
	$('#joinBtn').click(function(){
		joinCheck();		
		
	});
	function joinCheck()
	{
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var lati = $('input:hidden[name=latitude]').val();
		var longi = $('input:hidden[name=longitude]').val();
		var f = $("#joinForm");	

		var emailId2 = $('input:text[name=email_id]').val();
		var emailDomain2 = $('#email_domain').find(':selected').val();
		
		var realId2 = emailId2 + "@" + emailDomain2;

		var birthyear = $('[name=birthyear]').val();
		var gender = $('input:radio[name=gender]:checked').val();
		var password = $('input:password[name=password]').val();
		var updateFilter = $('input:hidden[name=updateFilter]').val();
		
		if(gender==="01")
		{
			gender="1";

		}
		else if(gender==="02")
		{
			gender="2";

		}
		if(updateFilter =="Y")
		{
			if(password == "")
			{
				alert("비밀번호를 입력해주세요");
				return false;
			}
	
			else if(gender  != "1" && gender != "2")
			{
				alert(gender);
				alert("성별을 체크하세요");
				return false;
			}
			
			else
			{
				alert("정보수정이 완료되었습니다");
				f.submit();
			}
		}
		
		else
		{
			if(emailId2 === "" || emailDomain2 === "")
			{
				alert("ID(email) 입력하세요");
				return false;
			}
			else if(re.test(emailId) || re.test(emailId2))
			{
				$("#email_id").val(emailId.replace(re,"")); 
				alert("특수문자는 입력할수 없습니다");
				return false;
			} 
			else if(password == "")
			{
				alert("비밀번호를 입력해주세요");
				return false;
			}
			else if(password.length <= 3)
			{
				alert("비밀번호는 최소 4자이상 입력해야합니다");
				return false;
			}
			else if(gender  != "1" && gender != "2")
			{
				alert("성별을 체크하세요");
				return false;
			}
			else if($('input:hidden[name=idCheckFilter]').val() === "N")
			{
				alert("ID중복 확인해주세요");
				//checkId = emailId + "@" + emailDomain;
				//alert(checkId);
				return false;
			}
			
			else if($('input:hidden[name=idCheckFilter]').val() == "F")
			{
				alert("중복된 아이디로는 가입할 수 없습니다");
				return false;
			}
			else if(realId !== realId2)
			{
				alert("아이디를 확인해주세요");
				return false;
			}
			
			else 
			{
				alert("회원가입이 완료되었습니다");
				f.submit();
			}		
		}
		
	}
	
});