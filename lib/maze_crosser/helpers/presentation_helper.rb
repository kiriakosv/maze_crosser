module MazeCrosser
  # Module containing utilities for presentation.
  module PresentationHelper
    def present_solution(solution)
      return 'The maze has no solution.' if solution.empty?
      "Solution: #{solution}"
    end
  end
end
