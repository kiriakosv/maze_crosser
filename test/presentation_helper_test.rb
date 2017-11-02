require 'test_helper'

class PresentationHelperTest < Minitest::Test
  def setup
    @presentation_helper = Object.new
    @presentation_helper.extend(MazeCrosser::PresentationHelper)
  end

  def test_that_present_solution_returns_an_message_for_an_empty_array
    expected = 'The maze has no solution.'
    assert_equal @presentation_helper.present_solution([]), expected
  end

  def test_that_present_solution_returns_the_existing_solution_formatted
    expected = 'Solution: [[3, 2], [3, 1]]'
    assert_equal @presentation_helper.present_solution([[3, 2], [3, 1]]), expected
  end
end
