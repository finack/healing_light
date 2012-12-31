class Led
  class SevenBit < Led::Base

    def red=(val)
      @red = gamma_correct(val)
    end

    def blue=(val)
      @blue = gamma_correct(val)
    end

    def green=(val)
      @green = gamma_correct(val)
    end

    def gamma_correct(val)
      0x80 | (((val.to_f / 255.0) ** 2.5) * 127.0 + 0.5).to_i
    end

  end
end
