/*
 * alerts.js
 *
 * Support JavaScript for alert messages displayed in the UI.
 */

$(document).ready(function() {

  // Add click handlers to the close buttons.
  $('.alert a.close').live('click', function(e) {
    e.preventDefault();
    var closeButton = $(e.target);
    var alertContainer = closeButton.closest('.alert');
    alertContainer.remove();
  });

});
