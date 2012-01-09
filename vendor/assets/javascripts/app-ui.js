/*
 * app-ui.js
 *
 * Support JavaScript for the basic application UI.
 */

$(document).ready(function() {

  var content = $('.content-container > .content');

  // Add has-content-details and has-content-sidebar classes to the content
  // article element if content details and/or a sidebar is present in the DOM.
  if (content.length > 0) {

    var contentSidebar = $('.content-container > .content-sidebar');
    var contentDetails = $('.content-container > .content-details');

    // Add has-content-details and has-content-sidebar classes to the content
    // article element if content details and/or a sidebar is present in the DOM.
    if (contentSidebar.length > 0) {
      content.addClass('has-content-sidebar');
    }
    if (contentDetails.length > 0) {
      content.addClass('has-content-details');
    }

    // If we have a content sidebar, set the min-height of the content block to be
    // equal to the height of the content sidebar, to ensure its not flowing out
    // of bounds.
    //
    // TODO - This should be fixed in CSS eventually.
    var minHeight = 0;
    if (contentSidebar.length > 0) {
      minHeight = contentSidebar.outerHeight();
    }
    if (contentDetails.length > 0 && contentDetails.outerHeight() > minHeight) {
      minHeight = contentDetails.outerHeight()
    }
    if (minHeight > 0) {
      content.css('min-height', minHeight + 15 + 'px');
    }

  }

});
