# EasyZoomOnRails

EasyZoom is an elegant, highly optimised jQuery image zoom and panning plugin based on the original work by Alen Grakalic. EasyZoom supports touch-enabled devices and is easily customisable with CSS.

## Installation

Add this line to your application's Gemfile:

```
gem 'easy_zoom_on_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_zoom_on_rails

## Usage

### application.js

```//= require easyzoom```

### application.css

```*= require easyzoom```

To simplify the usage of plugin, ```easy_zoom_tag``` view helper method provided  

```= easy_zoom_tag(zoom: '1_zoom.jpg', standard: '1_standard.jpg', class: 'easyzoom easyzoom--overlay')```

More [info](http://i-like-robots.github.io/EasyZoom/)

## Contributing

1. Fork it ( https://github.com/Saidbek/easy_zoom_on_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request