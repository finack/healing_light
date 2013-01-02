class Led
  module GRB

    def to_a
      rgb = to_rgb
      [rgb[1],rgb[0],rgb[2]]
    end
  end
end
