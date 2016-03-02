# This class is a wrapper around the identify command for ImageMagick.
# It will return the verbose information for the file.

require "utilities/which"

module ImageMagick
  module Identify::Command

    def self.execute(file_path)
      command = "#{path_to_identify} -verbose -unique #{file_path.inspect}"
      `#{command}`
    end

    private

    def self.path_to_identify
      Which.which("identify").tap{ |path|
        raise CommandNotFoundException, "ImageMagick command 'identify' not found!" unless path
      }
    end

  end
end
