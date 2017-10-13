'use strict';

App.dashboard_bookings = App.dashboard_bookings || {};
App.dashboard_bookings.index = {
	init: function init() {
    $('#modalSelectCalendar').on('shown.bs.modal', function() {
      var calendar_list = $('#calendar-list');
      if (calendar_list.is(':empty')){
        $.ajax({
          url: '/dashboard/bookings/select_calendar',
          contentType: 'application/json',
          dataType: 'json',
          success: function(data) {
            data.items.forEach( function(item) {
              if (item.accessRole == 'owner') {
                calendar_list.append(
                  '<input id="user_options_' + item.id + '" name="pro[calendar_id]" type="radio" value="' + item.id + '" />' +
                '<label class="collection_radio_buttons" for="user_options_' + item.id + '">' + item.summary + '</label>'
                );
              }
            });
          }
        });
      }
    });
  },
};
