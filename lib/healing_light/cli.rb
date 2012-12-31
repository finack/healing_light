module HealingLight::CLI
  def strip(globals)
    strip = "Strip::#{globals[:strip]}"
    count = globals[:count]
    dev = globals[:dev]
    eval "#{strip}.new(#{count}, '#{dev}')"
  end
end
