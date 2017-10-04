this.App || (this.App = {});

$( document ).on('turbolinks:load', function() {
  controller = $("body").data("controller")
  action = $("body").data("action")

  $('.datepicker').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $(".switch-btn").bootstrapSwitch();

  if ((typeof(App[controller]) === 'object') &&
     (typeof(App[controller][action]) === 'object')) {
    App[controller][action].init();
  }


});
