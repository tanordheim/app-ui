class Dialog

  # Initialize a new dialog.
  constructor: (title, body, userCallback) ->
    @title = title
    @body = body
    @userCallback = userCallback || ->

    showCallback = =>
      @showBackdrop =>
        @show()

    # If we have an open dialog already, close it before showing ourselves.
    if $('body > .modal').length > 0
      $('body > .modal').data('modal').close null, => showCallback()
    else
      showCallback()

  # Create and show the backdrop behind the dialog.
  showBackdrop: (callback) ->
    animate = 'fade'
    doAnimate = $.support.transition && animate

    # Create the backdrop element.
    @$backdrop = $("<div class=\"modal-backdrop #{animate}\" />").appendTo(document.body)

    # Proxy clicks on the backdrop to the close method.
    @$backdrop.click($.proxy(@close, @))

    if doAnimate then @$backdrop[0].offsetWidth # Force reflow.

    # Style and animate the backdrop.
    @$backdrop.addClass('in')
    if doAnimate then @$backdrop.one($.support.transition.end, callback) else callback()

  # Remove the backdrop behind the dialog.
  removeBackdrop: (callback) ->
    @$backdrop.removeClass('in')

    # If we support transitions, fade out before removing the backdrop and
    # calling the callback. Otherwise, just remove the backdrop and call the
    # callback.
    if $.support.transition
      @$backdrop.one $.support.transition.end, =>
        @$backdrop.remove()
        callback()
    else
      @$backdrop.remove()
      callback()

  # Show the dialog.
  show: ->

    # Add the modal-open class to the body.
    $('body').addClass('modal-open')

    # Build the dialog element. If the modal element already exists in the dom,
    # reuse it. Otherwise, create a new one.
    header = $("<div class=\"modal-header\" />").append($('<a class="close" data-dismiss="modal">&times;</a>')).append($('<h3/>').text(@title))
    @$dialog = $("<div class=\"modal hide fade\" />").append(header).append($('<div class="modal-body"/>').html(@body)).appendTo(document.body).show()

    transition = $.support.transition
    if transition then @$dialog[0].offsetWidth # Force reflow.

    @$dialog.addClass('in')
    if transition then @$dialog.one($.support.transition.end, ->)

    # Delegate close requests to the close method.
    @$dialog.delegate('[data-dismiss="modal"]', 'click.close.modal', $.proxy(@close, @))

    # Bind the escape key to closing the modal.
    $(document).on 'keyup.close.modal', (e) =>
      e.which == 27 && @close()

    # Attach ourselves to the dialog data.
    @$dialog.data('modal', @)

    # Fire the user callback.
    @userCallback()

  # Close the dialog.
  close: (e, callback) ->
    e? && e['preventDefault']? && e.preventDefault()

    # Remove the escape key bind.
    $(document).off('keyup.close.modal')

    # Remove the modal-open class from the body.
    $('body').removeClass('modal-open')

    # Hide the elements.
    @$dialog.trigger('hide').removeClass('in')
    callback ||= ->
    if $.support.transition then @hideWithTransition(callback) else @hide(callback)

  # Hide the dialog using a transition.
  hideWithTransition: (callback) ->
    timeout = setTimeout(=>
      @$dialog.off($.support.transition.end)
      @hide(callback)
    , 500)
    @$dialog.one($.support.transition.end, =>
      clearTimeout(timeout)
      @hide(callback)
    )

  # Hide the dialog.
  hide: (callback) ->
    @$dialog.hide().trigger('hidden')
    @removeBackdrop =>
      @$dialog.remove()
      if callback? then callback()

# Modal plugin definition.
$.modal = (title, body) ->
  new Dialog(title, body)

$.closeModal = ->
  if $('body > .modal').length > 0
    $('body > .modal').data('modal').close()

$ ->

  $('[data-toggle="modal"][data-target]').live 'click', (e) ->
    e? && e.preventDefault()
    target = $(e.target)

    body = $(target.attr('data-target')).html()
    title = target.attr('data-title') || 'No title'

    dialog = new Dialog(title, body)
