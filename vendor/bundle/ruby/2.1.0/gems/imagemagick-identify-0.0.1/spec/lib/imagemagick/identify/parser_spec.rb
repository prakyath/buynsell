require 'spec_helper'

describe ImageMagick::Identify::Parser do

  describe ".parse" do

    context "when it is given some valid input" do
      let(:input) do
        "Image: spec/fixtures/images/clock_in_1.jpg\n  Format: JPEG (Joint Photographic Experts Group JFIF format)\n  Geometry: 640x480+0+0\n  Resolution: 72x72\n  Channel depth:\n    red: 8-bit\n    green: 8-bit\n    blue: 8-bit\n  Channel statistics:\n    Red:\n      min: 0 (0)\n      max: 255 (1)\n      mean: 145.544 (0.570762)\n      standard deviation: 75.8102 (0.297295)"
      end

      let(:expectation) do
        {
          "Image" => "spec/fixtures/images/clock_in_1.jpg",
          "Format" => "JPEG (Joint Photographic Experts Group JFIF format)",
          "Geometry" => "640x480+0+0",
          "Resolution" => "72x72",
          "Channel depth" => { "red" => "8-bit", "green" => "8-bit", "blue" => "8-bit" },
          "Channel statistics" => { "Red" => { "min" => "0 (0)", "max" => "255 (1)", "mean" => "145.544 (0.570762)",   "standard deviation" => "75.8102 (0.297295)" } }
        }
      end

      example do
        described_class.parse(input).should == expectation
      end
    end

    context "when it is given no input" do
      example do
        described_class.parse("").should == {}
      end
    end
  end
end
