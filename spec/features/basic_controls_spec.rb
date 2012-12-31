require 'spec_helper'

describe "As a LPD8806 user" do
  let(:strip) { Strip::LPD8806.new(1, "/dev/spidev0.0") }
  let(:red)   { [255,0,0] }
  let(:green) { [0,255,0] }
  let(:blue)  { [0,0,255] }
  let(:white) { [255,255,255] }

  before :each do
    strip.extend HealingLight::Control::All
  end

  context "all leds shoud turn on" do

    it "white" do
      strip.should_receive(:write).with([255,255,255,0])
      strip.all_on(white)
    end

    it "red" do
      strip.should_receive(:write).with([128,255,128,0])
      strip.all_on(red)
    end

    it "green" do
      strip.should_receive(:write).with([255,128,128,0])
      strip.all_on(green)
    end
  end

  it "all leds should turn off" do
    strip.should_receive(:write).with([128,128,128,0])
    strip.all_off
  end

end
