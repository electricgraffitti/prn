// Setup the meta type for ajax requests
// jQuery.ajaxSetup({
// 	'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
// });


$(document).everyTime(8000, function () {
  $('#banner_scroll_r').trigger('click');
});

$(document).ready(function() {
	remove_link = $('.remove_spec');
	new_remove_link = $('.remove_new_spec');
	
	amenity_remove = $('.amenity_remove');
	new_amenity_remove = $('.new_amenity_remove');
	
	remove_link.click(function() {
		$(this).mark_for_spec_destroy($(this));
	});
	
	amenity_remove.click(function() {
		$(this).mark_for_amenity_destroy($(this));
	});
	
	new_remove_link.livequery('click', function() {
		$(this).parent().remove();
	});
	
	new_amenity_remove.livequery('click', function() {
		$(this).parent().remove();
	});
});

$(document).ready(function() {
	$("#booking_submit").bind('click', function() {
		if ($("#terms_checked").is(':checked')) {
			if ($("#new_booking").valid()) {
        $("form#new_booking").submit();
      } else {
        return false;
      }
		} else {
			jAlert('You must agree to the terms.', 'Terms Agreement');
      return false;	
		}
	});
});

$(document).ready(function() {
	
	var $list = $('ul.cube_crossfade');
	var $first_li = $list.children("li:first");
	var $i_width = $first_li.width();
	var $i_height = $first_li.height();
	
	$list.cube_crossfade({
		speed : 2000,
		pause : 5000
	});
});



jQuery.fn.mark_for_spec_destroy = function(element) {
	$(element).next().val(1);
	$(element).parent().hide();
}

jQuery.fn.mark_for_amenity_destroy = function(ele) {
	$(ele).next().val(1);
	$(ele).parent().hide();
}


$(document).ready(function() {
  $('#arrival_date').datepicker({
		showButtonPanel: true
	});
	
	$('#departure_date').datepicker({
		showButtonPanel: true
	});
});

// Sets up the Datatables
$(document).ready(function() {
 usersTable = $('#users_table').dataTable({
   "bJQueryUI": true,
   "sPaginationType": "full_numbers"
 });
 bookingsTable = $('#bookings_table').dataTable({
   "bJQueryUI": true,
   "sPaginationType": "full_numbers"
 });
});


function notify(flash_message) {

 var flash_div = $("#flash");
 flash_div.html(flash_message);
 flash_div.fadeIn(400);

 setTimeout(function() {
  flash_div.fadeOut(2000,
  function() {
   flash_div.html("");
   flash_div.hide()})},
 1400);
}

$(document).ready(function() {
	$("#flash").hide();
	var flash_message = $("#flash").html().trim();
 	if(flash_message != "") {
		notify(flash_message);
	}
});


