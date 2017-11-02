module MazeCrosser
  # Class responsible for maintaining a cache of already solved mazes.
  #
  # cache_provider = CacheProvider.new
  #
  # Add solution to cache
  # cache_provider.add(grid, solution)
  #
  # Get a solution
  # cache_provider.get_solution(grid)
  #
  # Empty cache
  # cache_provider.empty_cache!
  class CacheProvider
    def initialize(solutions = {})
      @solutions = solutions
    end

    def add(grid, solution)
      @solutions[grid] = solution
    end

    def get_solution(grid)
      @solutions[grid]
    end

    def empty_cache!
      @solutions = {}
    end
  end
end
