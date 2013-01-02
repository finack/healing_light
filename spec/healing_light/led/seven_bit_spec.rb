require 'spec_helper'

describe Led::SevenBit do
  subject { Led::SevenBit.new(*color) }
  let(:color) { [255,200,0] }

  it { subject.to_a.should eq [255,197,128] }

  it "Should allow change of value" do
    subject.red = 0
    subject.to_a.should eq [128,197,128]
  end

  describe "#gamma_correct" do
    it "Should return first bit set" do
      subject.gamma_correct(0).should eq 0x80
      subject.gamma_correct(0).should eq 0b10000000
    end

    it "should return all bits set" do
      subject.gamma_correct(255).should eq 0xff
      subject.gamma_correct(255).should eq 0b11111111
    end
  end
end
