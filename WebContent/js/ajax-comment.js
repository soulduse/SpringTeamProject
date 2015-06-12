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

// 댓글테이블 초기화
function clearTbody() {
   var commentTableBody = $('#comment_table_body');
   $('#comment').val("");
   commentTableBody.empty();
}