module AppUi

  # Helper methods for the Gretel breadcrumb gem, rendering the breadcrumbs in a
  # format suitable for the app ui.
  module GretelHelper

    # Render the current set of Gretel breadcrumbs.
    #
    # @return [ String ] The DOM elements representing the current set of
    #   breadcrumbs.
    def render_gretel_crumbs
      unless @_breadcrumb_name.blank? && @_breadcrumb_object.blank?

        crumb = Gretel::Crumbs.get_crumb(@_breadcrumb_name, @_breadcrumb_object)
        output = render_breadcrumb_element(crumb)

        # Add all parent elements, if any.
        while parent = crumb.parent
          crumb = Gretel::Crumbs.get_crumb(parent.name, parent.object)
          output = render_breadcrumb_element(crumb) + output
        end

        content_tag(:ul, output)

      else
        nil
      end
    end

    private

    # Renders an element within a set of breadcrumbs.
    #
    # @param [ Gretel::Crumb ] crumb The breadcrumb element to render
    #
    # @return [ String ] The rendered breadcrumb element.
    def render_breadcrumb_element(crumb)
      link = link_to(crumb.link.text, crumb.link.url)
      divider = content_tag(:span, '/', :class => 'divider')
      content_tag(:li, link + divider)
    end

  end
end
