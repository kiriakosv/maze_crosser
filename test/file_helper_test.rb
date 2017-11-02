require 'test_helper'

class FileHelperTest < Minitest::Test
  def test_that_file_to_array_returns_a_correct_two_dimensional_array
    file = 'test/test_files/test_maze.txt'
    result = MazeCrosser::FileHelper.file_to_array(file)
    expected_array = [
      %w[_ _ _ S X],
      %w[X X X _ X],
      %w[G _ _ _ X],
      %w[X X _ X X]
    ]
    assert_equal result, expected_array
  end
end
