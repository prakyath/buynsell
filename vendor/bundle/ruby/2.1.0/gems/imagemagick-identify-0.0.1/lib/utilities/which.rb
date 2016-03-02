# This module provides the equivalent of the unix which command.
# It is used by the ImageMagick module to check for the extistence
# of the ImageMagick command 'identify'.

module Which
  def self.which(command)
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      command_path = File.join(path, command)
      return command_path if File.executable? command_path
    end

    nil
  end
end
