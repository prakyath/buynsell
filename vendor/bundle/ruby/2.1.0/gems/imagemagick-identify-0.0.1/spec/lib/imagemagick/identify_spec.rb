require 'spec_helper'

describe ImageMagick::Identify do

  describe ".new" do
    example do
      expect{
        described_class.new
      }.to raise_error NoMethodError
    end
  end

  describe ".for" do
    context "when given a file that exists" do
      subject{ described_class.for("spec/fixtures/images/test.jpg") }

      it{ should be_a(ImageMagick::Identify) }
    end

    context "when given a file that doesn't exist" do
      example do
        expect{
          described_class.for("this/is/a/made_up_file.jpg")
        }.to raise_error ImageMagick::FileNotFoundException, "File doesn't exist!"
      end
    end
  end

  describe ".run" do
    context "when given a file that exists" do
      subject{ described_class.for("spec/fixtures/images/test.jpg") }

      example do
        subject.run.should be_a(ImageMagick::Identify::Result)
      end

      example do
        subject.run.colors.should == 50258
      end
    end

  end

end
