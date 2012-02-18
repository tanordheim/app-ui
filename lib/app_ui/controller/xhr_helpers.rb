# encoding: utf-8
module AppUi #:nodoc
  module Controller #:nodoc

    # XHR helpers for the controllers.
    module XhrHelpers

      extend ActiveSupport::Concern

      included do
        after_filter :flash_to_headers_if_xhr
      end

      private

      # Bubble any flash messages produced by a ajax request into the HTTP response headers
      def flash_to_headers_if_xhr

        return unless request.xhr?
        message = most_important_flash
        return if message.blank?

        response.headers['X-Message-Type'] = message[:type]
        response.headers['X-Message'] = message[:message]

        flash.discard # We don't want these flash messages displayed on the next request

      end

    end

  end
end
