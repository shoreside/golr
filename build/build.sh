#!/bin/bash -l

rvm use 1.9.3@golr --create
bundle
[ -d rspec ] && rm -rf rspec
rspec --out rspec/rspec.xml --format html --out rspec/rspec.html
