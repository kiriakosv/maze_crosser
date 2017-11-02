require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'maze_crosser'
require 'maze_crosser/helpers/file_helper'
require 'maze_crosser/helpers/presentation_helper'
require 'maze_crosser/file_checker'
require 'maze_crosser/maze_crosser_runner'
require 'maze_crosser/maze_solver'
require 'maze_crosser/cache_provider'
require 'maze_crosser/basic_grid_validator'
require 'maze_crosser/algorithms/recursive_algorithm_runner'

require 'minitest/autorun'
