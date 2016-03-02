# This class is responsible for parsing the output of the identify
# command, and returning a nested hash structure.

module ImageMagick
  module Identify::Parser

    INDENT_PER_LEVEL = 2

    def self.parse(input, spaces = INDENT_PER_LEVEL)
      matcher = /\n\s{#{spaces}}\b/ #new line with n spaces until the next word

      {}.tap{ |result|
        input.split(matcher).each do |string|
          if string.include?(":\n")
            key, value = string.split(":\n", 2).map(&:strip)
            result[key] = parse(value, spaces + INDENT_PER_LEVEL)
          else
            key, value = string.split(": ", 2).map(&:strip)
            result[key] = value
          end
        end
      }
    end

    private

  end
end
