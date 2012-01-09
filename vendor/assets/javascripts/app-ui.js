/*
 * app-ui.js
 *
 * Support JavaScript for the basic application UI.
 */

$(document).ready(function() {

  // Add has-content-details and has-content-sidebar classes to the content
  // article element if content details and/or a sidebar is present in the DOM.
  if ($('.content-container > .content').length > 0) {
    if ($('.content-container > .content-sidebar').length > 0) {
      $('.content-container > .content').addClass('has-content-sidebar');
    }
    if ($('.content-container > .content-details').length > 0) {
      $('.content-container > .content').addClass('has-content-details');
    }
  }

});
