# maze_crosser

[![Build Status](https://travis-ci.org/kiriakosv/maze_crosser.svg?branch=master)](https://travis-ci.org/kiriakosv/maze_crosser)
[![Coverage Status](https://coveralls.io/repos/github/kiriakosv/maze_crosser/badge.svg)](https://coveralls.io/github/kiriakosv/maze_crosser)
[![Maintainability](https://api.codeclimate.com/v1/badges/ade071d041026dd0928d/maintainability)](https://codeclimate.com/github/kiriakosv/maze_crosser/maintainability)

A simple 2D maze solving application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'maze_crosser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maze_crosser

## Usage

After installing the gem, open an irb prompt and type
```ruby
require 'maze_crosser'
```
You are now provided with two instance variables, @maze_crosser_runner and @cache_provider. You can use these as follows:
```ruby
# Empty the cache
@cache_provider.empty!

# Provide a path to a grid file and a solving algorithm. Currently, the only
# algorithm option is 'recursive' (set as default).
@maze_crosser_runner.run('path_to_file')
```
### Grid file
The grid file should have a .txt extension and follow the format below:
```
___SX
XXX_X
G___X
XX_XX
```
where:
* G: End goal
* S: Starting poing
* X: Blocked point
* _: Free point

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/load` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
