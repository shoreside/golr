# -*- encoding: utf-8 -*-
require File.expand_path('../lib/golr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Markus Krogemann"]
  gem.email         = ["markus@krogemann.de"]
  gem.description   = %q{Offers methods to initialize and evolve a grid of cells, implementing the rules of Conway's Game of Life}
  gem.summary       = %q{Conway's Game of Life}
  gem.homepage      = "https://github.com/mkrogemann/golr"

  gem.files         = Dir['lib/**/*.rb']
  gem.test_files    = []
  gem.name          = "golr"
  gem.require_paths = ["lib"]
  gem.version       = Golr::VERSION
  gem.add_development_dependency('rspec', '~> 2.12.0')
  gem.add_development_dependency('simplecov', '~> 0.7.1')
end
