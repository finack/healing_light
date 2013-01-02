class Strip
  class Base

    attr_reader :leds

    def initialize(count)
      @leds = []
      @count = count
      init_leds
    end

    def [](key)
      @leds[key]
    end

    def init_leds
      @count.times do
        led = Led::Base.new
        @leds << led
      end
    end

  end
end
