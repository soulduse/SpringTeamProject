
//Ajax 글 채팅요청 처리
function chattingRequest() {
	var bbs_seq = $("#bbs_seq").attr("value");
	var email = $("#email").attr("value");
	
	$.ajax({
		url : "/ajax/chattingRequest.listen",
		type : 'POST',
		data : "email="+email+"&bbs_seq="+bbs_seq,
		success : function(response, status, request) {
			alert("채팅 요청 처리되었습니다.");
			if (response.status == 200) {
				alert("성공!");
			} else // 데이터가 없을 경우
			{
				alert("실패!");
			}
		}
	});
}