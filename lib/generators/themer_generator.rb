require 'rails/generators'
require 'rails/generators/migration'

class ThemerGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install Themer'

    def create_initializer
        template 'initializer.rb', 'config/initializers/themer.rb'
    end

    def create_assets
        template 'theme.scss', 'app/assets/stylesheets/themer/default.scss'
    end

end
