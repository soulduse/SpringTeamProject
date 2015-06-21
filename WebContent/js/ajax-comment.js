// Ajax 댓글 처리 function
function ajaxBbsAdd() {

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
                  var bbs_add_seq = $('bbs_add_seq', this).text();
                  commentTableBody.append(
		                		  '<li class="list-group-item note-item clearfix" id="note-954059">'+
                          '<form action="/content/update/954059" method="post" data-id="954059" class="note-update-form"><input type="hidden" name="_method" value="PUT" id="_method">'+
                              '<div class="content-body panel-body pull-left">'+
                                          
                                              '<div class="note-select-indicator note-deselected">'+
                                                  '<i class="fa fa-comment"></i>'+
                                              '</div>'+
                                          
                                  '<div class="avatar avatar-medium clearfix ">'+
                                  '<span class="glyphicon glyphicon-time" aria-hidden="true"></span></div><div class="date-created timeago">'+reg_date+'</div></div></div>'+
                                 ' <fieldset class="form">'+
                                      '<article id="note-text-954059" class="list-group-item-text note-text">'+
                                              '<p>'+content+'</p>'+
                                      '</article>'+
                                  '</fieldset>'+
                              '</div>'+

                              '<div class="content-function pull-right text-center">'+
                                  '<div class="content-function-group">'+
                                  	'<div class="container-title animation-1">'+
										'<div class="heartImg" alt="N" name="'+bbs_add_seq+'" onclick="cloverClick('+bbs_add_seq+');"></div>'+
									'</div>'+
                                  '</div>'+
                              '</div>'+

                          '</form>'+

                          '<form action="/content/delete/954059" method="post" id="note-delete-form-954059"><input type="hidden" name="_method" value="DELETE" id="_method">'+
                          '</form>'+
                      '</li>'
                  );
               })
            });
         } else // 데이터가 없을 경우
         {
            clearTbody();
         }
      }
   });
}

// Ajax 모바일 댓글 처리 function
function m_ajaxBbsAdd() {

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
}

// 클로버 클릭시 INSERT & UPDATE
function cloverClick(bbs_add_seq) {
	var heartImg = $('.heartImg[name='+bbs_add_seq+']');
	var email = $('input:hidden[name=viewEmail]').val();
	var attrVal = heartImg.attr('alt');
	if (attrVal == 'N') {
		heartImg.attr('alt', 'Y');
		
		$.ajax({
		      url : "/ajax/bbsAddGood.listen",
		      type : 'POST',
		      dataType : "xml",
		      data : "bbs_add_seq=" + bbs_add_seq+"&reg_email="+email,
		      success : function(response, status, request) {
		         if (request.status == 200) {
		        	 
		         }
		      }
		});
		
		
		heartImg.addClass('toggle-animation');
	}
}



// 댓글테이블 초기화
function clearTbody() {
   var commentTableBody = $('#comment_table_body');
   $('#comment').val("");
   commentTableBody.empty();
}