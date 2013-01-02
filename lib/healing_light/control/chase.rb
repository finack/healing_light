module HealingLight::Control
  module Chase

    def chase_dot(r,g,b,opts)
      count = @count + 2
      count.times do |pos|
        paint_dot(r,g,b,range(pos,2,opts[:dir]))
        self.publish
        sleep opts[:delay] || 0.05
      end
    end

    def chase_trailer(r,g,b,opts)
      count = @count + 4
      count.times do |pos|
        paint_trailer(r,g,b,range(pos,4,opts[:dir]))
        self.publish
        sleep opts[:delay] || 0.05
      end
    end

    def paint(r,g,b,led,opacity=0)
      if led >= 0 && led < @count
        @leds[led].value(r,g,b)
        @leds[led].darken!(opacity) if opacity > 0
      end
    end

    def paint_dot(r,g,b,pos)
      paint(r,g,b,pos[0])
      paint(0,0,0,pos[1])
    end

    def paint_trailer(r,g,b,pos)
      paint(r,g,b,pos[0])
      paint(r,g,b,pos[1],50)
      paint(r,g,b,pos[2],25)
      paint(0,0,0,pos[3])
    end

    def range(pos,size,dir=:behind)
      if dir == :behind || dir == nil
        pos +=1
        (pos-size...pos).to_a.reverse
      elsif dir == :ahead
        first = @count-pos
        last = @count-pos+size
        (first...last).to_a
      end
    end

  end
end
