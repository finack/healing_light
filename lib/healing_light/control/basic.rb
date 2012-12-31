module Control
  module Basic
    def all_on(*rgb)
      rgb = rgb.shift if rgb.first.is_a?(Array)
      @leds.each { |led| led.value(*rgb) }
      self.publish
    end

    def all_off
      @leds.each { |led| led.value(0,0,0) }
      self.publish
    end

  end
end
