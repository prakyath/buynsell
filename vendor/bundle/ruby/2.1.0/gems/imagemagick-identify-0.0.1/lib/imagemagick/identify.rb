require "imagemagick/exceptions"
require "imagemagick/identify/version"
require "imagemagick/identify/command"
require "imagemagick/identify/parser"
require "imagemagick/identify/result"

module ImageMagick
  class Identify

    def initialize(file_path)
      @file_path = file_path
      validate_file_path!
    end

    class << self
      def for(file_path)
        new(file_path)
      end

      private :new
    end

    def run
      output = command.execute(@file_path)
      parsed_result = parser.parse(output)
      Result.new(parsed_result)
    end

    private

    def command
      ImageMagick::Identify::Command
    end

    def parser
      ImageMagick::Identify::Parser
    end

    def validate_file_path!
      raise FileNotFoundException, "File doesn't exist!" unless File.exists?(@file_path)
    end

  end
end
