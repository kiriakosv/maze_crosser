module MazeCrosser
  # Class responsible for applying resursive algorithm to a maze.
  #
  # recursive_algorithm = RecursiveAlgorithmRunner.new(maze)
  #
  # Run the algorithm
  # recursive_algorithm.run
  class RecursiveAlgorithmRunner
    def initialize(maze)
      @maze = maze
      @path = []
    end

    def run
      find_path(@maze.start)
      @path
    end

    private

    # This method is based on the recursive algorithm described in:
    # https://www.cs.bu.edu/teaching/alg/maze/
    # PROS: Easy to understand, simple implementation
    # CONS: Does not necessarily find the shortest path
    def find_path(coords)
      return false if dead_end?(coords)

      if goal_found?(coords)
        @path << coords
        return true
      end

      # This cell may actually be part of the solution, let's check
      @path << coords
      return true if valid_move_available?(coords)

      # Since we got here, this cell can't be part of the solution
      @path.pop
      false
    end

    def already_visited?(coords)
      @path.include?(coords)
    end

    def out_of_bounds?(coords)
      !@maze.inside_grid?(coords)
    end

    def blocked?(coords)
      @maze.blocked_cell?(coords)
    end

    def dead_end?(coords)
      out_of_bounds?(coords) ||
        blocked?(coords) ||
        already_visited?(coords)
    end

    def goal_found?(coords)
      coords == @maze.goal
    end

    def valid_move_available?(coords)
      return true if move_north(coords) ||
                     move_south(coords) ||
                     move_east(coords) ||
                     move_west(coords)
    end

    def move_north(coords)
      find_path([coords[0] - 1, coords[1]])
    end

    def move_south(coords)
      find_path([coords[0] + 1, coords[1]])
    end

    def move_east(coords)
      find_path([coords[0], coords[1] + 1])
    end

    def move_west(coords)
      find_path([coords[0], coords[1] - 1])
    end
  end
end
