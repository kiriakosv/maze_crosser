require 'maze_crosser/version'
require 'maze_crosser/maze_crosser_runner'
require 'maze_crosser/cache_provider'

@cache_provider = MazeCrosser::CacheProvider.new
@maze_crosser_runner = MazeCrosser::MazeCrosserRunner.new(@cache_provider)
