module AppUi

  # Helpers for icons.
  module IconHelper

    # Renders an icon tag for the specified icon.
    #
    # @param [ Symbol, String ] name The name of the icon.
    # @param [ String ] text Optional text to append after the element.
    #
    # @return [ String ] The DOM element for rendering the icon.
    def icon_tag(name, text = nil, *args)

      options = args.extract_options!
      options[:color] ||= :black

      icon_classes = ["icon-#{name.to_s}"]
      icon_classes << "icon-#{options[:color].to_s}" unless options[:color] == :black

      value = ''
      value << content_tag(:i, '', class: icon_classes.join(' '))
      value << sanitize(" #{text}") unless text.blank?
      value.html_safe

    end

  end

end
