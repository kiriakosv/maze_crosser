require 'test_helper'
require 'mazes'

class MazeSolverTest < Minitest::Test
  include Mazes

  def setup
    maze = MazeCrosser::Maze.new(VALID_MAZE)
    cache_provider = MazeCrosser::CacheProvider.new
    algorithm = MazeCrosser::RecursiveAlgorithmRunner.new(maze)
    @maze_solver = MazeCrosser::MazeSolver.new(maze, algorithm, cache_provider)
  end

  def test_that_solve_returns_a_solution_as_an_array
    solution = @maze_solver.solve
    assert_equal solution.class, Array
  end
end
