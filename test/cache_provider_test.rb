require 'test_helper'

class CacheProviderTest < Minitest::Test
  def setup
    @key = [
      %w[_ _ _ S X],
      %w[X X X _ X],
      %w[G _ _ _ X],
      %w[X X _ X X]
    ]
    @value = [[0, 3], [1, 3], [2, 3], [2, 2], [2, 1], [2, 0]]
    @cache_provider = MazeCrosser::CacheProvider.new(@key => @value)
  end

  def test_that_add_adds_the_key_value_pair_to_cache
    key = [
      %w[_ _ S X],
      %w[X X _ X],
      %w[G _ _ X]
    ]
    assert_nil @cache_provider.get_solution(key)

    value = [[0, 2], [1, 2], [2, 2], [2, 1], [2, 0]]
    @cache_provider.add(key, value)

    assert_equal @cache_provider.get_solution(key), value
  end

  def test_that_get_solution_returns_the_correct_solution
    assert_equal @cache_provider.get_solution(@key), @value
  end
end
