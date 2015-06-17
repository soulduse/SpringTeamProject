function ajaxBbsSelect() {
	var itemImg = $('.img');
	var email = itemImg.attr('email');
	var bbs_seq = itemImg.attr('name');

	$.ajax({
		url : "/ajax/bbsSelect.listen",
		type : 'POST',
		dataType : "html",
		data : "bbs_seq=" + bbs_seq + "&reg_email=" + email,
		success : function(response, status, request) {
			if (request.status == 200) 
			{
				
			}
		}
	});
}