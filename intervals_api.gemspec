require './lib/intervals_api/version'

Gem::Specification.new do |s|
  s.name          = %q{intervals_api}
  s.version       = IntervalsAPI::VERSION
  s.authors       = ['interactive@staplegun.us']
  s.date          = Time.now.utc.strftime("%Y-%m-%d")
  s.summary       = %q{A RESTful wrapper around the Intervals API}
  s.homepage      = "https://github.com/Staplegun-US/intervals_api"
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.license       = "GPL"

  s.add_runtime_dependency 'recursive-open-struct', '~> 0.5', '>= 0.5.0'
  s.add_runtime_dependency 'httparty', '~> 0.13', '>= 0.13.1'
end
