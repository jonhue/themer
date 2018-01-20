# Themer

[![Gem Version](https://badge.fury.io/rb/themer.svg)](https://badge.fury.io/rb/themer) <img src="https://travis-ci.org/jonhue/themer.svg?branch=master" />

Add support for multiple color themes in your Rails app. Themer uses CSS variables to make your apps themes truly dynamic and changeable on the fly.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Stylesheets](#stylesheets)
    * [Methods](#methods)
    * [Switching themes automatically](#switching-themes-automatically)
* [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

Themer works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'themer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install themer

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'themer', github: 'jonhue/themer'
```

Now run the generator:

    $ rails g themer

---

## Usage

To setup Themer, use the `themify_class` helper method to specify the current theme in your views `html` tag:

```erb
<html class="<%= themify_class %>">
```

Then create a `current_theme` helper method in your `ApplicationHelper` (`app/helpers/application_helper.rb`):

```ruby
def current_theme
    themer current_user.theme
end
```

**Note:** This helper method is not required but helpful when you want to store information about selected themes in your database.

Lastly, add the following to your `application.sass` file (`app/assets/stylesheets/application.sass`):

```sass
@import "themer/default"
@import "themer"
```

### Stylesheets

To get started define your colors in the `'default'` theme (`app/assets/stylesheets/themer/default.sass`):

```scss
$themer--default: (
    text: (
        dark: #000000,
        base: #eeeeee
    ),
    background: #ffffff
);
```

In your Sass stylesheets you are able to use the `color` function to access your theme colors:

```sass
html
    background: color(background)
p
    color: color(text, base)
```

**Note:** If you need to get a HEX value for a specific color pass `true` as a third attribute to the color function. This will return the color for the theme set as default.

### Methods

Themer adds a couple of helpful methods to your controllers and views:

```ruby
# Returns the currently used theme. Passed parameter overrides theme stored in cookies and default theme.
themer current_user.theme

# Set the theme
set_themer 'default'

# Check if a theme is available
themer_available? 'default'

# Return Themer class for `html` tag
themer_class
```

### Switching themes automatically

You can [configure](#configuration) Themer to update the theme based on day and nighttime.

To automatically select a theme just set the theme to `'auto'`:

```ruby
set_themer 'auto'
```

---

## Configuration

You can configure Themer by passing a block to `configure`. This can be done in `config/initializers/themer.rb`:

```ruby
Themer.configure do |config|
    config.themes = ['default']
end
```

* `themes` Array of available themes. Takes an array of strings. Defaults to `['default']`.
* `default` Default theme. Takes a string. Defaults to `'default'`.
* `auto` Enable automatic themes. Takes a boolean. Defaults to `false`.
* `day` Day theme. Takes a string. Defaults to `'light'`.
* `night` Night theme. Takes a string. Defaults to `'dark'`.
* `day_time` Beginning of daytime. Takes a string. Defaults to `'6:00 am'`.
* `night_time` Beginning of nighttime. Takes a string. Defaults to `'6:00 pm'`.

---

## To Do

[Here](https://github.com/jonhue/themer/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/themer/issues/new).

---

## Contributing

We hope that you will consider contributing to Themer. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/themer/graphs/contributors

### Semantic Versioning

Themer follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
