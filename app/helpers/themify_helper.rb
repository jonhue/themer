module ThemifyHelper

    def themify theme = nil
        theme ||= cookies[:themify] || Themify.configuration.default
        if Themify.configuration.auto && theme == 'auto'
            if Time.now < Time.parse(Themify.configuration.day_time) || Time.now > Time.parse(Themify.configuration.night_time)
                theme = Themify.configuration.day
            else
                theme = Themify.configuration.night
            end
        end
        theme
    end

    def set_themify theme
        cookies[:themify] = theme
        theme
    end

    def themify_class
        begin
            "themify--#{current_theme}"
        rescue NoMethodError
            "themify--#{themify}"
        end
    end

    def theme_available? theme
        Themify.configuration.themes.include? theme
    end

end
