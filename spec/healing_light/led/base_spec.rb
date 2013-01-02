require 'spec_helper'

describe Led::Base do
  subject { Led::Base.new(1,2,3) }

  it { subject.to_a.should eq [1,2,3] }

  describe "Lightening and Darkening" do
    subject { Led::Base.new(*color) }
    let(:color) { [255,255,255] }

    it "Should darken by 50%" do
      subject.darken!(50)
      subject.to_a.should eq [128,128,128]
    end

    it "Should lighten by 50%" do
      color = [128,128,128]
      subject.lighten!(50)
      subject.to_a.should eq [255,255,255]
    end
  end

end
