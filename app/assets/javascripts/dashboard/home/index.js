'use strict';

App.dashboard = App.dashboard || {};
App.dashboard.index = {
	init: function init() {
		$(".datepicker").on("change",function(){
      var selected = $(this).val();
			$.ajax({
        url: '/pros/1/availabilities',
        data: {date: selected},
        contentType: 'application/json',
        dataType: 'json',
        success: function(data) {
          alert(data);
        }
      });
	  });
  },
};
