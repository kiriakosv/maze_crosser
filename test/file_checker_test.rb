require 'test_helper'

class FileCheckerTest < Minitest::Test
  def setup
    @file_checker = Object.new
    @file_checker.extend(MazeCrosser::FileChecker)
  end

  def test_that_check_returns_the_file_if_there_is_one
    file_path = 'test/test_files/test_maze.txt'
    file = @file_checker.check file_path
    assert_equal file, file_path
  end

  def test_that_check_raises_error_if_a_non_existing_file_is_given
    assert_raises(ArgumentError) do
      @file_checker.check('unknown_file.txt')
    end
  end

  def test_that_check_raises_error_if_the_file_has_wrong_extension
    file_path = 'test/test_files/wrong_extension_file.txtt'
    assert_raises(ArgumentError) do
      @file_checker.check(file_path)
    end
  end
end
