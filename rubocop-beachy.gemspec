lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/beachy/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-beachy'
  spec.version       = RuboCop::Beachy::VERSION
  spec.authors       = ['Josh Aronson']
  spec.email         = ['jparonson@gmail.com']

  spec.summary       = "Beachy's custom cops"
  spec.description   = 'A few style additions that we force on developers.'
  spec.homepage      = 'https://github.com/beachyapp/rubocop-beachy'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  unless spec.respond_to?(:metadata)
    fail('RubyGems >= 2.0 is required to protect against public gem pushes.')
  end

  spec.metadata['allowed_push_host'] = 'https://gems.beachyapp.com'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
