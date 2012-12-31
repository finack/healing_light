require 'spec_helper'

describe Led::Base do
  subject { Led::Base.new(1,2,3) }

  it { subject.to_a.should eq [1,2,3] }

end
