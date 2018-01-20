require 'rails/generators'
require 'rails/generators/migration'

class ThemifyGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install Themify'

    def create_initializer
        template 'initializer.rb', 'config/initializers/themify.rb'
    end

    def create_assets
        template 'theme.scss', 'app/assets/stylesheets/themify/default.scss'
    end

end
