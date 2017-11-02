module MazeCrosser
  # Module responsible for aplying basic maze validations.
  module BasicGridValidator
    ALLOWED_CHARACTERS = {
      empty: '_',
      start: 'S',
      goal: 'G',
      blocked: 'X'
    }.freeze

    def valid?(maze)
      only_valid_characters?(maze) && \
        one_start_and_one_end?(maze) && \
        rectangular?(maze)
    end

    private

    def only_valid_characters?(maze)
      maze.flatten.reject { |c| ALLOWED_CHARACTERS.values.include? c }.empty?
    end

    def one_start_and_one_end?(maze)
      flat_maze = maze.flatten

      flat_maze.count { |c| c == ALLOWED_CHARACTERS[:goal] } == 1 &&
        flat_maze.count { |c| c == ALLOWED_CHARACTERS[:start] } == 1
    end

    def rectangular?(maze)
      row_size = maze[0].size
      maze.select { |row| row.size == row_size }.size == maze.size
    end
  end
end
