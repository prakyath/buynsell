# ImageMagick::Identify

A wrapper around ImageMagick's identify command

## Installation

Install [ImageMagick](http://www.imagemagick.org/script/index.php) on your server using your favourite package manager.

Add this line to your application's Gemfile:

    gem 'imagemagick-identify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imagemagick-identify

## Usage

Create an `ImageMagick::Identify` object using `ImageMagick::Identify(<filename>)`, then call `run` on it.  It will return you an `ImageMagick::Result` which contains the attreibutes of that image.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
