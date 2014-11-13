require 'factory_girl/version'

Gem::Specification.new do |s|
  s.name          = %q{intervals_api}
  s.version       = IntervalsAPI::VERSION
  s.authors       = ['interactive@staplegun.us']
  s.date          = %q{2014-11-13'}
  s.summary       = %q{A RESTful wrapper around the Intervals API"}
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.license       = "GNU"
end
