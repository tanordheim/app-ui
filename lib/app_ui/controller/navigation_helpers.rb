# encoding: utf-8
module AppUi #:nodoc
  module Controller #:nodoc

    # Navigation helpers for the controllers.
    module NavigationHelpers

      extend ActiveSupport::Concern

      included do
        helper_method :set_navigation_section
      end

      module ClassMethods #:nodoc

        # Assign the current navigation section being viewed.
        #
        # @param [ String ] identifier The identifier of the current section.
        # @param [ Hash ] options A hash of options that will be passed directly
        #   to before_filter.
        def set_navigation_section(identifier, *args)

          options = args.extract_options!
          before_filter(options) do |instance|
            instance.send(:set_navigation_section, identifier)
          end

        end

      end

      # Assign the current navigation section being viewed.
      #
      # @param [ String ] identifier The identifier of the current section.
      def set_navigation_section(identifier)
        @navigation_section = identifier
      end

    end

  end
end
