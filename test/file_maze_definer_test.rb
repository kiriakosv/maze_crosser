require 'test_helper'

class FileMazeDefinerTest < Minitest::Test
  def setup
    @maze_definer = Object.new
    @maze_definer.extend(MazeCrosser::FileMazeDefiner)
  end

  def test_that_define_returns_a_grid_in_the_form_of_an_array
    maze = @maze_definer.define('test/test_files/test_maze.txt')
    assert_equal maze.class, Array
  end
end
