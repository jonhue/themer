# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'themer', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'themer'
    gem.version               = Themify::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Themes for Rails apps'
    gem.description           = 'Add support for multiple color themes in your Rails app. Themer uses CSS variables to make your apps themes truly dynamic and changeable on the fly.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/themer'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'vendor/**/*']
    gem.require_paths         = ['lib']

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'actionpack', '>= 5.0'
    gem.add_dependency 'sass-rails', '~> 5.0'
    gem.required_ruby_version = '>= 2.3'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
