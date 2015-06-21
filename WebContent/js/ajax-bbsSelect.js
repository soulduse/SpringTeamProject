function ajaxBbsSelect(bbs_seq) {
	var email = $('input:hidden[name=viewEmail]').val();
	//var bbs_seq = itemImg.attr('name');
	//alert("bbs_seq : "+bbs_seq+"\n email : "+email);
	

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