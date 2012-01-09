/*
 * modal.js
 *
 * Support JavaScript for modal dialogs displayed in the UI.
 */

!function($) {

  "use strict";

  // Modal public class definition.
  var Modal = function(content) {
    this.$element = $(content).delegate('.close', 'click.modal', $.proxy(this.hide, this));
    this.show();
    return this;
  };

  Modal.prototype = {

    // Toggle the dialog.
    toggle: function() {
      return this[this.isShown ? 'hide' : 'show']();
    },

    // Show the dialog.
    show: function() {
      var that = this;
      this.isShown = true;
      this.$element.trigger('show');

      escape.call(this);
      backdrop.call(this, function() {
        that.$element.removeClass('hide');
        that.$element.appendTo(document.body).show();
      });

      return this;
    },

    // Hide the dialog.
    hide: function(e) {

      e && e.preventDefault();

      if (!this.isShown) {
        return this;
      }

      var that = this;
      this.isShown = false;

      escape.call(this);
      this.$element.trigger('hide');
      hideModal.call(this);

      return this;

    }

  }

  //
  // Modal private methods.
  //

  // Show or hide the backdrop behind the dialog.
  function backdrop(callback) {

    var that = this;
    if (this.isShown) {
      this.$backdrop = $('<div class="modal-backdrop" />').appendTo(document.body);
      this.$backdrop.click($.proxy(this.hide, this));
      callback();
    } else if (!this.isShown && this.$backdrop) {
      this.$backdrop.remove();
      this.$backdrop = null;
    } else if (callback) {
      callback();
    }

  }

  // Configure the escape handler.
  function escape() {

    var that = this;
    if (this.isShown) {
      $(document).bind('keyup.modal', function(e) {
        if (e.which == 27) {
          that.hide();
        }
      });
    } else if (!this.isShown) {
      $(document).unbind('keyup.modal');
    }

  }

  // Hide a modal dialog.
  function hideModal(that) {
    this.$element.hide().trigger('hidden');
    backdrop.call(this);
  }

  // Modal plugin definition.
  $.fn.modal = function() {
    var modal = this.data('modal');
    if (modal) {
      modal.toggle();
    } else {
      return this.each(function() {
        $(this).data('modal', new Modal(this));
      });
    }

    return this;
  };

  // Assign the Modal public class.
  $.fn.modal.Modal = Modal;

  // Modal data-implementation.
  $(document).ready(function() {

    $('body').delegate('[data-controls-modal]', 'click', function(e) {
      e.preventDefault();
      var $this = $(this).data('show', true);
      $('#' + $this.attr('data-controls-modal')).modal($this.data());
    });

  });

}(window.jQuery || window.ender);
