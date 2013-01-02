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

    context "#chase_dot" do
      it "Should chase the light down the strip" do
        strip.should_receive(:paint).exactly(33).times
        strip.chase_dot(255,255,255,:delay => 0)
      end
    end

    context "#chase_trailer" do
      it "Should chase the light down the strip" do
        strip.should_receive(:paint_trailer).exactly(36).times
        strip.chase_trailer(255,255,255,:delay => 0)
      end
    end

    context "#paint_trailer should write to three LEDS" do
      let(:white) { [255,255,255] }
      let(:black) { [0,0,0] }
      let(:led) { 10 }
      let(:range) { [10,9,8,7] }

      it "and should paint four leds" do
        strip.should_receive(:paint).exactly(4).times
        strip.paint_trailer(*white,range)
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

  describe "#range" do
    subject { strip.extend HealingLight::Control::Chase; strip.range(5,size,dir) }
    let(:strip) { Strip::Base.new(32) }
    let(:size) { 4 }

    context "should provide array going from right to left starting on left" do
      let(:dir) { :behind }
      it { should eq [5,4,3,2] }
    end

    context "should provide array going from left to right starting on right" do
      let(:dir) { :ahead }
      it { should eq [27,28,29,30] }
    end

    context "should return a single number left hand side" do
      let(:dir) { :behind }
      let(:size) { 1 }

      it { should eq [5] }
    end
    context "should return a single number right hand side" do
      let(:dir) { :ahead }
      let(:size) { 1 }

      it { should eq [27] }
    end

  end
end
