<SCRIPT>

	$('#d').click(function() {
		alert($(this).attr('data-img-url'));
	    $('#myModal img').attr('src', $(this).attr('data-img-url'));
	});
</SCRIPT>
<ul>
    <li>
    <a name="d" id="d" href="#myModal" data-toggle="modal" data-img-url="http://placehold.it/200x200/dddddd/ffffff">62 Teams</a></li>
<li><a href="#myModal" data-toggle="modal" data-img-url="http://placehold.it/200x200/dddddd/ffffff&text=Hey3">5 Teams</a></li>
<li><a href="#myModal" data-toggle="modal" data-img-url="http://placehold.it/200x200/dddddd/ffffff&text=Hey4">4 Teams</a></li>
<li><a href="#myModal" data-toggle="modal" data-img-url="http://placehold.it/200x200/dddddd/ffffff&text=Hey5">3 Teams</a></li>
</ul>

<!-- Modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:800px;">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
</div>
<div class="modal-body">
    <img src="#"/>
</div>
<div class="modal-footer">
<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>