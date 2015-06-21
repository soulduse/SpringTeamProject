function ajaxBbsSelect(bbs_seq) {
	var email = $('input:hidden[name=viewEmail]').val();
	// var bbs_seq = itemImg.attr('name');
	// alert("bbs_seq : "+bbs_seq+"\n email : "+email);

	$.ajax({
		url : "/ajax/bbsSelect.listen",
		type : 'POST',
		dataType : "xml",
		data : "bbs_seq=" + bbs_seq + "&reg_email=" + email,
		success : function(response, status, request) {
			if (request.status == 200) {
				$(response).find('items').each(function() {
					var result_bbs_seq = $('bbs_seq', this).text();
					var bg_img_seq = $('bg_img_seq', this).text();
					var members_seq = $('members_seq', this).text();
					var hitcount = $('hitcount', this).text();
					var goodcount = $('goodcount', this).text();
					var add_count = $('add_count', this).text();
					var bbs_add_good_yn = $('addgoodyn', this).text();
					var bbs_good_yn = $('goodyn', this).text();
					var path = $('path', this).text();
					var save_name = $('savename', this).text();
					var content = $('content', this).text();
					var reg_date = $('reg_date', this).text();
					
					var src = path + "/" + save_name;
					$("#modalImg").attr("src", src);
					$("#bbs_seq").attr("value", result_bbs_seq);
					$('.like-label').text(goodcount);
					$('#note-count').text(add_count);
					$('#modalContent').text(content);
					
					var heartImg = $('.heartImg');
					 if (bbs_good_yn == "Y") {
						heartImg.attr('alt', 'Y');
						heartImg.addClass('toggle-animation');
					} else {
						heartImg.attr('alt', 'N');
						heartImg.removeClass('toggle-animation');
					}
				});
			}
		}
	});

}