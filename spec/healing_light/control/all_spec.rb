require 'spec_helper'

describe HealingLight::Control::All do
  context "#all_on" do
    subject { strip.extend HealingLight::Control::All }
    let(:strip) { Strip::Base.new(1) }

    before :each do
      subject.should_receive(:publish)
    end

    it "should take params of rgb colors" do
      subject.all_on(255,255,255)
    end

    it "should take an array of rgb colors" do
      subject.all_on([255,255,255])
    end

  end

end
