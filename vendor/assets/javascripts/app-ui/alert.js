/* ==========================================================
 * bootstrap-alert.js v2.0.1
 * http://twitter.github.com/bootstrap/javascript.html#alerts
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */


!function( $ ){

  "use strict"

 /* ALERT CLASS DEFINITION
  * ====================== */

  var dismiss = '[data-dismiss="alert"]'
    , Alert = function ( el ) {
        $(el).on('click', dismiss, this.close)
      }

  Alert.prototype = {

    constructor: Alert

  , close: function ( e ) {
      var $this = $(this)
        , selector = $this.attr('data-target')
        , $parent

      if (!selector) {
        selector = $this.attr('href')
        selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
      }

      $parent = $(selector)
      $parent.trigger('close')

      e && e.preventDefault()

      $parent.length || ($parent = $this.hasClass('alert') ? $this : $this.parent())

      $parent
        .trigger('close')
        .removeClass('in')

      function removeElement() {
        $parent
          .trigger('closed')
          .remove()
      }

      $.support.transition && $parent.hasClass('fade') ?
        $parent.on($.support.transition.end, removeElement) :
        removeElement()
    }

  }


 /* ALERT PLUGIN DEFINITION
  * ======================= */

  $.fn.alert = function ( option ) {
    return this.each(function () {
      var $this = $(this)
        , data = $this.data('alert')
      if (!data) $this.data('alert', (data = new Alert(this)))
      if (typeof option == 'string') data[option].call($this)
    })
  }

  $.fn.alert.Constructor = Alert


 /* ALERT DATA-API
  * ============== */

  $(function () {
    $('body').on('click.alert.data-api', dismiss, Alert.prototype.close)
  })

}( window.jQuery );

$.displayAlert = function(message) {

  // Remove all pre-existing messages from the DOM.
  // $('#flash-alert').remove();
  // $('<div id="flash-alert"/>').append(message).appendTo(document.body).show(); //fadeIn('fast').delay(5000).fadeOut('fast', function() { $(this).remove(); });

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
    $('<div id="flash-alert"/>').appendTo('section.content-wrapper > section.content');
  }

  // If the flash message container has a message in it, move it into place.
  // if ($('#flash-message > div').length > 0) {

  //   var message = $('#flash-message > div');
  //   $.displayAlert(message);

  // }

});
