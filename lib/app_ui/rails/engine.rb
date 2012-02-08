# encoding: utf-8

require 'rails'
require 'app_ui/controller/navigation_helpers'

module AppUi
  module Rails
    class Engine < ::Rails::Engine

      # Add the app-ui less framework to the Less load paths if the less-rails
      # gem is loaded.
      if defined?(Less) && defined?(Less::Rails)
        initializer 'app-ui.setup', :after => 'less-rails.after.load_config_initializers', :group => :all do |app|
          app.config.less.paths << File.join(config.root, 'vendor', 'frameworks')
        end
      end

      # Add the jQuery UI image directory to the asset load path.
      initializer 'app-ui.append_asset_path', :group => :all, :after => :append_assets_path do |app|
        app.config.assets.paths << File.join(config.root, 'vendor', 'assets', 'stylesheets', 'app-ui', 'jquery-ui-images')
      end

      # Hook in the controller support logic.
      initializer 'app-ui.app_controller' do |app|
        ActiveSupport.on_load(:action_controller) do

          # Add controller navigation helpers.
          include AppUi::Controller::NavigationHelpers

        end
      end

    end
  end
end
