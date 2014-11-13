require './lib/intervals_api/version'

Gem::Specification.new do |s|
  s.name          = %q{intervals_api}
  s.version       = IntervalsAPI::VERSION
  s.authors       = ['interactive@staplegun.us']
  s.date          = Time.now.utc.strftime("%Y-%m-%d")
  s.summary       = %q{A RESTful wrapper around the Intervals API"}
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.license       = "GNU"
end
