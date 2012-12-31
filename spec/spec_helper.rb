require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter

SimpleCov.start do
    add_filter 'vendor'
    add_filter 'spec'

    add_group 'Strips', 'lib/healing_light/strip'
    add_group 'Leds', 'lib/healing_light/led'
    add_group 'Controls', 'lib/healing_light/control'
    add_group 'Executables', 'bin'
end

require 'healing_light'
require 'healing_light/cli'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
