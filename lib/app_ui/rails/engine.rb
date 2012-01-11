# encoding: utf-8

require 'rails'
require 'app_ui/controller/navigation_helpers'

module AppUi
  module Rails
    class Engine < ::Rails::Engine

      initializer 'app-ui.setup', :after => 'less-rails.after.load_config_initializers', :group => :all do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'assets', 'stylesheets')
      end

      initializer 'app-ui.app_controller' do |app|
        ActiveSupport.on_load(:action_controller) do

          # Add controller navigation helpers.
          include AppUi::Controller::NavigationHelpers

        end
      end

    end
  end
end
