

function toggle()
{
	var heartImg = $('.heartImg');
	 var attrVal = heartImg.attr('alt');
     var likeLabel = $('.like-label').text();
     var likeCount = parseInt(likeLabel);

     if (attrVal == 'N') {
    	heartImg.attr('alt', 'Y');
        attrVal = heartImg.attr('alt');
        $('.like-label').text(likeCount+1);
        bbsLike();
     } else if (attrVal == 'Y') {
    	heartImg.attr('alt', 'N');
        attrVal = heartImg.attr('alt');
        $('.like-label').text(likeCount-1);
        bbsLike();
     }
     heartImg.toggleClass('toggle-animation');
}




//Ajax 글 공감 버튼처리
function bbsLike() {
   var likeLabel = $('.like-label');
   var likeYn = $('.heartImg').attr('alt');
   var likeValue = likeLabel.text();
   var email = $('input:hidden[name=viewEmail]').val();
   var bbs_seq = $("#bbs_seq").attr("value");
   alert(likeYn);
   $.ajax({
      url : "/ajax/bbsLikeCount.listen",
      type : 'POST',
      data : "likeValue="+likeValue+"&bbs_seq="+bbs_seq
      +"&reg_email="+email+"&bbs_good_yn="+likeYn,
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
function ajaxBbsList1(no) {
   
   $.ajax({
      url : "/ajax/bbsViewListAdd1.listen",
      type : 'POST',
      data : "no="+no,
      dataType: 'html',
      success : function(response, status, request) {
         if (request.status == 200) {
            var data = $(response);
             $('#grid').append(data);
         }
      }
   })
}


function imgClick(bbs_seq,path,save_name,bbs_goodCount,bbs_contents,email) {
      clearTbody();
      
      var src = path+"/"+save_name;
      //$('.like-label').text(bbs_likeCount); // 공감 버튼 데이터 DB값 가져오기
      $("#modalImg").attr("src",src);
      $("#bbs_seq").attr("value", bbs_seq);
      $('.like-label').text(bbs_goodCount);
      var modalContent = document.getElementById("modalContent");
      modalContent.innerHTML = bbs_contents;
      // YnFilter 사용 및 BBS Re Select
      ajaxBbsSelect(bbs_seq);
      ajaxBbsAdd();
}