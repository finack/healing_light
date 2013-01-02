module HealingLight::CLI
  def strip(globals)
    strip = "Strip::#{globals[:strip]}"
    count = globals[:count]
    dev = globals[:dev]
    eval "#{strip}.new(#{count}, '#{dev}')"
  end

  def chase(type,r,g,b,opts)
    case opts[:direction]
    when "up"
      cmd = "$strip.chase_#{type}(r,g,b,dir: :behind)"
    when "down"
      cmd = "$strip.chase_#{type}(r,g,b,dir: :ahead)"
    else
      cmd =<<-EOS
        $strip.chase_#{type}(r,g,b, dir: :behind)
        $strip.chase_#{type}(r,g,b, dir: :ahead)
      EOS
    end
    eval cmd
  end

  def rgb_hex_to_a(rgb='000000')
    rgb.scan(/[0-9A-Fa-f]{2}/).map { |el| el.to_i(16) }
  end
end
