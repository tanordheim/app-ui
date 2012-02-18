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

  end
end
