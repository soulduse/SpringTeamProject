function ajaxBbsSelect(bbs_seq) {
	var itemImg = $('.img');
	var email = itemImg.attr('email');
	//var bbs_seq = itemImg.attr('name');

	$.ajax({
		url : "/ajax/bbsSelect.listen",
		type : 'POST',
		dataType : "xml",
		data : "bbs_seq=" + bbs_seq + "&reg_email=" + email,
		success : function(response, status, request) {
			if (request.status == 200) {
				var data = $(response);
				alert(data);
				var contents = data.find('contents').text();
			}
		}
	});
}