# encoding: utf-8

require 'rails'

module AppUi
  module Rails
    class Engine < ::Rails::Engine

      initializer 'app-ui.setup',
      :after => 'less-rails.after.load_config_initializers',
      :group => :all do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'assets', 'stylesheets')
      end

    end
  end
end
