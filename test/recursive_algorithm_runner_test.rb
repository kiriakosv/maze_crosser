require 'test_helper'
require 'mazes'

class RecursiveAlgorithmRunnerTest < Minitest::Test
  include Mazes

  def setup
    @valid_maze = MazeCrosser::Maze.new(VALID_MAZE)
    @unsolvable_maze = MazeCrosser::Maze.new(UNSOLVABLE_MAZE)
  end

  def test_that_run_returns_the_solution_path_if_there_is_one
    @recursive_algorithm = MazeCrosser::RecursiveAlgorithmRunner.new(@valid_maze)
    solution = @recursive_algorithm.run
    expected_solution = [
      [0, 0],
      [1, 0],
      [1, 1],
      [2, 1],
      [3, 1],
      [4, 1],
      [4, 2],
      [5, 2],
      [5, 3],
      [5, 4],
      [4, 4],
      [4, 5]
    ]
    assert_equal solution, expected_solution
  end

  def test_that_run_returns_an_empty_array_if_maze_does_not_have_a_solution
    @recursive_algorithm = MazeCrosser::RecursiveAlgorithmRunner.new(@unsolvable_maze)
    solution = @recursive_algorithm.run
    assert solution.empty?
  end
end
