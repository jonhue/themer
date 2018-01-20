module Themify

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Configuration

        attr_accessor :themes
        attr_accessor :default
        attr_accessor :auto
        attr_accessor :day
        attr_accessor :night
        attr_accessor :day_time
        attr_accessor :night_time

        def initialize
            @themes = ['default']
            @default = 'default'
            @auto = false
            @day = 'light'
            @night = 'dark'
            @day_time = '6:00 am'
            @night_time = '6:00 pm'
        end

    end
end
