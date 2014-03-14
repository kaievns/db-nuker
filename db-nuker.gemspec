# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + '/lib/db_nuker'

Gem::Specification.new do |gem|
  gem.name          = "db-nuker"
  gem.version       = DBNuker::VERSION

  gem.authors       = ["Nikolay Nemshilov"]
  gem.email         = ['nemshilov@gmail.com']
  gem.description   = "An awesome db nuker"
  gem.summary       = "An awesome db nuker. FTW"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
end
