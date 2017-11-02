require_relative 'file_checker'
require_relative 'helpers/file_helper'

module MazeCrosser
  # Module that contains a utilities for defining a maze grid from a file.
  module FileMazeDefiner
    include MazeCrosser::FileChecker

    def define(file)
      file = check(file)
      MazeCrosser::FileHelper.file_to_array(file)
    end
  end
end
