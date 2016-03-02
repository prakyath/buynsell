require 'spec_helper'

describe ImageMagick::Identify::Command do

  describe ".execute" do
    context "when ImageMagick is installed" do
      before :each do
        Which.stub(:which).and_return("identify")
      end

      context "and given a file that exists" do
        let(:file_name){ "spec/fixtures/images/test.jpg" }

        example do
          described_class.execute(file_name).should include("Colors")
        end
      end

      context "and given a file that doesn't exist" do
        let(:file_name){ "this/is/a/made_up_file.jpg" }

        example do
          described_class.execute(file_name).should be_empty
        end
      end
    end

    context "when ImageMagick is not installed" do
      before :each do
        Which.stub(:which).and_return(nil)
      end

      example do
        expect{
          described_class.execute("spec/fixtures/images/test.jpg") 
        }.to raise_error ImageMagick::CommandNotFoundException, "ImageMagick command 'identify' not found!"
      end
    end
  end

end
