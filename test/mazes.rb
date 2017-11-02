module Mazes
  VALID_MAZE = [
    %w[S X X X X X],
    %w[_ _ _ _ _ X],
    %w[X _ X X X X],
    %w[X _ X X X X],
    %w[_ _ _ X _ G],
    %w[X X _ _ _ X]
  ].freeze

  UNSOLVABLE_MAZE = [
    %w[S _ _],
    %w[X X _],
    %w[_ G X],
    %w[X X X]
  ].freeze

  INVALID_CHARACTER_MAZE = [
    %w[_ _ K],
    %w[_ _ G],
    %w[X S X]
  ].freeze

  MAZE_WITHOUT_START = [
    %w[_ _ _],
    %w[_ _ G],
    %w[_ _ X]
  ].freeze

  NON_RECTANGULAR_MAZE = [
    %w[_ _ _],
    %w[_ _ G _],
    %w[_ _ X]
  ].freeze
end
