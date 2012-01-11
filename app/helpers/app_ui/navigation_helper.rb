# encoding: utf-8

module AppUi #:nodoc

  # Helper methods related to navigation.
  module NavigationHelper

    # Returns the navigation section currently being viewed, if any.
    #
    # @return [ String ] The current navigation section identifier, or nil if no
    #   identifier has been set.
    def navigation_section
      @navigation_section
    end

    # Returns the class to apply to the primary navigation tab for the specified
    # navigation element.
    #
    # @param [ String ] identifier The identifier of the navigation tab to render.
    #
    # @return [ String ] The class to apply to the navigation tab. Returns
    #   "current" if the identifier is the current section, nil otherwise.
    def primary_navigation_class(identifier)
      navigation_section == identifier ? 'current' : nil
    end

    # Render the most important flash message available
    def render_most_important_flash
        %w(error notice).each do |type|
          return render_flash_message(flash[type.to_sym], type.to_sym) unless flash[type.to_sym].blank?
      end
      nil
    end

    private

    # Render a flash message using the specified message type.
    #
    # @param [ String ] message The message to display.
    # @param [ Symbol ] type The type of message to render.
    #
    # @return [ String ] The rendered flash message.
    def render_flash_message(message, type)

      close_link = link_to '&times;'.html_safe, '#', :class => 'close'
      message_body = close_link + content_tag(:p, message)

      content_tag(:article, message_body, :class => ['alert', type.to_s].join(' '))

    end

  end
end
