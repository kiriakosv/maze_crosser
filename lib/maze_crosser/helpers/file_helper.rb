module MazeCrosser
  # Module containing utilities for files.
  module FileHelper
    def self.file_to_array(file)
      File.readlines(file).map { |line| line.strip.split('') }
    end
  end
end
