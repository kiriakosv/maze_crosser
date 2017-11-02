require 'test_helper'
require 'mazes'

class BasicGridValidatorTest < Minitest::Test
  include Mazes

  def setup
    @grid_validator = Object.new
    @grid_validator.extend(MazeCrosser::BasicGridValidator)
  end

  def test_that_valid_returns_false_if_array_contains_invalid_characters
    refute @grid_validator.valid? INVALID_CHARACTER_MAZE
  end

  def test_that_valid_returns_false_if_array_does_not_contain_a_starting_point
    refute @grid_validator.valid? MAZE_WITHOUT_START
  end

  def test_that_valid_returns_true_for_a_valid_maze
    assert @grid_validator.valid? VALID_MAZE
  end

  def test_that_only_valid_characters_returns_false_if_invalid_char_exists
    refute @grid_validator.send(:only_valid_characters?, INVALID_CHARACTER_MAZE)
  end

  def test_that_only_valid_characters_returns_true_if_no_invalid_char_exists
    assert @grid_validator.send(:only_valid_characters?, VALID_MAZE)
  end

  def test_that_one_start_and_one_end_returns_true_if_one_g_and_one_c
    assert @grid_validator.send(:one_start_and_one_end?, VALID_MAZE)
  end

  def test_that_one_start_and_one_end_returns_false_if_the_maze_has_no_start
    refute @grid_validator.send(:one_start_and_one_end?, MAZE_WITHOUT_START)
  end

  def test_that_rectangular_returns_false_if_maze_is_not_rectangular
    refute @grid_validator.send(:rectangular?, NON_RECTANGULAR_MAZE)
  end

  def test_that_rectangular_returns_true_if_maze_is_rectangular
    assert @grid_validator.send(:rectangular?, VALID_MAZE)
  end
end
