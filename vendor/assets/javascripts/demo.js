/*
 * demo.js
 *
 * JavaScript enhancing the UI demo.
 */

$(document).ready(function() {

  // jQuery UI accordion.
  $('#jquery-ui-accordion').accordion();

  // jQuery UI buttons.
  $('input:submit, a, button', '#jquery-ui-buttons').button();
  $('a', '#jquery-ui-buttons').click(function() { return false; });

  // jQuery UI datepicker.
  $('#jquery-ui-datepicker input#jquery_ui_datepicker_input').datepicker();

  // jQuery UI dialog.
  $('#jquery_ui_dialog').dialog({
    autoOpen: false,
    width: 600,
    buttons: {
      "Ok": function() {
        $(this).dialog('close');
      },
      "Cancel": function() {
        $(this).dialog('close');
      }
    }
  });
  $('#jquery_ui_modal_dialog').dialog({
    autoOpen: false,
    modal: true,
    buttons: {
      "Ok": function() {
        $(this).dialog('close');
      }
    }
  });

  $('#jquery-ui-dialog #jquery-ui-open-dialog').button({ icons: { primary: 'ui-icon-newwin' } });
  $('#jquery-ui-dialog #jquery-ui-open-dialog').click(function() {
    $('#jquery_ui_dialog').dialog('open');
    return false;
  });

  $('#jquery-ui-dialog #jquery-ui-open-modal-dialog').button({ icons: { primary: 'ui-icon-newwin' } });
  $('#jquery-ui-dialog #jquery-ui-open-modal-dialog').click(function() {
    $('#jquery_ui_modal_dialog').dialog('open');
    return false;
  });

  // jQuery UI progress bar.
  $('#jquery-ui-progressbar').progressbar({
    value: 35
  });

  // jQuery UI slider.
  $('#jquery-ui-slider').slider({
    range: true,
    values: [17, 67]
  });

  // jQuery UI tabs.
  $('#jquery-ui-tabs').tabs();

});
