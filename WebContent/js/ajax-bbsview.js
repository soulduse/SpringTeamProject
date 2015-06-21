
function toggle() {
	var heartImg = $('.heartImg');
	var attrVal = heartImg.attr('alt');
	var likeLabel = $('.like-label').text();
	var likeCount = parseInt(likeLabel);

	if (attrVal == 'N') {
		heartImg.attr('alt', 'Y');
		attrVal = heartImg.attr('alt');
		$('.like-label').text(likeCount + 1);
		bbsLike();
	} else if (attrVal == 'Y') {
		heartImg.attr('alt', 'N');
		attrVal = heartImg.attr('alt');
		$('.like-label').text(likeCount - 1);
		bbsLike();
	}
	heartImg.toggleClass('toggle-animation');
}



$(function(){
	
});

// Ajax 글 공감 버튼처리
function bbsLike() {
	var likeLabel = $('.like-label');
	var likeYn = $('.heartImg').attr('alt');
	var likeValue = likeLabel.text();
	var email = $('input:hidden[name=viewEmail]').val();
	var bbs_seq = $("#bbs_seq").attr("value");
	$.ajax({
		url : "/ajax/bbsLikeCount.listen",
		type : 'POST',
		data : "likeValue=" + likeValue + "&bbs_seq=" + bbs_seq + "&reg_email="
				+ email + "&bbs_good_yn=" + likeYn,
		success : function(response, status, request) {
			if (response.status == 200) {
				//alert("성공!");
			} else // 데이터가 없을 경우
			{
				//alert("실패!");
			}
		}
	});
	/*
   var likeLabel = $('.like-label');
   var likeYn = $('.heartImg').attr('alt');
   var likeValue = likeLabel.text();
   var email = $('input:hidden[name=viewEmail]').val();
   var bbs_seq = $("#bbs_seq").attr("value");
   
   $.ajax({
      url : "/ajax/bbsLikeCount.listen",
      type : 'POST',
      data : "likeValue="+likeValue+"&bbs_seq="+bbs_seq
      +"&reg_email="+email+"&bbs_good_yn="+likeYn,
      success : function(response, status, request) {
         if (response.status == 200) {
            
         } else // 데이터가 없을 경우
         {
           
         }
         if(likeYn=='N')
         {
            $('.img[name='+bbs_seq+']').attr('bbs_good_yn', 'N');
            var summary = $('.text2_1[name='+bbs_seq+']').html();
            summary=$.trim(summary);
            var split=summary.split(' ');
            var cnt3=split[5];
            cnt3=(cnt3*1)-1;
            var splitafter=split[0]+' '+split[1]+' '+split[2]+' '+split[3]+' '+split[4]+' '+cnt3+' '+split[6]+' '+split[7]+' '+split[8];
            $('.text2_1[name='+bbs_seq+']').html(splitafter);
            $('.img[name='+bbs_seq+']').attr('bbs_goodCount', cnt3);
         
         }
         else if(likeYn=='Y')
         {
            $('.img[name='+bbs_seq+']').attr('bbs_good_yn', 'Y');
            var summary = $('.text2_1[name='+bbs_seq+']').html();
            summary=$.trim(summary);
            var split=summary.split(' ');
            var cnt3=split[5];
            cnt3=(cnt3*1)+1;
            var splitafter=split[0]+' '+split[1]+' '+split[2]+' '+split[3]+' '+split[4]+' '+cnt3+' '+split[6]+' '+split[7]+' '+split[8];
            $('.text2_1[name='+bbs_seq+']').html(splitafter);
            $('.img[name='+bbs_seq+']').attr('bbs_goodCount', cnt3);
         }
      },
      error : function(){
         alert('fail');
      }
   });
   */
}

// Ajax 글 추가하기
function ajaxBbsList1(no) {

	$.ajax({
		url : "/ajax/bbsViewListAdd1.listen",
		type : 'POST',
		data : "no=" + no,
		dataType : 'html',
		success : function(response, status, request) {
			if (request.status == 200) {
				var data = $(response);
				$('#grid').append(data);
			}
		}
	})
}

function imgClick(bbs_seq) {
	clearTbody();
	// YnFilter 사용 및 BBS Re Select
	var bbsSeqVal = $('input:hidden[name=bbs_seqVal]').val(bbs_seq);
	ajaxBbsSelect(bbs_seq);
	ajaxBbsAdd($('input:hidden[name=bbs_seqVal]').val());
}
