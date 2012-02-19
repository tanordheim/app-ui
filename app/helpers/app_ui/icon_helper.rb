module AppUi

  # Helpers for icons.
  module IconHelper

    # Renders an icon tag for the specified icon.
    #
    # @param [ Symbol, String ] name The name of the icon.
    #
    # @return [ String ] The DOM element for rendering the icon.
    def icon_tag(name)
      content_tag(:i, '', class: "icon-#{name.to_s}")
    end

  end

end
