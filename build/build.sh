#!/bin/bash -l

# this script is here to be used by Go and similar CI/CD products. It may at some point be replaced by a Rakefile.

rvm use 1.9.3@golr --create
bundle
[ -d rspec ] && rm -rf rspec
bundle exec rspec --out rspec/rspec.xml --format html --out rspec/rspec.html

[ -d cukeresults ] && rm -rf cukeresults
bundle exec cucumber --format junit --out cukeresults --no-source