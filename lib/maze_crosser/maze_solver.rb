module MazeCrosser
  # Class responsible for solving a maze, by using a given algorithm or a
  # cache.
  #
  # maze_solver = MazeSolver.new(maze, algorithm, cache_provider)
  # maze_solver.solve
  class MazeSolver
    def initialize(maze, algorithm, cache_provider)
      @algorithm = algorithm
      @cache_provider = cache_provider
      @maze = maze
    end

    def solve
      if @cache_provider.get_solution(@maze.grid)
        return @cache_provider.get_solution(@maze.grid)
      end

      solution = @algorithm.run
      @cache_provider.add(@maze.grid, solution)
      solution
    end
  end
end
