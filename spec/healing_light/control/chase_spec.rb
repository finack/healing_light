require 'spec_helper'

describe HealingLight::Control::Chase do
  context "painter" do
    let(:strip) { Strip::Base.new(32) }

    before :each do
      strip.extend HealingLight::Control::Chase
      strip.stub(:publish)
    end

    context "#paint" do
      it "Should paint LEDs that are on the strip"
    end

    context "#trailer should write to three LEDS" do
      let(:white) { [255,255,255] }
      let(:black) { [0,0,0] }
      let(:led) { 10 }
      let(:range) { [10,9,8,7] }

      before :each do
        # strip.should_receive(:paint).exactly(4).times
      end

      it "and should paint the primary LED" do
        pos = led
        strip.paint_trailer(*white,range)
        strip[pos].to_a.should eq white
      end

      it "and should paint the primary -1 LED @ 50%" do
        pos = led - 1
        strip[pos].should_receive(:"darken!").with(50)
        strip.paint_trailer(*white,range)
      end

      it "and should paint the primary -2 LED @ 25%" do
        pos = led - 2
        strip[pos].should_receive(:"darken!").with(25)
        strip.paint_trailer(*white,range)
      end

      it "and should paint the primary -3 LED @ 0%" do
        pos = led - 3
        strip.paint_trailer(*black,pos)
        strip.paint_trailer(*white,range)
      end
    end

    context "#point should write to one LEDS" do
      it "Should paint the primary LED"
    end

    context "#cylon should write to five LEDS" do
      it "Should paint the primary LED"
      it "Should paint the primary -1 LED @ 50%"
      it "Should paint the primary -2 LED @ 25%"
      it "Should paint the primary -3 LED @ 0%"
      it "Should paint the primary +1 LED @ 50%"
      it "Should paint the primary +2 LED @ 25%"
      it "Should paint the primary +3 LED @ 0%"
    end
  end # Chase Painter

  context "#chase" do
    let(:strip) { Strip::Base.new(32) }
    before :each do
      strip.extend HealingLight::Control::Chase
      strip.stub(:publish)
    end
  end

  context "#range" do
    subject { strip.extend HealingLight::Control::Chase; strip.range(5,3,dir) }
    let(:strip) { Strip::Base.new(32) }
    context "xx" do
      let(:dir) { :behind }
      it { should eq [5,4,3,2] }
    end
    context "xx" do
      let(:dir) { :ahead }
      it { should eq [27,28,29,30] }
    end
  end
end
