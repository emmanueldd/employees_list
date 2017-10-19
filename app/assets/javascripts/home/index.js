'use strict';

App.home = App.home || {};
App.home.index = {
	init: function init() {
    $('#cta-header').click(function(){
      $('#lead_email').focus();
      return false;
    });
  },
};
