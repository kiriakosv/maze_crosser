require 'require_all'
require_relative 'file_maze_definer'
require_relative 'maze_solver'
require_relative 'helpers/presentation_helper'
require_relative 'maze'
require_rel 'algorithms'

module MazeCrosser
  # Class responsible for running the application.
  #
  # maze_crosser_runner = MazerRunner.new
  # maze_crosser_runner.run(file, algorithm)
  class MazeCrosserRunner
    include MazeCrosser::PresentationHelper
    include MazeCrosser::FileMazeDefiner

    def initialize(cache_provider)
      @cache_provider = cache_provider
    end

    def run(file = nil, algorithm = 'recursive')
      # When an additional grid import method is implemented (e.g. via CLI)
      # the following should be done:
      # 1) The line that raises ArgumentError should be removed
      # 2) Grid assignment should be moved to a private method
      raise ArgumentError, 'Please provide a file' unless file

      grid = define(file) if file

      maze = MazeCrosser::Maze.new(grid)
      algorithm = load_algorithm(algorithm, maze)
      present_solution(MazeSolver.new(maze, algorithm, @cache_provider).solve)
    end

    private

    def load_algorithm(algorithm, maze)
      # An alternative to this implementation would be to use metaprogramming
      # and dynamically initialize the correct algorithm runner. Having said
      # that, such an approach would be unsafe since it would involve the use
      # of eval.
      case algorithm
      when 'recursive'
        RecursiveAlgorithmRunner.new(maze)
      else
        raise ArgumentError, 'The algorithm does not exist.'
      end
    end
  end
end
