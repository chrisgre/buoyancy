# Buoyancy

A Ruby gem for getting data from the NDBC (National Data Buoy Center). The data provided by these stations (buoys) is incredibly useful, but the data itself is inconsistent, poorly formatted, and somewhat difficult to figure out how to get. This gem is a wrapper that simplifies all of that.

## Installation

Add this line to your application's Gemfile:

    gem "buoyancy"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install buoyancy

## Usage

```ruby
require "rubygems"
require "bundler"
Bundler.setup

require "buoyancy"

# Get a list of all the stations
Buoyancy.stations

# Meteorological data coming soon
# Buoyancy.station("0y2w3").meteorological
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
