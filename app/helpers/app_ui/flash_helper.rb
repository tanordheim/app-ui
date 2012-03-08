module AppUi

  # Helpers for flash messages.
  module FlashHelper

    # Render the most important flash message available.
    #
    # @return [ String ] The DOM for the most important flash message, or nil if
    #   no flash messages are present.
    def render_most_important_flash
      message = most_important_flash # most_important_flash is a helper defined in lib/app_ui/controller/flash_helpers.rb
      if message.blank?
        nil
      else
        close_link = content_tag(:a, '&times;'.html_safe, class: 'close', :'data-dismiss' => 'alert')
        content_tag(:div, close_link + message[:message], :class => ['alert', "alert-#{message[:type]}"].join(' '))
      end
    end
    
  end
end
