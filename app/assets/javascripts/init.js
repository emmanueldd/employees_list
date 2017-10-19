this.App || (this.App = {});

$( document ).on('turbolinks:load', function() {
  controller = $("body").data("controller")
  if ($("body").data("namespace") !== undefined) {
    controller = $("body").data("namespace") + '_' + controller;
  }
  action = $("body").data("action")

  $('.datepicker').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $(".switch-btn").bootstrapSwitch();

  if ((typeof(App[controller]) === 'object') && (typeof(App[controller][action]) === 'object')) {
    App[controller][action].init();
  }

  $('form').validate();
  // alert('test');
  //
  // if ((typeof(App[controller]) === 'object') && (typeof(App[controller][action]) === 'object')) {
  //   if (namespace == controller) {
  //     alert('if');
  //     App[controller][action].init();
  //   } else {
  //     alert('else');
  //     App[namespace + '_' + controller][action].init();
  //   }
  // }



});
