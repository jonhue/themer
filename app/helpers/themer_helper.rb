module ThemerHelper

    def themer theme = nil
        theme ||= cookies[:themer] || Themer.configuration.default
        if Themer.configuration.auto && theme == 'auto'
            if Time.now < Time.parse(Themer.configuration.day_time) || Time.now > Time.parse(Themer.configuration.night_time)
                theme = Themer.configuration.day
            else
                theme = Themer.configuration.night
            end
        end
        theme
    end

    def set_themer theme
        cookies[:themer] = theme
        theme
    end

    def themer_class
        begin
            "themer--#{current_theme}"
        rescue NoMethodError
            "themer--#{themer}"
        end
    end

    def themer_available? theme
        Themer.configuration.themes.include? theme
    end

end
