class Strip
  class LPD8806 < Strip::Base

    def initialize(count, dev)
      super count
      @dev = dev
    end

    def init_leds
      @count.times do
        led = Led::SevenBit.new
        led.extend Led::GRB
        @leds << led
      end
    end

    def []=(key,r,g,b)
      self.leds[key] = Led::SevenBit.new(g,r,b)
    end

    def flatten
      @leds.flat_map(&:to_a)
    end

    def latch_bytes
      #TODO calc latch byte for longer then 32 LED strips
      0x00
    end

    def publish
      out = self.flatten
      out << latch_bytes
      self.write(out)
    end

    def write(leds)
      IO.write @dev, leds.pack('C*')
    end

  end
end
