require 'spec_helper'

describe Control::Basic do
  context "#all_on" do
    subject { strip.extend Control::Basic }
    let(:strip) { Strip::Base.new(1) }

    before :each do
      subject.should_receive(:publish)
    end

    it "should take an array of rgb colors" do
      subject.all_on([255,255,255])
    end

  end

  context "wip #all_on" do
    it "should take params of rgb colors" do
      pending
      # subject.all_on(255,255,255)
    end
  end

end
