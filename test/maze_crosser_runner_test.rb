require 'test_helper'

class MazeCrosserRunnerTest < Minitest::Test
  def setup
    @maze_crosser_runner = MazeCrosser::MazeCrosserRunner.new(MazeCrosser::CacheProvider.new)
  end

  def test_that_maze_crosser_runner_returns_the_solution_if_all_the_inputs_are_valid
    answer = @maze_crosser_runner.run('test/test_files/test_maze.txt')
    assert_equal answer, 'Solution: [[0, 3], [1, 3], [2, 3], [2, 2], [2, 1], [2, 0]]'
  end

  def test_that_maze_crosser_runner_raises_argument_error_with_not_existing_algorithm
    assert_raises(ArgumentError) do
      @maze_crosser_runner.run('test/test_files/test_maze.txt', 'bfs')
    end
  end

  def test_that_maze_crosser_runner_raises_argument_error_with_not_existing_file
    assert_raises(ArgumentError) do
      @maze_crosser_runner.run('test/test_files/wrong_file.txt', 'recursive')
    end
  end
end
