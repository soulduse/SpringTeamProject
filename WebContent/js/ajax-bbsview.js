

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


//Ajax 글 추가하기 1
function ajaxBbsList1(no) {
	
	$.ajax({
		url : "/ajax/bbsViewListAdd1.listen",
		type : 'POST',
		data : "no="+no,
		dataType: 'html',
		success : function(response, status, request) {
			if (request.status == 200) {
				var data = $(response);
				 $('#imgRootDiv1').append(data);
			}
		}
	})
}

//Ajax 글 추가하기 2
function ajaxBbsList2(no) {
	
	$.ajax({
		url : "/ajax/bbsViewListAdd2.listen",
		type : 'POST',
		data : "no="+no,
		dataType: 'html',
		success : function(response, status, request) {
			if (request.status == 200) {
				var data = $(response);
				 $('#imgRootDiv2').append(data);
			}
		}
	})
}

//Ajax 글 추가하기 3
function ajaxBbsList3(no) {	
	$.ajax({
		url : "/ajax/bbsViewListAdd3.listen",
		type : 'POST',
		data : "no="+no,
		dataType: 'html',
		success : function(response, status, request) {
			if (request.status == 200) {
				var data = $(response);
				 $('#imgRootDiv3').append(data);
			}
		}
	})
}

/*
$(function() {
	   $('.img').click(function() {
	 	 clearTbody();
	      var d = $(this).attr("src");
	      var c = $(this).attr("contents");
	      var bbs_seq = $(this).attr("name");
	      var bbs_likeCount = $(this).attr("bbs_goodCount");

	      $('.like-label').text(bbs_likeCount); // 공감 버튼 데이터 DB값 가져오기
	      $("#modalImg").attr("src", d);
	      $("#bbs_seq").attr("value", bbs_seq);
	      var modalContent = document.getElementById("modalContent");
	      modalContent.innerHTML = c;
	      
	      ajaxBbsAdd();
	   });

*/
