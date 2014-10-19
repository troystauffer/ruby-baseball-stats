Gem::Specification.new do |s|
  s.name        = 'bstats'
  s.version     = '0.0.1'
  s.date        = '2014-10-17'
  s.summary     = "Baseball Statistics Analysis Tool"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.author     	= "Troy Stauffer"
  s.email       = 'troystauffer@gmail.com'
  s.files       = Dir["{bin,db,lib,spec}/**/*"] + %w(Gemfile README.md stats.db)
end