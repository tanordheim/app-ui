# encoding: utf-8

module AppUi
  module Rails
  end
end

begin
  require 'less-rails'
rescue LoadError
  # Ignore this, it means the asset pipeline isn't enabled, or that less-rails
  # isn't installed.
end
require 'app_ui/rails/app_ui'
