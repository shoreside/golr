golr
====

Ruby implementation of GOL, initiated at Global Day of Coderetreat 2012

[![Build Status](https://travis-ci.org/mkrogemann/golr.png)](https://travis-ci.org/mkrogemann/golr)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/mkrogemann/golr)

Next

- improve (split) grid_matcher
- add more examples (dying population, ...)
- eliminate set_alive message
- make board 'infinite'
- Visualization
- Performance

# Changelog

- rename gem to golr
- rename github repo to golr
- add cucumber to do more outside-in testing
- add .rvmrc

## 0.3.0
- there is now an rspec matcher for grids (cell states)
- simple initialization via Array of Strings (coordinates of living cells)
- API smoothing (evolve expects no args and returns game itself)

## 0.2.0
- Gol is now a Ruby Gem

## 0.1.0
- Initial version, initiated at Global Day of CodeRetreat then polished and tagged a couple of weeks after the event
