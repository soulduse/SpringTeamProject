	var commentList;
	// Ajax 댓글 처리 function
	function ajaxBbsAdd()
	{
		// 댓글이 위치할 Table
		commentList = $('.comment-list');
		
		// 댓글 내용
		var content = $('#comment').val();
		var bbs_seq = $('#bbs_seq').val();
		var reg_email = $('#reg_email').val();
		var reg_ip = $('#reg_ip').val();
		
		alert("내용 : "+ content);
		alert("bbs_seq : " + bbs_seq);
		alert("reg_email : "+reg_email);
		alert("reg_ip : "+ reg_ip);
		
		$.ajax({
			url:"/bbsAdd.listen",
			type:'POST',
			dataType: "xml",
			data: "content="+content+"&bbs_seq="+bbs_seq+"&reg_email="+reg_email+"&reg_ip="+reg_ip,
			success: function(response, status, request)
			{
				if(request.status == 200)
				{
					alert("입력성공!");
					/*
					$(response).find('content').each(function(){
						var nextNode = $(this).text();
						var commentContent = $('.comment-content').text(nextNode);
						commentList.append(commentContent);
					});
					
					$(response).find('reg_date').each(function(){
						var nextNode = $(this).text();
						var commentTime = $('.comment-time').text(nextNode);
						commentList.append(commentTime);
					});
					*/
				}
				else	// 데이터가 없을 경우
				{
					alert("댓글이 존재하지 않습니다.");
				}
			}
		});
	}