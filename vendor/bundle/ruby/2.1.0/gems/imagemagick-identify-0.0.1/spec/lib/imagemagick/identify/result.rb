require 'spec_helper'

describe ImageMagick::Identify::Result do

  describe "#colors" do
    context "when given a result with colors specified" do
      subject{ described_class.new("Colors" => 12345)}

      its(:colors){ should == 12345 }
    end

    context "when given a result with colors not specified" do
      subject{ described_class.new }

      its(:colors){ should be_zero }
    end
  end
end
