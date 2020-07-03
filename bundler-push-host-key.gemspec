Gem::Specification.new do |s|
  s.name    = 'bundler-push-host-key'
  s.authors = ['Christian Haase']

  s.version       = '1.0.0'
  s.date          = '2020-07-03'
  s.summary       = 'Use the correct api key when pushing gems'
  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
end
