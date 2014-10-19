Gem::Specification.new do |s|
  s.name        = 'bstats'
  s.version     = '1.0.0'
  s.date        = '2014-10-17'
  s.summary     = 'Baseball Statistics Analysis Tool'
  s.description = 'A ruby gem that takes a couple CSVs and does a bit of numbers crunching to generate a few statistics.'
  s.author     	= 'Troy Stauffer'
  s.email       = 'troystauffer@gmail.com'
  s.files       = Dir["{bin,db,lib,spec}/**/*"] + %w(Gemfile README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'bstats' ]
  s.required_ruby_version = '>=2.0'
end