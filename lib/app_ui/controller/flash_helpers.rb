# encoding: utf-8
module AppUi #:nodoc
  module Controller #:nodoc

    # Flash helpers for the controllers.
    module FlashHelpers

      extend ActiveSupport::Concern

      included do
        helper_method :most_important_flash
      end

      private

      # Return the most important flash message produced by this request
      #
      # @return [ Hash ] A hash containing information about the most important
      #   flash message, or nil if no flash messages are present.
      def most_important_flash
        return { :type => flash_type_to_css_class(:error), :message => flash[:error] } unless flash[:error].blank?
        return { :type => flash_type_to_css_class(:notice), :message => flash[:notice] } unless flash[:notice].blank?
        nil
      end

      def flash_type_to_css_class(type)
        map = { error: 'error', notice: 'success' }
        map[type]
      end

    end

  end
end
