# HealingLight

[![Build Status](https://travis-ci.org/finack/healing_light.png?branch=master)](https://travis-ci.org/finack/healing_light)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/finack/healing_light)
[![Code Coverage](https://coveralls.io/repos/finack/healing_light/badge.png?branch=master)](https://coveralls.io/r/finack/healing_light)

Control LED Lights on the RasperryPi (or other linux like systems) from Ruby

## Setup

### LPD8806

The [LPD8806 Digital RGB Strip](http://www.adafruit.com/products/307) from
Adafruit is controlled via the SPIDEV user space linux module on the
[Adafruit Raspberry Pi Linux Distro](http://learn.adafruit.com/adafruit-raspberry-pi-educational-linux-distro/overview).

**Quick Usage**

Fire up your Raspberry PI, SSH/Console into it, and assuming you have Ruby 1.9

```sh
mkdir ~/healing_light
cd ~/healing_light
gem install bundler
bundle init
echo "gem 'healing_light', git: 'http://www.github.com:/finack/healing_light.git'" >> Gemfile
bundle update

sudo chmod a+rw /dev/spidev0.0

bundle exec healing_light all on
bundle exec healing_light all off
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
