# encoding: utf-8

module AppUi #:nodoc

  # Helper methods related to page titles.
  module TitleHelper

    # Set the current title of the page.
    #
    # @param [ String ] title The title of the page.
    def set_title(title)
      @title = title
    end

    # Returns the current title of the page, if any.
    #
    # @return [ String ] The current page title, or nil if no title has been
    #   set.
    def title
      @title
    end

  end

end
