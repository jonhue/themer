require 'rails/railtie'

module Themify
    class Railtie < Rails::Railtie

        initializer 'themify.initialize' do
            ActiveSupport.on_load :action_controller do
                include ThemifyHelper
            end
        end

    end
end
