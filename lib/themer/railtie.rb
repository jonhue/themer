require 'rails/railtie'

module Themer
    class Railtie < Rails::Railtie

        initializer 'themer.initialize' do
            ActiveSupport.on_load :action_controller do
                include ThemerHelper
            end
        end

    end
end
