

// 좋아요 버튼 클릭 이벤트
$(document).ready(function() {
	$('.animation-1 .heartImg').on('click', function() {
		var attrVal = $(this).attr('alt');
		var likeLabel = $('.like-label').text();
		var likeCount = parseInt(likeLabel);

		if (attrVal == '0') {
			$(this).attr('alt', '1');
			attrVal = $(this).attr('alt');
			$('.like-label').text(likeCount+1);
			bbsLike();
		} else if (attrVal == '1') {
			$(this).attr('alt', '0');
			attrVal = $(this).attr('alt');
			$('.like-label').text(likeCount-1);
			bbsLike();
		}
		// 애니메이션 효과 css 넣어줌.
		$(this).toggleClass('toggle-animation');
	});
});


//Ajax 글 공감 버튼처리
function bbsLike() {
	alert();
	//var likeSw = $('.animation-1 .heartImg').attr('alt');
	var likeValue = $('.like-label').text();
	var bbs_seq = $("#bbs_seq").attr("value");

	$.ajax({
		url : "/ajax/bbsLikeCount.listen",
		type : 'POST',
		data : "likeValue="+likeValue+"&bbs_seq="+bbs_seq,
		success : function(response, status, request) {
			if (response.status == 200) {
				alert("성공!");
			} else // 데이터가 없을 경우
			{
				alert("실패!");
			}
		}
	});
}

