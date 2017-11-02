require_relative 'basic_grid_validator'

module MazeCrosser
  # Class responsible for representing a maze.
  #
  # maze = Maze.new(grid)
  #
  # Check if the coordinates are inside the grid
  # maze.inside_grid? [4, 2]
  #
  # Check if a cell is blocked
  # maze.blocked_cell? [4, 2]
  class Maze
    include MazeCrosser::BasicGridValidator

    attr_reader :grid,
                :number_of_rows,
                :number_of_columns,
                :start,
                :goal

    def initialize(grid)
      raise ArgumentError, 'Invalid maze' unless valid? grid

      @grid = grid
      set_dimensions
      set_start
      set_goal
    end

    def inside_grid?(coordinates)
      coordinates[0].between?(0, @number_of_rows - 1) && \
        coordinates[1].between?(0, @number_of_columns - 1)
    end

    def blocked_cell?(coordinates)
      @grid[coordinates[0]][coordinates[1]] == ALLOWED_CHARACTERS[:blocked]
    end

    private

    def set_dimensions
      @number_of_rows = @grid.size
      @number_of_columns = @grid[0].size
    end

    def set_start
      @start = [
        r = @grid.index { |row| row.include? ALLOWED_CHARACTERS[:start] },
        @grid[r].index(ALLOWED_CHARACTERS[:start])
      ]
    end

    def set_goal
      @goal = [
        r = @grid.index { |row| row.include? ALLOWED_CHARACTERS[:goal] },
        @grid[r].index(ALLOWED_CHARACTERS[:goal])
      ]
    end
  end
end
