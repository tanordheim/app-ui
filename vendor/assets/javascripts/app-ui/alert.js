$.displayAlert = function(message) {

  // Remove all pre-existing messages from the DOM.
  $('#flash-alert').empty();
  
  // Show the new flash message.
  $('#flash-alert').append(message).show().delay(5000).slideUp('fast', function() { $(this).empty(); });

}

// Show flash messages after completing ajax requests
$(document).ajaxComplete(function(e, request) {

  var messageType = request.getResponseHeader('X-Message-Type');
  var message = request.getResponseHeader('X-Message');
  if (messageType && message) {

    // Build the DOM for the message.
    var messageContainer = $("<div class='alert alert-" + messageType + "'/>");
    messageContainer.append("<a class='close' data-dismiss='alert'>&times;</a>");
    messageContainer.append(message);

    // Display the message.
    $.displayAlert(messageContainer);

  }
  
});

$(document).ready(function() {

  // Build the container for the flash messages unless it already exists.
  if ($('#flash-alert').length == 0) {
    $('<div id="flash-alert"/>').prependTo('section.content-wrapper > section.content');
  }

  // If the flash message container has a message in it, move it into place.
  if ($('#flash-message > div').length > 0) {

    var message = $('#flash-message > div');
    $.displayAlert(message);

  }

  // Hide flash messages.
  $('[data-dismiss="alert"]').live('click', function(e) {
    e.preventDefault();
    $(this).closest('.alert').slideUp('fast', function() { $(this).closest('#flash-alert').empty().css('display', 'none'); });
  });

});
