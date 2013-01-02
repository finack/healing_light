class Led
  class SevenBit < Led::Base

    def gamma_correct(val)
      0x80 | (((val.to_f / 255.0) ** 2.5) * 127.0 + 0.5).to_i
    end

    def to_rgb
       [gamma_correct(red),
        gamma_correct(green),
        gamma_correct(blue)]
    end
    alias_method :to_a, :to_rgb

  end
end
