$(function(){
	var joinForm = $("#joinForm");
	var idCheckM = $("#idCheckMessage");
	var latitude;
	var longitude;
	if(emailId !== "")
	{
		var emailId = $('#email_id').val();
		var emailDomain = $('#email_domain').val();
		var realId = emailId + "@" + emailDomain;
	}


	$('#idCheckBtn').click(function(){
		idCheckAction();		
	});
	
	function idCheckAction(){
	      // id값 체크
		emailId = $('#email_id').val();
		emailDomain = $('#email_domain').val();
		realId = emailId + "@" + emailDomain;
		
		
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
	            idCheckM.html(resultMessage);

	         }
	      }); 
	   }
	$('#joinBtn').click(function(){
		joinCheck();		
		
	});
	function joinCheck()
	{
		var lati = $('input:hidden[name=latitude]').val();
		var longi = $('input:hidden[name=longitude]').val();
		var f = $("#joinForm");
		var emailId2 = $('input:text[name=email_id]').val();
		var emailDomain2 = $('input:text[name=email_domain]').val();
		var realId2 = emailId2 + "@" + emailDomain2;
		var birthyear = $('[name=birthyear]').val();
		var gender = $('input:radio[name=gender]:checked').val();
		var password = $('input:password[name=password]').val();
	
		//alert(emailId + emailDomain + realId + birthyear + gender);
		if(gender==="01")
		{
			gender="1";

		}
		else if(gender==="02")
		{
			gender="2";

		}
		
		if(emailId2 === "" || emailDomain2 === "")
		{
			alert("ID(email) 입력하세요");
			return false;
		}
		else if($('input:password[name=password]').val() =="")
		{
			alert("비밀번호를 입력해주세요");
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
		
		else if($('input:hidden[name=updateFilter]').val() =="Y")
		{
			alert("정보수정이 완료되었습니다");
			f.submit();
		}
		else 
		{
			alert("회원가입이 완료되었습니다");
			f.submit();
		}			
		
	}
	
});
