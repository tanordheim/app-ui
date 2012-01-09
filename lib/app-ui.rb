# encoding: utf-8

module AppUi
  module Rails
    require 'app_ui/rails/engine' if defined?(Rails)
  end
end

require 'app_ui/rails/app_ui'
