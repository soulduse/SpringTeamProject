

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


//Ajax 글 추가하기
function ajaxBbsList(no) {
	
	alert("넘어온 " + no);
	
	
	$.ajax({
		url : "/ajax/bbsViewListAdd.listen",
		type : 'POST',
		dataType : "xml",
		data : "no="+no,
		success : function(response, status, request) {
			if (request.status == 200) {
				alert("됐다");
			}
		}
	})
	/*
	
	///
	 var commentTableBody = $('#comment_table_body');
   // 댓글 내용
   var content = $('#comment').val();
   var bbs_seq = $('#bbs_seq').val();
   var reg_email = $('#reg_email').val();
   var reg_ip = $('#reg_ip').val();

   $.ajax({
      url : "/ajax/bbsAdd.listen",
      type : 'POST',
      dataType : "xml",
      data : "content=" + content + "&bbs_seq=" + bbs_seq + "&reg_email="
            + reg_email + "&reg_ip=" + reg_ip,
      success : function(response, status, request) {
         if (request.status == 200) {
            clearTbody(); // 내용 초기화 작업
            $(response).find('root').each(function() {
               $(response).find('items').each(function() {
                  var content = $('content', this).text();
                  var reg_date = $('reg_date', this).text();
                  var myTR = $('<TR>');
                  myTR.append("<TD>" + content + "</TD>");
                  myTR.append("<TD>" + reg_date + "</TD>");
                  myTR.append("<TD>" +
                                 "<A class='likeBtn' data-toggle='modal' data-target='.comment-delete-modal'>" +
                                 "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>" +
                                 "</A></TD>");
                  myTR.append("<TD>clover</TD>");
                  commentTableBody.append(myTR);
               })
            });
         } else // 데이터가 없을 경우
         {
            clearTbody();
         }
      }
   });
	*/
}
