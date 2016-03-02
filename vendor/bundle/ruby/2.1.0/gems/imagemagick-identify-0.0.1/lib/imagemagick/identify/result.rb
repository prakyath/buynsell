# This class represents the result of the ImageMagick identify command.
# It exposes only the results that we care about through methods.

module ImageMagick
  class Identify::Result

    def initialize(result={})
      @result = result
    end

    def colors
      @result["Colors"].to_i
    end

  end
end
