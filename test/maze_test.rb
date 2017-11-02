require 'test_helper'
require 'mazes'

class MazeTest < Minitest::Test
  include Mazes

  def setup
    @maze = MazeCrosser::Maze.new(VALID_MAZE)
  end

  def test_that_dimensions_are_set_correctly_after_maze_initialization
    assert_equal @maze.number_of_rows, 6
    assert_equal @maze.number_of_columns, 6
  end

  def test_that_blocked_cell_returns_true_for_a_blocked_cell
    assert @maze.blocked_cell?([3, 0])
  end

  def test_that_blocked_cell_returns_false_for_a_free_cell
    refute @maze.blocked_cell?([1, 1])
  end

  def test_that_start_is_set_correctly_after_maze_initialization
    assert_equal @maze.start, [0, 0]
  end

  def test_that_goal_is_set_correctly_after_maze_initialization
    assert_equal @maze.goal, [4, 5]
  end

  def test_that_inside_grid_returns_true_for_a_cell_that_is_inside_the_maze
    assert @maze.send(:inside_grid?, [2, 2])
  end

  def test_that_inside_grid_returns_false_for_a_cell_that_is_outside_the_maze
    refute @maze.send(:inside_grid?, [6, 1])
  end
end
