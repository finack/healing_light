class Led
  class Base
    attr_accessor :red, :green, :blue

    def initialize(r=0,g=0,b=0)
      self.value(r,g,b)
    end

    def value(r,g,b)
      self.red   = r
      self.green = g
      self.blue  = b
    end

    def lighten!(opacity)
      mix_with(255, opacity)
    end

    def darken!(opacity)
      mix_with(0, opacity)
    end

    def mix_with(base, opacity)
      opacity /= 100.0
      self.red = ((self.red * opacity) + (base * (1 - opacity))).round
      self.green = ((self.green * opacity) + (base * (1 - opacity))).round
      self.blue = ((self.blue * opacity) + (base * (1 - opacity))).round
    end

    def to_a
      [red,green,blue]
    end

  end
end
