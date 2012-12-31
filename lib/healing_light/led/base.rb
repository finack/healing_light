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

    def to_a
      [red,green,blue]
    end

  end
end
